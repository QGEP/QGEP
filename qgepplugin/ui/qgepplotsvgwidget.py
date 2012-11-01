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
from PyQt4.QtCore import QUrl
from PyQt4.QtCore import pyqtSignal

class QgepPlotSVGWidget( QWidget ):
    webView = QWebView()
    frame = 0

    profileChanged = pyqtSignal( [str], name='profileChanged' )

    def __init__( self, parent = None ):
        QWidget.__init__( self, parent )
        
        self.profile = 0
        
        layout = QVBoxLayout( self )
        self.webView.load( QUrl( "/home/kk/.qgis/python/plugins/qgepplugin/d3js/index.html" ) )
        self.frame = self.webView.page().mainFrame()
        self.frame.javaScriptWindowObjectCleared.connect( self.initJs )
        self.webView.page().settings().setAttribute(QWebSettings.DeveloperExtrasEnabled, True)

        layout.addWidget( self.webView )

    def setProfile( self, profile ):
        self.profileChanged.emit( profile.asJson() )

    def initJs(self):
        self.frame.addToJavaScriptWindowObject( "profileProxy", self )
