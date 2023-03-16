#!/usr/bin/perl
use Try::Tiny;
use strict;
use warnings;
use Getopt::Long;
use Pod::Usage;
use DBI;
use Encode qw(encode decode);

Getopt::Long::Configure ("bundling");

# input argument
my $verbose = 0;
my $pgservice = "pg_qgep";
my $language;
my $man = 0;
my $help = 0;
my $description_width = 62;
my $inputfile;
my $outputdir;

# postgres connection
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
        "o|outdir=s" => \$outputdir,
        "pgservice=s" => \$pgservice,
        "w|width=s" => \$description_width,
        "v|verbose" => \$verbose,
        "h|help|?" => \$help,
        man => \$man
) or pod2usage("Error in command line.\n");

pod2usage(1) if $help;
pod2usage(-exitval => 0, -verbose => 2) if $man;

if (!@ARGV)
{
	pod2usage(-verbose => 0, -message => "\ndiagram_file: argument required\n")
}
else
{
	$inputfile = $ARGV[0];
}

$outputdir = "qgep_$language";

# ************************
# ************************
print " # Creating dictionaries...\n";

$dbh = DBI->connect("DBI:Pg:service=$pgservice", "", "", { RaiseError => 1,})
 or die "Could not connect to database !\n $! \n $@\n$DBI::errstr";

$prep = $dbh->prepare("SELECT tablename, name_$language AS translated FROM qgep.is_dictionary_od_table") or die $dbh->errstr;
$prep->execute() or die "Request failed\n";
while ( $row = $prep->fetchrow_hashref )
{
	$dict_od_table{$row->{tablename}}{translation} = $row->{translated};
	$dict_od_table{$row->{tablename}}{count} = 0;
}

$prep = $dbh->prepare("SELECT table_name, field_name, field_name_$language AS translated, \
	convert_to( left( field_description_$language, $description_width ), 'ISO 8859-15' ) AS description \
	FROM qgep.vw_dictionary_field") or die $dbh->errstr;
$prep->execute() or die "Request failed\n";
while ( $row = $prep->fetchrow_hashref )
{
	$dict_field{$row->{table_name}}{$row->{field_name}}{name} = $row->{translated};
	$dict_field{$row->{table_name}}{$row->{field_name}}{description} = $row->{description};
	$dict_field{$row->{table_name}}{$row->{field_name}}{count} = 0;
}

$prep = $dbh->prepare("SELECT vl_name AS table_name, code AS field_name, value_$language AS translated FROM qgep.is_dictionary_value_list") or die $dbh->errstr;
$prep->execute() or die "Request failed\n";
while ( $row = $prep->fetchrow_hashref )
{
	$dict_field{$row->{table_name}}{$row->{field_name}}{name} = $row->{translated};
	$dict_field{$row->{table_name}}{$row->{field_name}}{description} = "";
	$dict_field{$row->{table_name}}{$row->{field_name}}{count} = 0;
}


# ************************
# ************************
print " # Translating project file...\n";

my $newcontent;

open ( my $doc, '<:encoding(UTF-8)', $inputfile . '/qgep_base.qgs' ) || die "Could not open file $inputfile/qgep_base.qgs\n";

while ( my $line = <$doc> )
{
  # Replace table names
	while ( $line =~ /%%(.*)%%/g )
  {
		$table_name = $1;
		if ( $dict_od_table{$table_name} )
    {
			$dict_od_table{$table_name}{count}++;
				$replace = $dict_od_table{$table_name}{translation};
				$line =~ s/%%$table_name%%/$replace/g;
				print "  ! $table_name found in dictionary\n" if $verbose;
		}
    else
    {
			# TODO report non translated elements
			print "  * $table_name not found in dictionary\n";
		}
	}
  # Field names
  while ( $line =~ /%#(.*)#(.*)#(name|description)#%/g )
  {
    $table_name = $1;
    $field = $2;
    $type = $3;
    if ( $dict_field{$table_name}{$field}{$type} )
    {
      $dict_field{$table_name}{$field}{count}++;
      $replace = $dict_field{$table_name}{$field}{$type};
      $line =~ s/%#$table_name#$field#$type#%/$replace/g;
      print "  * $table_name $field $type found in dictionary \n" if $verbose;
    }
    else
    {
      # TODO report missing
      print "  ! $table_name $field $type not found in dictionary \n";
    }
  }
  # Replace language code
	while ( $line =~ /%;(.*);%/g )
  {
    $line =~ s/%;lang;%/$language/g;
  }
  $newcontent .= encode('UTF 8',"$line\n");
}

# ************************
# ************************
print " # Writing output file...\n";

mkdir $outputdir;
open(my $fh, '>', $outputdir . "/qgep_$language.qgs");
print $fh $newcontent;
close $fh;

# ************************
# ************************
__END__

=head1 NAME

translate_project.pl - Translation tool for the QGEP project

=head1 SYNOPSIS

    translate_project.pl [OPTIONS] project_directory

    Options:
         --help
         --man
         -l language,--language=language
         -o outdir,--output=outdir
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

=item B<-o outdir,--output=outdir>

Specifies the output directory. If not given, file is named as qgep_[language] in the current directory.

=item B<-w,--width>

Width of description columns in number of characters. Default is 62. 0 will not cut the description.

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
B<Matthias Kuhn>

=cut







