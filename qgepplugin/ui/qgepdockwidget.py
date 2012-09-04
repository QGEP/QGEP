# -*- coding: utf-8 -*-
#-----------------------------------------------------------
#
# Profile
# Copyright (C) 2012  Patrice Verchere
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

from PyQt4.QtCore import *
from PyQt4.QtGui import *

from qgis.core import *
from qgis.gui import *

from ui_qgepdockwidget import Ui_QgepDockWidget

try:
	from matplotlib import *
	import matplotlib
	matplotlib_loaded = True
except ImportError:
	matplotlib_loaded = False 

class QgepDockWidget(QDockWidget,Ui_QgepDockWidget):

	def __init__(self, parent, iface ):
		QDockWidget.__init__( self, parent )
		self.setAttribute( Qt.WA_DeleteOnClose )

		self.iface = iface

		self.setupUi(self)

	def showIt(self):
		#self.setLocation( Qt.BottomDockWidgetArea )
		self.location = Qt.BottomDockWidgetArea
		minsize = self.minimumSize()
		maxsize = self.maximumSize()
		self.setMinimumSize(minsize)
		self.setMaximumSize(maxsize)
		self.iface.mapCanvas().setRenderFlag(False)

		#TableWiew thing
		self.verticalLayout_plot = QVBoxLayout( self.frame_for_plot )
		self.verticalLayout_plot.setMargin(0)
		
		#The ploting area
		self.plotWidget = None
		#Draw the widget
		self.iface.addDockWidget(self.location, self)
		self.iface.mapCanvas().setRenderFlag(True)

	def closeEvent(self, event):
		self.emit( SIGNAL( "closed(PyQt_PyObject)" ), self )
		return QDockWidget.closeEvent( self, event )

	def addPlotWidget( self, plotWidget ):
		self.plotWidget = plotWidget
		self.verticalLayout_plot.addWidget( self.plotWidget )
		
		