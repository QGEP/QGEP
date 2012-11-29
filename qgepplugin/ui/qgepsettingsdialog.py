# -*- coding: utf-8 -*-
#-----------------------------------------------------------
#
# Profile
# Copyright (C) 2012  Matthias Kuhn
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

from ui_qgepsettingsdialog import Ui_QgepSettingsDialog
from PyQt4.QtCore import QSettings, pyqtSlot, QVariant
from PyQt4.QtGui import QDialog, QFileDialog
from qgis.core import QgsMapLayerRegistry, QgsProject

class QgepSettingsDialog(QDialog, Ui_QgepSettingsDialog):
    settings = QSettings()
    
    def __init__(self, parent=None):
        QDialog.__init__(self, parent)
        self.setupUi(self)
        
        project = QgsProject.instance()
        
        svgProfilePath = self.settings.value( "/QGEP/SvgProfilePath", None ).toString()
        if svgProfilePath != u'':
            self.mGbOverrideDefaultProfileTemplate.setChecked( True )
            self.mProfileTemplateFile.setText( svgProfilePath )
        else:
            self.mGbOverrideDefaultProfileTemplate.setChecked( False )
            
        develMode = self.settings.value( "/QGEP/DeveloperMode", QVariant( False ) ).toBool()
        self.mCbDevelMode.setChecked( develMode )
        
        lyrSpecialStructures, _ = project.readEntry( 'QGEP', 'SpecialStructureLayer' )
        lyrGraphEdges, _        = project.readEntry( 'QGEP', 'GraphEdgeLayer' )
        lyrGraphNodes, _        = project.readEntry( 'QGEP', 'GraphNodeLayer' )
        
        self.initLayerCombobox( self.mCbSpecialStructures, lyrSpecialStructures )
        self.initLayerCombobox( self.mCbGraphEdges, lyrGraphEdges )
        self.initLayerCombobox( self.mCbGraphNodes, lyrGraphNodes )
        
        self.mPbnChooseProfileTemplateFile.clicked.connect( self.onChooseProfileTemplateFileClicked)
        self.accepted.connect( self.onAccept )
        
    def initLayerCombobox(self,combobox, default):
        reg = QgsMapLayerRegistry.instance()
        for ( key, layer ) in reg.mapLayers().iteritems():
            combobox.addItem( layer.name(), key )
            
        idx = combobox.findData( default )
        if idx != -1:
            combobox.setCurrentIndex( idx )
        
    @pyqtSlot()
    def onChooseProfileTemplateFileClicked(self):
        fileName = QFileDialog.getOpenFileName(self, self.tr('Select profile template'), '', self.tr('HTML files(*.htm *.html)') )
        self.mProfileTemplateFile.setText( fileName )
        
    @pyqtSlot()
    def onAccept(self):
        # General settings
        if self.mGbOverrideDefaultProfileTemplate.isChecked() \
        and self.mProfileTemplateFile != '':
            self.settings.setValue( "/QGEP/SvgProfilePath", self.mProfileTemplateFile.text())
        else:
            self.settings.remove( "/QGEP/SvgProfilePath" )
        
        self.settings.setValue( "/QGEP/DeveloperMode", self.mCbDevelMode.checkState() )
        
        # Project specific settings
        project = QgsProject.instance()
        
        specialStructureIdx = self.mCbSpecialStructures.currentIndex()
        graphEdgeLayerIdx   = self.mCbGraphEdges.currentIndex()
        graphNodeLayerIdx   = self.mCbGraphNodes.currentIndex()
        
        project.writeEntry( 'QGEP', 'SpecialStructureLayer', self.mCbSpecialStructures.itemData( specialStructureIdx ).toString() )
        project.writeEntry( 'QGEP', 'GraphEdgeLayer',        self.mCbGraphEdges.itemData( graphEdgeLayerIdx ).toString() )
        project.writeEntry( 'QGEP', 'GraphNodeLayer',        self.mCbGraphNodes.itemData( graphNodeLayerIdx ).toString() )
