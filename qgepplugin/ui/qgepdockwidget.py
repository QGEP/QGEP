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

from PyQt4.QtCore import Qt, pyqtSignal
from PyQt4.QtGui import QDockWidget
from qgis.core import *
from qgis.gui import *
from ui_qgepdockwidget import Ui_QgepDockWidget



class QgepDockWidget( QDockWidget, Ui_QgepDockWidget ):
    # Signal emitted when the widget is closed
    closed = pyqtSignal()

    def __init__( self, parent, iface ):
        QDockWidget.__init__( self, parent )
        self.setAttribute( Qt.WA_DeleteOnClose )

        self.iface = iface

        self.setupUi( self )

    def showIt( self ):
        #self.setLocation( Qt.BottomDockWidgetArea )
        self.location = Qt.BottomDockWidgetArea
        minsize = self.minimumSize()
        maxsize = self.maximumSize()
        self.setMinimumSize( minsize )
        self.setMaximumSize( maxsize )
        self.iface.mapCanvas().setRenderFlag( False )

        self.iface.addDockWidget( self.location, self )
        self.iface.mapCanvas().setRenderFlag( True )

    def closeEvent( self, event ):
        self.closed.emit()
        return QDockWidget.closeEvent( self, event )

    def addPlotWidget( self, plotWidget ):
        self.plotWidget = plotWidget
        self.verticalLayoutForPlot.addWidget( self.plotWidget )
