#!/usr/bin/python3

from qgis.core import QgsProject, QgsApplication, QgsSettings

import sys
import os

# Init app
app = QgsApplication([], True)
app.setPrefixPath("/usr", True)
app.initQgis()

# Some debug setup
def printMessage(message, tag, level):
    print('{tag}: {message}'.format(tag=tag, message=message))

app.messageLog().messageReceived.connect(printMessage)

# Segmentize filename
localized_ts_filename = sys.argv[1]
project_path, ts_filename = os.path.split(localized_ts_filename)
basename, ext = os.path.splitext(ts_filename)
print('Translating ' + basename + '...')
try:
    project_basename, lang = basename.split('_')
except ValueError as e:
    print(basename)
    raise e

QgsSettings().setValue('locale/userLocale', lang);

project = QgsProject.instance()

project.read(os.path.join(project_path, project_basename + '.qgs'))
print(project.fileName())
project.write()

