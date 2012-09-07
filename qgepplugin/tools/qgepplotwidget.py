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

from PyQt4.QtGui import QWidget, QVBoxLayout, QPalette, QSizePolicy
from matplotlib.figure import Figure
from matplotlib.backends.backend_qt4agg import FigureCanvasQTAgg

class QgepPlotWidget( QWidget ):
	
	def __init__( self, parent = None ):
		QWidget.__init__( self, parent )
		
		self.profile = 0
		
		self.initCanvas()
		
		layout = QVBoxLayout( self )
		layout.addWidget( self.canvas )

	def setProfile( self, profile ):
		self.profile = profile
		self.initAxes()
		p = self.plotAxes.plot( profile.getOffsetArray(), profile.getMaslArray(), 'go-', label='line 1', linewidth=1.5 )
		self.plotAxes.ticklabel_format(style='plain')
		self.canvas.draw()

	def initCanvas(self):
		self.fig = Figure()
		rect = self.fig.patch
		
		# Background color
		bgCol = self.palette().color( QPalette.Background )
		rect.set_facecolor( ( bgCol.redF(), bgCol.greenF(), bgCol.blueF() ) )
		
		self.canvas = FigureCanvasQTAgg( self.fig )
		sizePolicy = QSizePolicy( QSizePolicy.Expanding, QSizePolicy.Expanding )
		sizePolicy.setHorizontalStretch( 0 )
		sizePolicy.setVerticalStretch( 0 )
		self.canvas.setSizePolicy( sizePolicy )
		
	def initAxes(self):
		self.fig.clear()
		self.plotAxes = self.fig.add_subplot( 111 )
		self.plotAxes.set_xbound( 0, 1000 )
		self.plotAxes.set_ybound( 0, 1000 )
		
	def export(self,filename):
		self.fig.savefig( filename, dpi=600)