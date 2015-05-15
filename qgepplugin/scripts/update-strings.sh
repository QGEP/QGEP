#!/bin/bash
FILES=`find . -regex ".*\(\.ui\|\.py\)$"`
pylupdate4 -noobsolete $FILES -ts i18n/qgepplugin_en.ts
lupdate-qt4 svgprofile -recursive -no-obsolete -extensions js -ts i18n/qgepplugin-js_en.ts

