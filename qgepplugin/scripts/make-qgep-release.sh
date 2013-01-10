#!/bin/bash
if [ ! -d qgepplugin ]
then
	echo "No directory qgepplugin found. Cowardly refusing operation. Please run from your QGEP directory."
	exit 0
fi

echo creating release $1
cd qgepplugin

LOCALES=( de fr )

for LOCALE in "${LOCALES[@]}"
do
    echo "Compiling translation for " $LOCALE
    lrelease-qt4 i18n/qgepplugin_$LOCALE.ts
done
 
echo "Cleaning files"
make clean
echo "Compiling files for release"
make

cd ..
sed -i "s/version=.*$/version=$1/" qgepplugin/metadata.txt
sed "s/__version__/$1/" <plugins.xml.template >plugins.xml
NOW=`date -Iseconds -u`
sed -i "s/__now__/$NOW/" plugins.xml
cat qgepplugin/release-files | zip qgepplugin-$1.zip -@
