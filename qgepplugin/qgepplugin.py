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
# with this progsram; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#
#---------------------------------------------------------------------

from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from qgis.gui import *


import resources
from ui.qgepdockwidget    import QgepDockWidget
from tools.qgepmaptools   import QgepProfileMapTool
from tools.qgepnetwork    import QgepNetworkAnalyzer
from tools.qgepplotwidget import QgepPlotWidget
from ui.qgepprintpreview  import QgepPrintPreview

class QgepPlugin:

    def __init__( self, iface ):
        self.iface = iface
        self.canvas = iface.mapCanvas()
        self.networkAnalyzer = 0
        self.reachLayer = 0
        self.nodeLayer = 0
        
        # Remember not to reopen the dock if there's already one opened
        self.dockWidget      = 0

    def initGui( self ):
        self.toolbarButtons = []
        
        # Create toolbar button
        self.profileAction = QAction( QIcon( ":/plugins/qgepplugin/icons/qgepIcon.svg" ), "Trace", self.iface.mainWindow() )
        self.profileAction.setWhatsThis( "Reach trace." )
        self.profileAction.setEnabled( False )
        self.profileAction.triggered.connect( self.profileToolClicked )
        self.aboutAction = QAction( "About", self.iface.mainWindow() )
        self.aboutAction.triggered.connect( self.about )

        # Add toolbar button and menu item
        self.iface.addToolBarIcon( self.profileAction )
        self.iface.addPluginToMenu( "&QGEP", self.profileAction )
        self.iface.addPluginToMenu( "&QGEP", self.aboutAction )
        
        self.toolbarButtons.append( self.profileAction )

		# Init the object maintaining the network
        self.networkAnalyzer = QgepNetworkAnalyzer( self.iface )
        # Create the map tool for profile selection
        self.profileTool     = QgepProfileMapTool( self.canvas, self.profileAction, self.networkAnalyzer )
        self.profileTool.profileChanged.connect( self.onProfileChanged )
        
        # Connect to events that can change layers
        QgsMapLayerRegistry.instance().layersWillBeRemoved.connect( self.layersWillBeRemoved )
        QgsMapLayerRegistry.instance().layersAdded.connect( self.layersAdded )
        
    def unload( self ):
        self.iface.removeToolBarIcon( self.profileAction )
        self.iface.removePluginMenu( "&QGEP", self.profileAction )
        self.iface.removePluginMenu( "&QGEP", self.aboutAction )

    # Is executed when the profile button is clicked
    def profileToolClicked( self ):
        self.openDock()
        # Set the profile map tool
        self.profileTool.setActive()

    def openDock(self):
        if self.dockWidget == 0:
            self.dockWidget = QgepDockWidget( self.iface.mainWindow(), self.iface )
            self.dockWidget.closed.connect( self.onDialogClosed )
            self.dockWidget.showIt()
            
            self.plotWidget = QgepPlotWidget( self.dockWidget )
            self.dockWidget.addPlotWidget( self.plotWidget )
            self.dockWidget.printButton.clicked.connect( self.onPrintClicked )

    
    # Gets called when a layer is removed    
    def layersWillBeRemoved( self, layerList ):
        for layerId in layerList:
            if 0!= self.networkAnalyzer.getNodeLayer():
                if self.networkAnalyzer.getNodeLayerId() == layerId:
                    self.networkAnalyzer.setNodeLayer( 0 )
                    self.layersChanged()
                
            if 0!= self.networkAnalyzer.getReachLayer(): 
                if self.networkAnalyzer.getReachLayerId() == layerId:
                    self.networkAnalyzer.setReachLayer( 0 )
                    self.layersChanged()
                    
    # Gets called when a layer is added
    def layersAdded( self, layers ):
        for newLayer in layers:
            if newLayer.type() == QgsMapLayer.VectorLayer and newLayer.name() == "vw_reach_point":
                self.networkAnalyzer.setNodeLayer( newLayer )
                self.layersChanged()

            if newLayer.type() == QgsMapLayer.VectorLayer and newLayer.name() == "Haltung":
                self.networkAnalyzer.setReachLayer( newLayer )
                self.layersChanged()
                
    def layersChanged( self ):
        buttonsEnabled = False
        
        if self.networkAnalyzer.getNodeLayer() and self.networkAnalyzer.getReachLayer():
            buttonsEnabled = True
            
        for button in self.toolbarButtons:
            button.setEnabled( buttonsEnabled )
            
    def onProfileChanged( self, profile ):
        if self.plotWidget:
            self.plotWidget.setProfile( profile )
            
    def onPrintClicked( self ):
        printPreview = QgepPrintPreview( self.dockWidget, self.plotWidget.profile )
        printPreview.setModal( True )
        printPreview.show() 
        
#***************************** open and quit options *******************************************

    def onDialogClosed( self ):        #used when Dock dialog is closed
        self.dockWidget = 0

    def about( self ):
        from ui.ui_dlgabout import DlgAbout
        DlgAbout( self.iface.mainWindow() ).exec_()
