# -*- coding: utf-8 -*-
#-----------------------------------------------------------
#
# Qgep
# Copyright (C) 2014  Matthias Kuhn
#-----------------------------------------------------------
#
# licensed under the terms of GNU GPL 2
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, print to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#
#---------------------------------------------------------------------

from PyQt4.QtGui import (QDockWidget)
from PyQt4.QtCore import pyqtSlot
from ui_qgepwizard import Ui_QgepDockWidget
from qgepplugin.utils.qgeplayermanager import QgepLayerManager
from qgepplugin.tools.qgepmaptooladdfeature import QgepMapToolAddReach
import logging

class QgepWizard( QDockWidget, Ui_QgepDockWidget ):
    logger = logging.getLogger( __name__ )

    def __init__(self,parent,iface):
        QDockWidget.__init__( self, parent )
        self.setupUi( self )
        self.layerComboBox.currentIndexChanged.connect( self.layerChanged )
        self.stateButton.clicked.connect(self.stateChanged)
        self.iface = iface

        self.mapToolAddReach = QgepMapToolAddReach(self.iface, QgepLayerManager.layer('vw_qgep_reach'))

    @pyqtSlot(int)
    def layerChanged(self,index):
        for lyr in [QgepLayerManager.layer('vw_qgep_cover'), QgepLayerManager.layer('vw_qgep_reach')]:
            lyr.commitChanges()

        if self.layerComboBox.currentText() == 'Wastewater Structure':
            lyr = QgepLayerManager.layer('vw_qgep_cover')
            lyr.startEditing()
            self.iface.setActiveLayer(lyr)
            self.iface.actionAddFeature().trigger()

        elif self.layerComboBox.currentText() == 'Reach':
            lyr = QgepLayerManager.layer('vw_qgep_reach')
            lyr.startEditing()
            self.iface.mapCanvas().setMapTool( self.mapToolAddReach )

    @pyqtSlot()
    def stateChanged(self):
        if self.stateButton.text() == 'Start Data Entry':
            self.layerComboBox.setEnabled(True)
            self.layerChanged(0)
            self.stateButton.setText( 'Stop Data Entry' )
        else:
            for lyr in [ QgepLayerManager.layer('vw_qgep_reach')
                       , QgepLayerManager.layer('vw_qgep_cover') ]:
                lyr.commitChanges()
                self.layerComboBox.setEnabled(False)
                self.stateButton.setText( 'Start Data Entry' )
