from PyQt4.QtGui import *
from qgepplugin.tools.qgepmaptooladdfeature import QgepMapToolDigitizeDrainageChannel

import qgis

DEBUGMODE=1

def geometryDigitized(feature, layer,tool):
    layer.changeGeometry(feature.id(), tool.geometry)
    layer.triggerRepaint()
    tool.deactivate()

def mapToolDeactivated(form,tool):
    if qgis.utils.plugins['qgepplugin'].iface.mapCanvas().mapTool() == tool:
        qgis.utils.plugins['qgepplugin'].iface.mapCanvas().unsetMapTool( tool )

    form.window().show()
    form.window().raise_()
    tool.deleteLater()

def digitizeDrainageChannel(form,feature,layer):
    tool = QgepMapToolDigitizeDrainageChannel(qgis.utils.plugins['qgepplugin'].iface, layer)
    qgis.utils.plugins['qgepplugin'].iface.mapCanvas().setMapTool( tool )
    tool.geometryDigitized.connect(
        lambda: geometryDigitized(feature,layer,tool)
    )
    form.window().hide()
    tool.deactivated.connect(
        lambda: mapToolDeactivated(form,tool)
    )

def manholeOpen(form,layer,feature):
    btn = form.findChildren(QPushButton, 'btn_digitize_drainage_channel')

    try:
        btn[0].clicked.disconnect()
    except TypeError:
        pass

    if feature.isValid():
        btn[0].clicked.connect(
            lambda: digitizeDrainageChannel(form,feature,layer)
        )
        btn[0].setEnabled(layer.isEditable())
        layer.editingStarted.connect(
            lambda: btn[0].setEnabled(True)
        )
        layer.editingStopped.connect(
            lambda: btn[0].setEnabled(False)
        )
    else:
        btn[0].setEnabled(False)