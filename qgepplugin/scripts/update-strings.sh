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
UPDATE=false
for LOCALE in $LOCALES
do
  TSFILE="i18n/qgepplugin_"$LOCALE".ts"
  TSMODTIME=$(stat -c %Y $TSFILE)
  if [ $NEWESTPY -gt $TSMODTIME ]
  then
    UPDATE=true
    break
  fi
done

if [ $UPDATE == true ]
then
  echo "Please provide translations by editing the translation files below:"
  for LOCALE in $LOCALES
  do
    echo "i18n/qgepplugin_"$LOCALE".ts"
    # Note we don't use pylupdate with qt .pro file approach as it is flakey about
    # what is made available.
    FILES=`find . -regex ".*\(\.ui\|\.py\)$"`
    echo "Updating .ts files with " $FILES
    pylupdate4 -noobsolete $FILES -ts i18n/qgepplugin_$LOCALE.ts
  done
else
  echo "No need to edit any translation files (.ts) because no python files has been updated since the last update translation. "
fi

