#!/usr/bin/python3

from qgis.core import QgsProject, QgsApplication

app = QgsApplication([], True)
app.setPrefixPath("/usr", True)
app.initQgis()
def printMessage(message, tag, level):
    print('{tag}: {message}'.format(tag=tag, message=message))
app.messageLog().messageReceived.connect(printMessage)

project = QgsProject.instance()

project.read('/usr/src/project/qgep.qgs')
project.generateTsFile('en')

