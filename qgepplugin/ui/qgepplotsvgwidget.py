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

from PyQt4.QtGui import QVBoxLayout, QWidget
from PyQt4.QtWebKit import QWebView, QWebSettings
from PyQt4.QtCore import QUrl, pyqtSignal, pyqtSlot, QSettings, QVariant, Qt

class QgepPlotSVGWidget( QWidget ):
    webView = None
    frame   = None
    profile = None
    verticalExaggeration = 10

    # Signals emitted triggered by javascript actions
    reachClicked = pyqtSignal( [str], name='reachClicked' )
    reachMouseOver = pyqtSignal( [str], name='reachMouseOver' )
    reachMouseOut = pyqtSignal( [str], name='reachMouseOut' )
    specialStructureClicked = pyqtSignal( [str], name='specialStructureClicked' )
    specialStructureMouseOver = pyqtSignal( [str], name='specialStructureMouseOver' )
    specialStructureMouseOut = pyqtSignal( [str], name='specialStructureMouseOut' )
    
    # Signals emitted for javascript
    profileChanged = pyqtSignal( [str], name='profileChanged' )
    verticalExaggerationChanged = pyqtSignal( [int], name='verticalExaggerationChanged' )
    
    def __init__( self, parent, networkAnalyzer, url = None ):
        QWidget.__init__( self, parent )
        
        self.webView = QWebView()
        
        self.networkAnalyzer = networkAnalyzer
        
        settings = QSettings()
        
        layout = QVBoxLayout( self )
        if url is None:
            url = settings.value( "/QGEP/SvgProfilePath", QVariant( u'qrc:///plugins/qgepplugin/svgprofile/index.html' ) )
            
        developerMode = settings.value( "/QGEP/DeveloperMode", QVariant( False ) ).toBool()
        
        if developerMode is True:
            self.webView.page().settings().setAttribute(QWebSettings.DeveloperExtrasEnabled, True)
        else:
            self.webView.setContextMenuPolicy( Qt.NoContextMenu )
            
        self.webView.load( QUrl( url.toString() ) )
        self.frame = self.webView.page().mainFrame()
        self.frame.javaScriptWindowObjectCleared.connect( self.initJs )

        layout.addWidget( self.webView )
        
    def setProfile( self, profile ):
        self.profile = profile
        # Forward to javascript
        self.profileChanged.emit( profile.asJson() )
            
    def initJs(self):
        self.frame.addToJavaScriptWindowObject( "profileProxy", self )
        
    def changeVerticalExaggeration(self, val):
        self.verticalExaggeration = val
        self.verticalExaggerationChanged.emit(val)
    
    @pyqtSlot( unicode )
    def onReachClicked(self, objId):
        self.reachClicked.emit( objId )
        
    @pyqtSlot( unicode )
    def onReachMouseOver(self, objId):
        self.reachMouseOver.emit( objId )
    
    @pyqtSlot( unicode )
    def onReachMouseOut(self, objId):
        self.reachMouseOut.emit( objId )
            
    @pyqtSlot( unicode )
    def onSpecialStructureClicked(self, objId):
        self.specialStructureClicked.emit( objId )
    
    @pyqtSlot( unicode )
    def onSpecialStructureMouseOver(self, objId):
        self.specialStructureMouseOver.emit( objId )
    
    @pyqtSlot( unicode )
    def onSpecialStructureMouseOut(self, objId):
        self.specialStructureMouseOut.emit( objId )
    
    # Is called from the webView when it's been reloaded and wants to have the
    # profile information resent
    @pyqtSlot()
    def updateProfile(self):
        if self.profile:
            self.profileChanged.emit( self.profile.asJson() )
            self.verticalExaggerationChanged.emit( self.verticalExaggeration )
            