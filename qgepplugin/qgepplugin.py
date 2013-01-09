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

from PyQt4.QtCore import pyqtSlot, QSettings
from PyQt4.QtGui import QAction, QIcon
from qgis.core import QgsMapLayerRegistry, QgsMapLayer, QgsProject
from tools.qgepmaptools import QgepProfileMapTool, QgepTreeMapTool
from tools.qgepnetwork import QgepGraphManager
from ui.qgepdockwidget import QgepDockWidget
from ui.qgepplotsvgwidget import QgepPlotSVGWidget
from ui.qgepsettingsdialog import QgepSettingsDialog
import resources #@UnusedImport needed to make icons etc. appear
import logging, os
from utils.QgepQgsLogHandler import QgepQgsLogHandler

LOGFORMAT     = '%(asctime)s:%(levelname)s:%(module)s:%(message)s'

class QgepPlugin:
    # The networkAnalyzer will manage the networklayers and pathfinding
    networkAnalyzer = None
    
    # Remember not to reopen the dock if there's already one opened
    dockWidget      = None
    
    # The layer ids the plugin will need
    edgeLayer             = None
    nodeLayer             = None
    specialStructureLayer = None
    
    profile = None

    #===============================================================================
    # Constructor
    #===============================================================================
    def __init__( self, iface ):
        self.iface = iface
        self.canvas = iface.mapCanvas()
        
        self.initLogger()
        
    def initLogger( self ):
        self.logger = logging.getLogger( __package__ )
        
        settings = QSettings()
        
        loglevel = settings.value( "/QGEP/LogLevel", 'Warning' ).toString()
        logfile  = settings.value( "/QGEP/LogFile", None )

        if hasattr( self.logger, 'qgepFileHandler' ):
            self.logger.removeHandler( self.logger.qgepFileHandler )
            del self.logger.qgepFileHandler

        self.logger.addHandler( QgepQgsLogHandler() )
        
        if logfile.isNull() is not True:
            hLog = logging.FileHandler( unicode( logfile.toString() ) )
            fmt = logging.Formatter( LOGFORMAT )
            hLog.setFormatter( fmt )
            self.logger.addHandler( hLog )
            self.logger.fileHandler = hLog

        if 'Debug'     == loglevel:
            self.logger.setLevel( logging.DEBUG )
        elif 'Info'    == loglevel:
            self.logger.setLevel( logging.INFO )
        elif 'Warning' == loglevel:
            self.logger.setLevel( logging.WARNING )
        elif 'Error'   == loglevel:
            self.logger.setLevel( logging.ERROR )
                
        fp = os.path.join( os.path.abspath(os.path.dirname( __file__ ) ), "metadata.txt")

        iniText = QSettings(fp, QSettings.IniFormat)
        verno = iniText.value("version").toString()

        self.logger.info( 'QGEP plugin version ' + verno + ' started' )
        
    #=======================================================================
    # Called to setup the plugin GUI
    #=======================================================================
    def initGui( self ):
        self.toolbarButtons = []
        
        # Create toolbar button
        self.profileAction = QAction( QIcon( ":/plugins/qgepplugin/icons/wastewater-profile.svg" ), "Profile", self.iface.mainWindow() )
        self.profileAction.setWhatsThis( "Reach trace." )
        self.profileAction.setEnabled( False )
        self.profileAction.setCheckable( True )
        self.profileAction.triggered.connect( self.profileToolClicked )

        self.downstreamAction = QAction( QIcon( ":/plugins/qgepplugin/icons/wastewater-downstream.svg" ), "Downstream", self.iface.mainWindow() )
        self.downstreamAction.setWhatsThis( "Downstream reaches" )
        self.downstreamAction.setEnabled( False )
        self.downstreamAction.setCheckable( True )
        self.downstreamAction.triggered.connect( self.downstreamToolClicked )

        self.upstreamAction = QAction( QIcon( ":/plugins/qgepplugin/icons/wastewater-upstream.svg" ), "Upstream", self.iface.mainWindow() )
        self.upstreamAction.setWhatsThis( "Upstream reaches" )
        self.upstreamAction.setEnabled( False )
        self.upstreamAction.setCheckable( True )
        self.upstreamAction.triggered.connect( self.upstreamToolClicked )
        
        self.aboutAction = QAction( "About", self.iface.mainWindow() )
        self.aboutAction.triggered.connect( self.about )
        
        self.settingsAction = QAction( 'Settings', self.iface.mainWindow() )
        self.settingsAction.triggered.connect( self.showSettings )

        # Add toolbar button and menu item
        self.iface.addToolBarIcon( self.profileAction )
        self.iface.addToolBarIcon( self.upstreamAction )
        self.iface.addToolBarIcon( self.downstreamAction )

        self.iface.addPluginToMenu( "&QGEP", self.profileAction )
        self.iface.addPluginToMenu( "&QGEP", self.settingsAction )
        self.iface.addPluginToMenu( "&QGEP", self.aboutAction )
        
        # Local array of buttons to enable / disable based on context
        self.toolbarButtons.append( self.profileAction )
        self.toolbarButtons.append( self.upstreamAction )
        self.toolbarButtons.append( self.downstreamAction )
        
        # Init the object maintaining the network
        self.networkAnalyzer = QgepGraphManager( self.iface )
        # Create the map tool for profile selection
        self.profileTool = QgepProfileMapTool( self.iface, self.profileAction, self.networkAnalyzer )
        self.profileTool.profileChanged.connect( self.onProfileChanged )
        
        self.upstreamTreeTool = QgepTreeMapTool( self.iface, self.upstreamAction, self.networkAnalyzer )
        self.upstreamTreeTool.setDirection( "upstream" )
        self.downstreamTreeTool = QgepTreeMapTool( self.iface, self.downstreamAction, self.networkAnalyzer )
        self.downstreamTreeTool.setDirection( "downstream" )
        
        # Connect to events that can change layers
        self.iface.projectRead.connect( self.onProjectRead )
        QgsMapLayerRegistry.instance().layersWillBeRemoved.connect( self.layersWillBeRemoved )
        QgsMapLayerRegistry.instance().layersAdded.connect( self.layersAdded )
        
    #===========================================================================
    # Called when unloading
    #===========================================================================
    def unload( self ):
        self.iface.removeToolBarIcon( self.profileAction )
        self.iface.removeToolBarIcon( self.upstreamAction )
        self.iface.removeToolBarIcon( self.downstreamAction )
        self.iface.removePluginMenu( "&QGEP", self.profileAction )
        self.iface.removePluginMenu( "&QGEP", self.aboutAction )

    #===========================================================================
    # Is executed when the profile button is clicked
    #===========================================================================
    def profileToolClicked( self ):
        self.openDock()
        # Set the profile map tool
        self.profileTool.setActive()
    
    #=======================================================================
    # Is executed when the user clicks the upstream search tool
    #=======================================================================
    def upstreamToolClicked(self):
        self.upstreamTreeTool.setActive()
        
    #===========================================================================
    # Is executed when the user clicks the downstream search tool
    #===========================================================================
    def downstreamToolClicked(self):
        self.downstreamTreeTool.setActive()

    #===========================================================================
    # Opens the dock
    #===========================================================================
    def openDock(self):
        if self.dockWidget is None:
            self.logger.debug( 'Open dock' )
            self.dockWidget = QgepDockWidget( self.iface.mainWindow(), self.iface.mapCanvas(), self.iface.addDockWidget )
            self.dockWidget.closed.connect( self.onDockClosed )
            self.dockWidget.showIt()
            
            self.plotWidget = QgepPlotSVGWidget( self.dockWidget, self.networkAnalyzer )
            self.plotWidget.specialStructureMouseOver.connect( self.highlightProfileElement )
            self.plotWidget.specialStructureMouseOut.connect( self.unhighlightProfileElement )
            self.plotWidget.reachMouseOver.connect( self.highlightProfileElement )
            self.plotWidget.reachMouseOut.connect( self.unhighlightProfileElement )
            self.dockWidget.addPlotWidget( self.plotWidget )

    #===========================================================================
    # Gets called when the dock is closed    
    #===========================================================================
    @pyqtSlot()
    def onDockClosed( self ):        #used when Dock dialog is closed
        self.dockWidget = None

    #===========================================================================
    # Gets called when a layer is removed    
    #===========================================================================
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
                    
    #===========================================================================
    # Gets called when a layer is added
    #===========================================================================
    def layersAdded( self, layers ):
        for newLayer in layers:
            if newLayer.type() == QgsMapLayer.VectorLayer and newLayer.id() == self.nodeLayer:
                self.networkAnalyzer.setNodeLayer( newLayer )
                self.layersChanged()

            if newLayer.type() == QgsMapLayer.VectorLayer and newLayer.id() == self.edgeLayer:
                self.networkAnalyzer.setReachLayer( newLayer )
                self.layersChanged()

            if newLayer.type() == QgsMapLayer.VectorLayer and newLayer.id() == self.specialStructureLayer:
                self.networkAnalyzer.setSpecialStructureLayer( newLayer )
                self.layersChanged()
                
    #===========================================================================
    # Gets called when the layers have changed
    #===========================================================================
    def layersChanged( self ):
        buttonsEnabled = False
        
        if self.networkAnalyzer.getNodeLayer() \
        and self.networkAnalyzer.getReachLayer():
            buttonsEnabled = True
            
        for button in self.toolbarButtons:
            button.setEnabled( buttonsEnabled )
    
    #===========================================================================
    # Gets called when a new project gets loaded
    #===========================================================================
    @pyqtSlot()
    def onProjectRead( self ):
        project = QgsProject.instance()
        
        specialStructureLayer = project.readEntry( 'QGEP', 'SpecialStructureLayer' )
        graphEdgeLayer        = project.readEntry( 'QGEP', 'GraphEdgeLayer' )
        graphNodeLayer        = project.readEntry( 'QGEP', 'GraphNodeLayer' )
        
        if graphNodeLayer[1] is not False:
            self.nodeLayer = graphNodeLayer[0]
        else:
            self.nodeLayer = None
            
        if graphEdgeLayer[1] is not False:
            self.edgeLayer = graphEdgeLayer[0]
        else:
            self.edgeLayer = None
        
        if specialStructureLayer[1] is not False:
            self.specialStructureLayer = specialStructureLayer[0]
        else:
            self.specialStructureLayer = None
        
        if self.nodeLayer is not None  \
        and self.edgeLayer is not None \
        and self.specialStructureLayer is not None:
            reg = QgsMapLayerRegistry.instance()
            self.layersAdded( [layer for layer in reg.mapLayers().itervalues()] )
        else:
            if self.dockWidget is not None:
                self.dockWidget.close()
        
    #===========================================================================
    # The profile changed: update the plot
    #===========================================================================
    
    def onProfileChanged( self, profile ):
        self.profile = profile.copy()
        
        if self.plotWidget:
            self.plotWidget.setProfile( profile )
            
    @pyqtSlot( unicode )
    def highlightProfileElement( self, objId ):
        if self.profile is not None:
            self.profile.highlight( unicode( objId ) )
            
    def unhighlightProfileElement( self ):
        if self.profile is not None:
            self.profile.highlight( None )

    def about( self ):
        from ui.dlgabout import DlgAbout
        DlgAbout( self.iface.mainWindow() ).exec_()

    def showSettings(self):
        settingsDlg = QgepSettingsDialog( self.iface.mainWindow() )
        settingsDlg.exec_()