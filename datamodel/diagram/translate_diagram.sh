#!/bin/bash
# ----------
# Denis Rouzaud
# 12.02.2015
# ----------
#
# Translation of the schema diagram in PDF
#
# Translation are read from the database:
#    table names: table qgep.is_dictionnary
#    fiels of OD tables: fake table at the moment (read the comments of the fields)
#    value lists: directly from qgep.vl_*
#    
# run: bash translate_diagram.sh LANG FILE
# LANG: language: en / fr / fr
# FILE: PDF file to translate
#
# for example: bash translate_diagram.sh fr 9925_17_mut_150212.pdf
#
# TODO: report number of translated and not translated elements
#
# ---------

export PGSERVICE=qgep

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
pdftk $2 output $TMPFOLDER/uncompressed.pdf uncompress

#************************
# NAME OF TABLES
# get is_dictionary table
echo "Translating table names..."
psql --no-align -c "SELECT tablename, name_$1 FROM qgep.is_dictionary" > $TMPFOLDER/od_table.tr
# remove first and last lines
tail -n +2 $TMPFOLDER/od_table.tr | head -n -1 > $TMPFOLDER/od_table.tr.new && mv $TMPFOLDER/od_table.tr.new $TMPFOLDER/od_table.tr
# create shell script
awk -F\| '{print "sed -i -e \"s|\\$?\\$" $1 "|" $2 "|g\" .qgep_diagram_translation/uncompressed.pdf "}' $TMPFOLDER/od_table.tr > $TMPFOLDER/od_table.sh
bash $TMPFOLDER/od_table.sh

#************************
# FIELDS OF OD TABLES
echo "Translating fields of OD tables..."
psql --no-align -c "SELECT table_name, column_name, replace(field_$1,'\"','\\\"'), replace(comment_$1,'\"','\\\"') FROM ($ODTRTABLE) AS foo" > $TMPFOLDER/od_fields.tr
# remove first and last lines
tail -n +2 $TMPFOLDER/od_fields.tr | head -n -1 > $TMPFOLDER/od_fields.tr.new && mv $TMPFOLDER/od_fields.tr.new $TMPFOLDER/od_fields.tr
# create shell script
awk -F\| '{print "sed -i -e \"s|\\$\\\\\\#\\$" $1 "\\$" $2 "\\$name|" $3 "|g\" .qgep_diagram_translation/uncompressed.pdf && sed -i -e \"s|\\$\\\\\\#\\$" $1 "\\$" $2 "\\$description|" $4 "|g\" .qgep_diagram_translation/uncompressed.pdf"}' $TMPFOLDER/od_fields.tr > $TMPFOLDER/od_fields.sh
bash $TMPFOLDER/od_fields.sh

#************************
# VALUE LISTS
echo "Translating value lists..."
# Compute a UNION SELECT request to list all the value lists
LISTVLSQL="SELECT string_agg('SELECT '''||table_name||''' AS table_name, code, value_$1, abbr_$1 FROM qgep.'||table_name, ' UNION ')::text FROM information_schema.tables WHERE table_schema = 'qgep' AND table_name LIKE 'vl_%'"
LISTVL=$(psql -P t -P format=unaligned -c "$LISTVLSQL")
psql --no-align -c "SELECT table_name, code, value_$1, abbr_$1 FROM ($LISTVL) foo" > $TMPFOLDER/vl_list.tr
# remove first and last lines
tail -n +2 $TMPFOLDER/vl_list.tr | head -n -1 > $TMPFOLDER/vl_list.tr.new && mv $TMPFOLDER/vl_list.tr.new $TMPFOLDER/vl_list.tr
# create shell script
awk -F\| '{print "sed -i -e \"s|\\$\\\\\\#\\$" $1 "\\$" $2 "\\$name|" $3 "|g\" .qgep_diagram_translation/uncompressed.pdf "}' $TMPFOLDER/vl_list.tr > $TMPFOLDER/vl_list.sh
bash $TMPFOLDER/vl_list.sh


#************************
# recompress PDF
pdftk $TMPFOLDER/uncompressed.pdf output translated.pdf compress

#************************
# remove temporary files
rm -rf $TMPFOLDER


