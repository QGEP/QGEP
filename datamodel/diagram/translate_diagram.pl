#!/usr/bin/perl
use Try::Tiny;
use strict;
use warnings;
use Getopt::Long;
use Pod::Usage;
use DBI;

Getopt::Long::Configure ("bundling");

# input argument
my $outputfile = "";
my $verbose = 0;
my $pgservice = "qgep";
my $language;
my $man = 0;
my $help = 0;
my $diafile="";

# temporary files
my $tmpfile1 = ".~qgep_diagram_translate.1.svg";
my $tmpfile2 = ".~qgep_diagram_translate.2.svg";
my $fid;

# postgres connection
my $dbname = "qgep_demo";
my $host = "172.24.171.203";
my $port = "5432";
my $user = "sige";
my $password = "db4wat\$";
my $dbh;
my $prep;
my $row;

# dictionary arrays
my %dict_od_table = ();
my %dict_field = ();

# translation
my $table_name;
my $field;
my $replace;
my @fields;
my $type;
my $toreplace;


# ************************
# ************************
GetOptions (
		"l|language=s" => \$language,
        "o|output=s" => \$outputfile,
        "pgservice=s" => \$pgservice,
        "v|verbose" => \$verbose,
        "h|help|?" => \$help,
        man => \$man
) or pod2usage("Error in command line.\n");

pod2usage(1) if $help;
pod2usage(-exitval => 0, -verbose => 2) if $man;

if (!@ARGV) {
	pod2usage(-verbose => 0, -message => "\ndiagram_file: argument required\n")
}
else
{
	$diafile = $ARGV[0];
}


# ************************
# ************************
print "Transforming PDF diagram into editable SVG...\n";
try {
	my $cmd = "inkscape --without-gui --file=$diafile --export-plain-svg=$tmpfile1";
	system($cmd);
} catch {
	warn "could not run inkscape";
};


# ************************
# ************************
print "Creating dictionaries...\n";

$dbh = DBI->connect("DBI:Pg:dbname=$dbname;host=$host;port=$port", 
						$user, 
						$password, 
						{ RaiseError => 1,}
) or die "Could not connect to database !\n $! \n $@\n$DBI::errstr";

$prep = $dbh->prepare("SELECT tablename, name_$language AS translated FROM qgep.is_dictionary_od_table") or die $dbh->errstr;
$prep->execute() or die "Request failed\n";
while ( $row = $prep->fetchrow_hashref ) {
	$dict_od_table{$row->{tablename}}{translation} = $row->{translated}; 
	$dict_od_table{$row->{tablename}}{count} = 0;
}

$prep = $dbh->prepare("SELECT table_name, field_name, field_name_$language AS translated, field_description_$language AS description FROM qgep.is_dictionary_od_field") or die $dbh->errstr;
$prep->execute() or die "Request failed\n";
while ( $row = $prep->fetchrow_hashref ) {
	$dict_field{$row->{table_name}}{$row->{field_name}}{name} = $row->{translated}; 
	$dict_field{$row->{table_name}}{$row->{field_name}}{description} = $row->{description}; 
	$dict_field{$row->{table_name}}{$row->{field_name}}{count} = 0;
}

$prep = $dbh->prepare("SELECT vl_name AS table_name, code AS field_name, value_$language AS translated FROM qgep.is_dictionary_value_list") or die $dbh->errstr;
$prep->execute() or die "Request failed\n";
while ( $row = $prep->fetchrow_hashref ) {
	$dict_field{$row->{table_name}}{$row->{field_name}}{name} = $row->{translated}; 
	$dict_field{$row->{table_name}}{$row->{field_name}}{description} = ""; 
	$dict_field{$row->{table_name}}{$row->{field_name}}{count} = 0;
}



# ************************
# ************************
print "Translating file...\n";
open($fid, "> :encoding(UTF-8)", $tmpfile2) or die ("could not write output file.");
open(INFO, $tmpfile1) or die("Could not open temporary file.");
foreach $_ (<INFO>)  {
	while ( /(\$\?\$.*?(<|\s))/g ) {
		$table_name = substr $1, 3, -1;
		if ( $dict_od_table{$table_name} ){
			$dict_od_table{$table_name}{count}++;
			$replace = $dict_od_table{$table_name}{translation};
			$_ =~ s/\$\?\$$table_name/$replace/g;
		} else {
			# TODO report non translated elements
			print " table does not exists\n";
		}		
	}	
	while ( /(\$#\$.*?(<|\s))/g ) {
		@fields = split( '\$', substr $1, 0, -1);
		$table_name = $fields[2];
		$field = $fields[3];
		$type = $fields[4];
		if ( $dict_field{$table_name}{$field}{$type} ){
			$dict_field{$table_name}{$field}{count}++;
			$replace = $dict_field{$table_name}{$field}{$type};
			$_ =~ s/\$#\$$table_name\$$field\$$type/$replace/g;
			
		} else {
			# TODO report missing
			print " missing translation for $table_name $field $type \n";
		}
	}
	print $fid "$_\n";
}
close(INFO);
close $fid;

# ************************
# ************************
print "Writing output PDF file...\n";
try {
	my $cmd = "inkscape --without-gui --file=$tmpfile2 --export-pdf=output.pdf";
	system($cmd);
} catch {
	warn "could not run inkscape";
};


# ************************
# ************************
__END__

=head1 NAME

my-prog.pl - Customized mysqldump utility

=head1 SYNOPSIS
    
    translate_diagram.pl [OPTIONS] diagram_file
    
    Options:
         --help
         --man
         -l language,--language=language
         -o outfile,--output=outfile
         -p service,--pgservice=service
         -v,--verbose
 
=head1 OPTIONS

=over 8

=item B<--help>

Print a brief help message and exits.

=item B<--man>

Prints the manual page and exits.

=item B<-l language,--language=language>

Translates to the given language (en, fr or de).

=item B<-o outfile,--output=outfile>

Specifies the output file. If not given, input file will be overwritten.

=item B<-v,--verbose>

List all untranslated terms

=item B<-p service,--pgservice=service>

Set the postgres service name (qgep by default).

=back

=head1 DESCRIPTION

B<translate_diagram.pl> translates the diagram of QGEP schema.

Translation are read from the database:

	 * table names: qgep.is_dictionnary_od_table
	 * fiels of OD tables: qgep.is_dictionary_od_field
	 * value lists: qgep.is_dictionary_value_list

Table names, fields and value lists must be tagged with
special signs so they can be found and translated.
Text in (...) should be replaced:

	 * od table names     $?$(od_table_name)
	 * field names        $#$(od_table_name)$(field_name)$name
	 * field descriptions $#$(od_table_name)$(field_name)$description
	 * value lists        $#$(vl_table_name)$(key$name)

=head1 AUTHOR

B<Denis Rouzaud>

=cut







