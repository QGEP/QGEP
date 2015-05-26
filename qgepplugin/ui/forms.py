from PyQt4.QtGui import *
import qgis
from qgis.gui import QgsEditorWidgetWrapper

from ..tools.qgepmaptooladdfeature import QgepMapToolDigitizeDrainageChannel

DEBUGMODE = 1


def geometryDigitized(feature, layer, tool):
    layer.changeGeometry(feature.id(), tool.geometry)
    layer.triggerRepaint()
    tool.deactivate()


def mapToolDeactivated(form, tool):
    if qgis.utils.plugins['qgepplugin'].iface.mapCanvas().mapTool() == tool:
        qgis.utils.plugins['qgepplugin'].iface.mapCanvas().unsetMapTool(tool)

    form.window().show()
    form.window().raise_()
    tool.deleteLater()


def digitizeDrainageChannel(form, feature, layer):
    tool = QgepMapToolDigitizeDrainageChannel(qgis.utils.plugins['qgepplugin'].iface, layer)
    qgis.utils.plugins['qgepplugin'].iface.mapCanvas().setMapTool(tool)
    tool.geometryDigitized.connect(
        lambda: geometryDigitized(feature, layer, tool)
    )
    form.window().hide()
    tool.deactivated.connect(
        lambda: mapToolDeactivated(form, tool)
    )


def manholeOpen(form, layer, feature):
    btn = form.findChild(QPushButton, 'btn_digitize_drainage_channel')

    try:
        btn.clicked.disconnect()
    except TypeError:
        pass

    if feature.isValid():
        btn.clicked.connect(
            lambda: digitizeDrainageChannel(form, feature, layer)
        )
        btn.setEnabled(layer.isEditable())

        enable_button = lambda: btn.setEnabled(True)
        disable_button = lambda: btn.setEnabled(False)

        layer.editingStarted.connect(
            enable_button
        )
        layer.editingStopped.connect(
            disable_button
        )
        form.destroyed.connect(lambda: layer.editingStarted.disconnect(enable_button))
        form.destroyed.connect(lambda: layer.editingStopped.disconnect(disable_button))
    else:
        btn.setEnabled(False)


def cover_ws_type_changed(form, feature, layer):
    tabs = form.findChild(QTabWidget)
    ws_type_selector = form.findChild(QComboBox, 'ws_type')

    ws_type = ws_type_selector.property('EWV2Wrapper').value()

    disabledtabs = ['Special Structure', 'Discharge Point', 'Infiltration Installation', 'Manhole']

    if 'manhole' == ws_type:
        disabledtabs.remove('Manhole')
    elif 'special_structure' == ws_type:
        disabledtabs.remove('Special Structure')
    elif 'discharge_point' == ws_type:
        disabledtabs.remove('Discharge Point')
    elif 'infiltration_installation' == ws_type:
        disabledtabs.remove('Infiltration Installation')


    for tabidx in range( tabs.count() ):
        if tabs.tabText(tabidx) in disabledtabs:
            tabs.setTabEnabled(tabidx, False)
        else:
            tabs.setTabEnabled(tabidx, True)

    # Needs to be done after every change as it triggers the recalculation of the tab offsets
    tabs.setStyleSheet('QTabBar::tab:disabled { width: 0; height: 0; margin: 0; padding: 0; border: none; }')

def vw_cover_open(form, layer, feature):
    ws_type_selector = form.findChild(QComboBox, 'ws_type')
    ws_type_selector.currentIndexChanged.connect(
        lambda: cover_ws_type_changed(form, feature, layer)
    )