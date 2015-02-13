#!/bin/bash
# ----------
# Denis Rouzaud
# 12.02.2015
# ----------

show_help() {
cat << EOF
Usage: ${0##*/} [-r] [-s PG_SERVICE] [-l LANGUAGE] [-o OUTFILE] [FILE]...

Translates the diagram of QGEP schema.
	-r			report translated and untranslated terms
	-s			specify Postgres service name (qgep by default)
	-l LANGUAGE	specify the language: en, fr or de.
	-o OUTFILE	specify output file (ovewrite existing otherwise)
	
	FILE		is the PDF file of the diagram

Translation are read from the database:
	* table names: table qgep.is_dictionnary
	* fiels of OD tables: fake table at the moment (read the comments of the fields)
	* value lists: directly from qgep.vl_*
 
Table names, fields and value lists must be tagged with
special signs so they can be found and translated.
Text in (...) should be replaced:
	* od table names	\$?\$(od_table_name)
	* field names		\$#(\$od_table_name)\$(field_name)\$name
	* field descriptions	\$#(\$od_table_name)\$(field_name)\$description
	* value lists		\$#\$(vl_table_name)\$(key)\$name
	
EOF
}

#
# TODO: report number of translated and not translated elements
#
# ---------


#************************
# PARSE ARGUMENTS
REPORT=0
OUTFILE=
export PGSERVICE=qgep

while getopts "l:rs:o:" opt; do
  case $opt in
    l)
      echo "Translate to: $OPTARG" >&2
      LANG=$OPTARG
      ;;
    r)
      REPORT=1
      ;;
    s)
      EXPORT PGSERVICE=$OPTARG
      ;;
    o)
      OUTFILE=$OPTARG
      ;;
    \?)
      echo "invalid option: -$OPTARG" >&2
      show_help
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      show_help
      exit 1
      ;;
  esac
done
shift "$((OPTIND-1))"
if [ -e "$1" ] 
then
	DIAFILE="$1"
	if [ "$OUTFILE" = "" ]
	then
		OUTFILE=$DIAFILE
	fi
else
	echo "File $1 does not exist"
	exit 1
fi

#************************
# Fake translation request (list all comments) until we have a proper translation table
ODTRTABLE="
SELECT 
  c.table_name,
  c.column_name,
  c.column_name AS field_en,
  c.column_name AS field_de,
  c.column_name AS field_fr,
  split_part(pgd.description,'/',1) AS comment_en,
  split_part(pgd.description,'/',2) AS comment_de,
  split_part(pgd.description,'/',3) AS comment_fr
FROM 
  pg_catalog.pg_statio_all_tables AS st
INNER JOIN pg_catalog.pg_description pgd ON (pgd.objoid=st.relid)
INNER JOIN information_schema.columns c ON (pgd.objsubid=c.ordinal_position
            AND c.table_schema=st.schemaname 
            AND c.table_name=st.relname 
            AND c.table_schema = 'qgep'
            AND c.table_name LIKE 'od_%')"
            
 

#************************
# temporary folder
TMPFOLDER=.qgep_diagram_translation # if change, also change in awk commands
mkdir -p $TMPFOLDER

#************************
# uncompress pdf
pdftk $DIAFILE output $TMPFOLDER/uncompressed.pdf uncompress

#************************
# NAME OF TABLES
# get is_dictionary table
echo "Translating table names..."
psql --no-align -c "SELECT tablename, name_$LANG FROM qgep.is_dictionary" > $TMPFOLDER/od_table.tr
# remove first and last lines
tail -n +2 $TMPFOLDER/od_table.tr | head -n -1 > $TMPFOLDER/od_table.tr.new && mv $TMPFOLDER/od_table.tr.new $TMPFOLDER/od_table.tr
# create shell script
awk -F\| '{print "sed -i -e \"s|\\$?\\$" $1 "|" $2 "|g\" .qgep_diagram_translation/uncompressed.pdf "}' $TMPFOLDER/od_table.tr > $TMPFOLDER/od_table.sh
bash $TMPFOLDER/od_table.sh

#************************
# FIELDS OF OD TABLES
echo "Translating fields of OD tables..."
psql --no-align -c "SELECT table_name, column_name, replace(field_$LANG,'\"','\\\"'), replace(comment_$LANG,'\"','\\\"') FROM ($ODTRTABLE) AS foo" > $TMPFOLDER/od_fields.tr
# remove first and last lines
tail -n +2 $TMPFOLDER/od_fields.tr | head -n -1 > $TMPFOLDER/od_fields.tr.new && mv $TMPFOLDER/od_fields.tr.new $TMPFOLDER/od_fields.tr
# create shell script
awk -F\| '{print "sed -i -e \"s|\\$\\\\\\#\\$" $1 "\\$" $2 "\\$name|" $3 "|g\" .qgep_diagram_translation/uncompressed.pdf && sed -i -e \"s|\\$\\\\\\#\\$" $1 "\\$" $2 "\\$description|" $4 "|g\" .qgep_diagram_translation/uncompressed.pdf"}' $TMPFOLDER/od_fields.tr > $TMPFOLDER/od_fields.sh
bash $TMPFOLDER/od_fields.sh

#************************
# VALUE LISTS
echo "Translating value lists..."
# Compute a UNION SELECT request to list all the value lists
LISTVLSQL="SELECT string_agg('SELECT '''||table_name||''' AS table_name, code, value_$LANG, abbr_$LANG FROM qgep.'||table_name, ' UNION ')::text FROM information_schema.tables WHERE table_schema = 'qgep' AND table_name LIKE 'vl_%'"
LISTVL=$(psql -P t -P format=unaligned -c "$LISTVLSQL")
psql --no-align -c "SELECT table_name, code, value_$LANG, abbr_$LANG FROM ($LISTVL) foo" > $TMPFOLDER/vl_list.tr
# remove first and last lines
tail -n +2 $TMPFOLDER/vl_list.tr | head -n -1 > $TMPFOLDER/vl_list.tr.new && mv $TMPFOLDER/vl_list.tr.new $TMPFOLDER/vl_list.tr
# create shell script
awk -F\| '{print "sed -i -e \"s|\\$\\\\\\#\\$" $1 "\\$" $2 "\\$name|" $3 "|g\" .qgep_diagram_translation/uncompressed.pdf "}' $TMPFOLDER/vl_list.tr > $TMPFOLDER/vl_list.sh
bash $TMPFOLDER/vl_list.sh


#************************
# recompress PDF
pdftk $TMPFOLDER/uncompressed.pdf output $OUTFILE compress

#************************
# remove temporary files
rm -rf $TMPFOLDER


