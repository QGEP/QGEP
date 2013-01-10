#!/bin/bash
LOCALES=$*

# get newest .py file
TR='tr'  # Gettext alias marking translatable strings
NEWESTPY=0
PYTHONFILES=$(find . -name '*.py')
for PYTHONFILE in $PYTHONFILES
do
  PYTHONFILEMOD=$(stat -c %Y $PYTHONFILE)
  if [ $PYTHONFILEMOD -gt $NEWESTPY ]
  then
    NEWESTPY=$PYTHONFILEMOD
  fi
done

# Qt translation stuff
# for .ts file
# TODO: Extend for .js files or don't use at all
#UPDATE=false
#for LOCALE in $LOCALES
#do
#  TSFILE="i18n/qgepplugin_"$LOCALE".ts"
#  TSMODTIME=$(stat -c %Y $TSFILE)
#  if [ $NEWESTPY -gt $TSMODTIME ]
#  then
#    UPDATE=true
#    break
#  fi
#done

UPDATE=true

if [ $UPDATE == true ]
then
  echo "Please provide translations by editing the translation files below:"
  for LOCALE in $LOCALES
  do
    echo "i18n/qgepplugin_"$LOCALE".ts"
    # Note we don't use pylupdate with qt .pro file approach as it is flakey about
    # what is made available.
    FILES=`find . -regex ".*\(\.ui\|\.py\)$"`
    echo "Updating .ts files for .py and .ui files"
    pylupdate4 -noobsolete $FILES -ts i18n/qgepplugin_$LOCALE.ts
    echo "Updating .ts files for .js files"
    lupdate-qt4 svgprofile -recursive -no-obsolete -extensions js -ts i18n/qgepplugin-js_de.ts
  done
else
  echo "No need to edit any translation files (.ts) because no python files has been updated since the last update translation. "
fi

