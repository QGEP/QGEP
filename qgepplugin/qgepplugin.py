
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

import logging
import os
import resources #@UnusedImport needed to make icons etc. appear

from PyQt4.QtCore import pyqtSlot, QSettings, Qt
from PyQt4.QtGui import QAction, QIcon, QApplication
from tools.qgepmaptools import QgepProfileMapTool, QgepTreeMapTool
from tools.qgepnetwork import QgepGraphManager
from ui.qgepprofiledockwidget import QgepProfileDockWidget
from ui.qgepplotsvgwidget import QgepPlotSVGWidget
from ui.qgepsettingsdialog import QgepSettingsDialog
from ui.qgepwizard import QgepWizard
from utils.qgeplogging import QgepQgsLogHandler
from utils.translation import setupI18n
from utils.qgeplayermanager import QgepLayerNotifier

from qgis.gui import QgsMessageBar
from qgis.core import *
from PyQt4.QtSql import *

LOGFORMAT     = '%(asctime)s:%(levelname)s:%(module)s:%(message)s'

class QgepPlugin:
    '''
    A plugin for wastewater management
    http://www.github.com/qgep/QGEP
    '''
    # The networkAnalyzer will manage the networklayers and pathfinding
    networkAnalyzer = None
    
    # Remember not to reopen the dock if there's already one opened
    profileDock      = None

    # Wizard
    wizarddock = None
    
    # The layer ids the plugin will need
    edgeLayer             = None
    nodeLayer             = None
    specialStructureLayer = None
    networkElementLayer   = None
    
    profile = None

    def __init__( self, iface ):
        self.iface = iface
        self.canvas = iface.mapCanvas()
        
        self.initLogger()
        setupI18n()
        
    def tr( self, sourceText ):
        return QApplication.translate( 'QgepPlugin', sourceText )
        
    def initLogger( self ):
        '''
        Initializes the logger
        '''
        self.logger = logging.getLogger( __package__ )
        
        settings = QSettings()
        
        loglevel = settings.value( "/QGEP/LogLevel", 'Warning' )
        logfile  = settings.value( "/QGEP/LogFile", None )

        if hasattr( self.logger, 'qgepFileHandler' ):
            self.logger.removeHandler( self.logger.qgepFileHandler )
            del self.logger.qgepFileHandler

        self.logger.addHandler( QgepQgsLogHandler() )
        
        if logfile:
            hLog = logging.FileHandler( logfile )
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
        verno = iniText.value("version")

        self.logger.info( 'QGEP plugin version ' + verno + ' started' )
        
    def initGui( self ):
        '''
        Called to setup the plugin GUI
        '''
        self.network_layer_notifier = QgepLayerNotifier(self.iface.mainWindow(),['vw_network_node', 'vw_network_segment'])
        self.toolbarButtons = []
        
        # Create toolbar button
        self.profileAction = QAction( QIcon(":/plugins/qgepplugin/icons/wastewater-profile.svg"), self.tr("Profile"), self.iface.mainWindow())
        self.profileAction.setWhatsThis(self.tr("Reach trace"))
        self.profileAction.setEnabled( False )
        self.profileAction.setCheckable( True )
        self.profileAction.triggered.connect(self.profileToolClicked )

        self.downstreamAction = QAction( QIcon( ":/plugins/qgepplugin/icons/wastewater-downstream.svg"), self.tr("Downstream"), self.iface.mainWindow())
        self.downstreamAction.setWhatsThis( self.tr( "Downstream reaches" ) )
        self.downstreamAction.setEnabled( False )
        self.downstreamAction.setCheckable( True )
        self.downstreamAction.triggered.connect( self.downstreamToolClicked )

        self.upstreamAction = QAction( QIcon( ":/plugins/qgepplugin/icons/wastewater-upstream.svg"), self.tr("Upstream"), self.iface.mainWindow())
        self.upstreamAction.setWhatsThis( self.tr( "Upstream reaches" ) )
        self.upstreamAction.setEnabled( False )
        self.upstreamAction.setCheckable( True )
        self.upstreamAction.triggered.connect( self.upstreamToolClicked )

        self.wizardAction = QAction( QIcon( ":/plugins/qgepplugin/icons/wizard.svg" ), "Wizard", self.iface.mainWindow())
        self.wizardAction.setWhatsThis( self.tr( "Create new manholes and reaches" ) )
        self.wizardAction.setEnabled( False )
        self.wizardAction.setCheckable( True )
        self.wizardAction.triggered.connect( self.wizard )

        self.refreshNetworkTopologyAction = QAction( QIcon( ":/plugins/qgepplugin/icons/refresh-network.svg" ), "Refresh netwok topology", self.iface.mainWindow())
        self.refreshNetworkTopologyAction.setWhatsThis( self.tr("Refresh network topology"))
        self.refreshNetworkTopologyAction.setEnabled( False )
        self.refreshNetworkTopologyAction.setCheckable( False )
        self.refreshNetworkTopologyAction.triggered.connect( self.refreshNetworkTopologyActionClicked )

        
        self.aboutAction = QAction( self.tr( 'About' ), self.iface.mainWindow() )
        self.aboutAction.triggered.connect( self.about )
        
        self.settingsAction = QAction( self.tr( 'Settings' ), self.iface.mainWindow() )
        self.settingsAction.triggered.connect( self.showSettings )

        # Add toolbar button and menu item
        self.iface.addToolBarIcon( self.profileAction )
        self.iface.addToolBarIcon( self.upstreamAction )
        self.iface.addToolBarIcon( self.downstreamAction )
        self.iface.addToolBarIcon( self.wizardAction )
        self.iface.addToolBarIcon( self.refreshNetworkTopologyAction )

        self.iface.addPluginToMenu( "&QGEP", self.profileAction )
        self.iface.addPluginToMenu( "&QGEP", self.settingsAction )
        self.iface.addPluginToMenu( "&QGEP", self.aboutAction )
        
        # Local array of buttons to enable / disable based on context
        self.toolbarButtons.append( self.profileAction )
        self.toolbarButtons.append( self.upstreamAction )
        self.toolbarButtons.append( self.downstreamAction )
        self.toolbarButtons.append( self.wizardAction )
        self.toolbarButtons.append( self.refreshNetworkTopologyAction )

        self.network_layer_notifier.layersAvailable.connect(self.onLayersAvailable)
        self.network_layer_notifier.layersUnavailable.connect(self.onLayersUnavailable)

        # Init the object maintaining the network
        self.networkAnalyzer = QgepGraphManager( self.iface )
        # Create the map tool for profile selection
        self.profileTool = QgepProfileMapTool( self.iface, self.profileAction, self.networkAnalyzer )
        self.profileTool.profileChanged.connect( self.onProfileChanged )
        
        self.upstreamTreeTool = QgepTreeMapTool( self.iface, self.upstreamAction, self.networkAnalyzer )
        self.upstreamTreeTool.setDirection( "upstream" )
        self.downstreamTreeTool = QgepTreeMapTool( self.iface, self.downstreamAction, self.networkAnalyzer )
        self.downstreamTreeTool.setDirection( "downstream" )



    def unload( self ):
        '''
        Called when unloading
        '''
        self.iface.removeToolBarIcon( self.profileAction )
        self.iface.removeToolBarIcon( self.upstreamAction )
        self.iface.removeToolBarIcon( self.downstreamAction )
        self.iface.removeToolBarIcon( self.wizardAction )
        self.iface.removeToolBarIcon( self.refreshNetworkTopologyAction )

        self.iface.removePluginMenu( "&QGEP", self.profileAction )
        self.iface.removePluginMenu( "&QGEP", self.aboutAction )

    def onLayersAvailable(self,layers):
        for b in self.toolbarButtons:
            b.setEnabled(True)

        self.networkAnalyzer.setReachLayer( layers['vw_network_segment'] )
        self.networkAnalyzer.setNodeLayer( layers['vw_network_node'] )


    def onLayersUnavailable(self):
        for b in self.toolbarButtons:
            b.setEnabled(False)

    def profileToolClicked( self ):
        '''
        Is executed when the profile button is clicked
        '''
        self.openDock()
        # Set the profile map tool
        self.profileTool.setActive()
    
    def upstreamToolClicked( self ):
        '''
        Is executed when the user clicks the upstream search tool
        '''
        self.upstreamTreeTool.setActive()
        
    def downstreamToolClicked( self ):
        '''
        Is executed when the user clicks the downstream search tool
        '''
        self.downstreamTreeTool.setActive()

    def refreshNetworkTopologyActionClicked( self ):
        '''
        Is executed when the user clicks the refreshNetworkTopologyAction tool
        '''
        uri = QgsDataSourceURI(self.networkAnalyzer.getNodeLayer().dataProvider().dataSourceUri())

        db = QSqlDatabase.addDatabase("QPSQL") #Name of the driver -- doesn't change

        str_connect_option = "requiressl=0;service=" + uri.service()
        db.setConnectOptions(str_connect_option)

        if not db.open():
            self.iface.messageBar().pushMessage(self.tr("Warning"), db.lastError().text(), level=QgsMessageBar.CRITICAL)#  INFO = 0, WARNING = 1, CRITICAL = 2, SUCCESS = 3

        query_template = ("""REFRESH MATERIALIZED VIEW qgep.vw_network_segment;""")
        query = QSqlQuery(db)
        if not query.exec_(query_template):
            str_result = query.lastError().text()
            self.iface.messageBar().pushMessage(self.tr("Warning"), str_result, level=QgsMessageBar.CRITICAL)
        else:
            self.iface.messageBar().pushMessage(self.tr("Success"), "vw_network_segment successfully updated", level=QgsMessageBar.SUCCESS,duration = 2)


        query_template = ("""REFRESH MATERIALIZED VIEW qgep.vw_network_node;""")
        query = QSqlQuery(db)
        if not query.exec_(query_template):
            str_result = query.lastError().text()
            self.iface.messageBar().pushMessage(self.tr("Warning"), str_result, level=QgsMessageBar.CRITICAL)
        else:
            self.iface.messageBar().pushMessage(self.tr("Success"), "vw_network_node successfully updated", level=QgsMessageBar.SUCCESS, duration = 2)
        # recreate networkx graph
        self.networkAnalyzer.graph.clear()
        self.networkAnalyzer.createGraph()


    def wizard(self):
        '''

        :return:
        '''
        if not self.wizarddock:
            self.wizarddock = QgepWizard( self.iface.mainWindow(), self.iface )
        self.logger.debug( 'Opening Wizard' )
        self.iface.addDockWidget(Qt.LeftDockWidgetArea,self.wizarddock)
        self.wizarddock.show()

    def openDock( self ):
        '''
        Opens the dock
        '''
        if self.profileDock is None:
            self.logger.debug( 'Open dock' )
            self.profileDock = QgepProfileDockWidget( self.iface.mainWindow(), self.iface.mapCanvas(), self.iface.addDockWidget )
            self.profileDock.closed.connect( self.onDockClosed )
            self.profileDock.showIt()
            
            self.plotWidget = QgepPlotSVGWidget( self.profileDock, self.networkAnalyzer )
            self.plotWidget.specialStructureMouseOver.connect( self.highlightProfileElement )
            self.plotWidget.specialStructureMouseOut.connect( self.unhighlightProfileElement )
            self.plotWidget.reachMouseOver.connect( self.highlightProfileElement )
            self.plotWidget.reachMouseOut.connect( self.unhighlightProfileElement )
            self.profileDock.addPlotWidget( self.plotWidget )

    @pyqtSlot()
    def onDockClosed( self ):        #used when Dock dialog is closed
        '''
        Gets called when the dock is closed
        All the cleanup of the dock has to be done here
        '''
        self.profileDock = None

    def onProfileChanged( self, profile ):
        '''
        The profile changed: update the plot
        @param profile: The profile to plot
        '''
        self.profile = profile.copy()
        
        if self.plotWidget:
            self.plotWidget.setProfile( profile )
            
    @pyqtSlot( unicode )
    def highlightProfileElement( self, objId ):
        if self.profile is not None:
            self.profile.highlight( unicode( objId ) )
    
    @pyqtSlot()
    def unhighlightProfileElement( self ):
        if self.profile is not None:
            self.profile.highlight( None )

    def about( self ):
        from ui.dlgabout import DlgAbout
        DlgAbout( self.iface.mainWindow() ).exec_()

    def showSettings( self ):
        settingsDlg = QgepSettingsDialog( self.iface.mainWindow() )
        settingsDlg.exec_()
