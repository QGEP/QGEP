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
from matplotlib.ticker import ScalarFormatter
from matplotlib.backends.backend_qt4agg import FigureCanvasQTAgg
import matplotlib.lines as lines

class QgepPlotWidget( QWidget ):
    
    detailFields= [ 0 ]
    
    def __init__( self, parent = None ):
        QWidget.__init__( self, parent )
        
        self.profile = 0
        
        self.initCanvas()
        
        layout = QVBoxLayout( self )
        layout.addWidget( self.canvas )

    def setProfile( self, profile ):
        self.profile = profile.copy()
        self.initAxes()
        self.line, = self.profilePlot.plot( profile.getOffsetArray(), profile.getMaslArray(), 'go-', picker=5 )
        selector = HighlightSelected(self.line)
        # Add more information for each point
        for x in profile.getOffsetArray():
            self.profilePlot.axvline( x, linestyle='--', alpha=0.7, color='0.75' )
            self.detailPlot.axvline( x, linestyle='--', alpha=0.7, color='0.75' )
            self.detailPlot.text( x, 0, str( x ) )
        
        self.profilePlot.ticklabel_format(style='plain')
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
        self.canvas.mpl_connect('pick_event', self.onPick)
        
    def initAxes(self):
        self.fig.clear()
        self.profilePlot = self.fig.add_axes( ( 0.1, 0.5, 0.8, 0.4 ) )
        self.profilePlot.xaxis.set_ticks([])
        self.profilePlot.yaxis.set_major_formatter( ScalarFormatter() )
        self.detailPlot = self.fig.add_axes( ( 0.1, 0.1, 0.8, 0.4 ), sharex=self.profilePlot )
        self.detailPlot.set_ylim( 0, len( self.detailFields ) )
        self.detailPlot.yaxis.set_ticks([])
        
    def onPick( self, event ):
        if ( len( event.ind ) > 0 ):
            self.profile.getOffsetArray()
        
class HighlightSelected(lines.VertexSelector):
    def __init__(self, line, fmt='ro', **kwargs):
        lines.VertexSelector.__init__(self, line)
        self.markers, = self.axes.plot([], [], fmt, **kwargs)

    def process_selected(self, ind, xs, ys):
        self.markers.set_data(xs, ys)
        self.canvas.draw()