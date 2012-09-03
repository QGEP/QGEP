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
from ui.qgepdockwidget import QgepDockWidget
from tools.qgepmaptool import QgepMapTool
from tools.qgepnetwork import QgepNetworkAnalyzer
from tools.qgepprofile import QgepProfile
from tools.qgepplotwidget import QgepPlotWidget

import os
from os import *


class QgepPlugin:

	def __init__(self, iface):
		self.iface = iface
		self.canvas = iface.mapCanvas()
		self.networkAnalyzer = 0
		self.toolActivated = False
		self.reachLayer = 0
		self.nodeLayer = 0
		
	def initGui(self):
		# Create toolbar button
		self.action = QAction(QIcon(":/plugins/qgepplugin/icons/qgepIcon.svg"), "Trace", self.iface.mainWindow())
		self.action.setWhatsThis("Reach trace.")
		QObject.connect(self.action, SIGNAL("triggered()"), self.run)
		self.aboutAction = QAction("About", self.iface.mainWindow())
		QObject.connect(self.aboutAction, SIGNAL("triggered()"), self.about)

		# Add toolbar button and menu item
		self.iface.addToolBarIcon(self.action)
		self.iface.addPluginToMenu("&QGEP", self.action)
		QAction(QIcon(":/plugins/qgepplugin/icons/qgepIcon.png"), "Trace", self.iface.mainWindow())
		self.iface.addPluginToMenu("&QGEP", self.aboutAction)

		#Init class variables
		self.tool = QgepMapTool( self.canvas, self.action )
		self.selectedPathPoints = []
		self.dockOpened = False		#remember for not reopening dock if there's already one opened

	def unload(self):
		self.deactivate()
		self.iface.removeToolBarIcon(self.action)
		self.iface.removePluginMenu("&QGEP", self.action)
		self.iface.removePluginMenu("&QGEP", self.aboutAction)

	# Is executed when the main plugin button is clicked
	def run(self):
		# Check if the necessary layer for this tool is available 
		if self.checkForLayers() == False:
			return
		
		# If dock not already opened, open the dock and all the necessary thing (model,doProfile...)
		if self.dockOpened == False:
			self.wdg = QgepDockWidget( self.iface.mainWindow(), self.iface )
			self.wdg.showIt()

			self.plotWidget = QgepPlotWidget( self.wdg )

			QObject.connect( self.wdg, SIGNAL( "closed(PyQt_PyObject)" ), self.onDialogClosed )

			self.dockOpened = True
			
			self.wdg.addPlotWidget( self.plotWidget )
			
		# Connect mouse listeners
		self.connectTool()
		# We switch to our own map tool
		self.saveTool = self.canvas.mapTool()
		self.canvas.setMapTool( self.tool )
		# Init rubberband to visualize current status
		self.rbHelperLine = QgsRubberBand( self.canvas )
		self.rbHelperLine.setColor( QColor("#FFD900") )
		self.rbHelperLine.setWidth( 2 )
		
		self.rbShortestPath = QgsRubberBand( self.canvas ) 
		self.rbShortestPath.setColor( QColor("#FF9500") )
		self.rbShortestPath.setWidth( 3 )
		
		self.snapper = QgsSnapper( self.canvas.mapRenderer() )
		snapLayer = QgsSnapper.SnapLayer()
		snapLayer.mLayer = self.nodeLayer
		snapLayer.mTolerance = 10
		snapLayer.mUnitType = QgsTolerance.Pixels
		snapLayer.mSnapTo = QgsSnapper.SnapToVertex
		
		self.snapper.setSnapLayers( [snapLayer] )
		
		if self.networkAnalyzer == 0:
			self.networkAnalyzer = QgepNetworkAnalyzer( self.iface, self.reachLayer, self.nodeLayer )
			self.networkAnalyzer.createGraph()


#************************************* Mouse listener actions ***********************************************

	# Mouse moved: update helper line
	def moved(self,position):
		if len( self.selectedPathPoints ) > 0:
			self.rbHelperLine.reset()
			self.rbHelperLine.addPoint( self.selectedPathPoints[-1] )
			mousePos = self.canvas.getCoordinateTransform().toMapCoordinates(position["x"],position["y"])
			self.rbHelperLine.addPoint( mousePos )

	# Cancel any ongoing routing selection
	def rightClicked(self,position):
		self.selectedPathPoints = []
		self.rbHelperLine.reset( )

	# Select startpoint / endpoint
	def leftClicked(self,position):
		pClicked = QPoint( position["x"], position["y"] )
		snappedPoint = []
		( res, snappedPoint ) = self.snapper.snapPoint( pClicked, snappedPoint )
		
		if len( snappedPoint ) > 0:
			if len( self.selectedPathPoints ) > 0:
				pf =  self.findPath( self.selectedPathPoints[-1], QgsPoint( snappedPoint[0].snappedVertex.x(), snappedPoint[0].snappedVertex.y() ) )
				if pf:
					self.selectedPathPoints.append( QgsPoint( snappedPoint[0].snappedVertex.x(), snappedPoint[0].snappedVertex.y() ) )
			else:
				self.selectedPathPoints.append( QgsPoint( snappedPoint[0].snappedVertex.x(), snappedPoint[0].snappedVertex.y() ) )

	def doubleClicked(self,position):
		pClicked = QPoint( position["x"], position["y"] )
		snappedPoint = []
		( res, snappedPoint ) = self.snapper.snapPoint( pClicked, snappedPoint )
		
		if len( snappedPoint ) > 0 and len( self.selectedPathPoints ) > 0:
			self.findPath( self.selectedPathPoints[-1], QgsPoint( snappedPoint[0].snappedVertex.x(), snappedPoint[0].snappedVertex.y() ) )
			self.selectedPathPoints = []

#***************************** open and quit options *******************************************

	def checkForLayers(self):
		layers = self.canvas.layers()
		
		for layer in layers:
			if layer.type() == QgsMapLayer.VectorLayer:
				provider = layer.dataProvider()
				fields = provider.fields()
				if layer.name() == "vw_reach_point":
					self.nodeLayer = layer
				elif layer.name() == "Haltung":
					self.reachLayer = layer
					
		if self.nodeLayer == 0 or self.reachLayer == 0:
			QMessageBox.warning(self.iface.mainWindow(), "QGEP", "A required layer is missing. Please open a QGEP project to use this plugin.")
			return False
		else:
			return True
		
	def connectTool(self):
		QObject.connect(self.tool, SIGNAL("moved"), self.moved)
		QObject.connect(self.tool, SIGNAL("rightClicked"), self.rightClicked)
		QObject.connect(self.tool, SIGNAL("leftClicked"), self.leftClicked)
		QObject.connect(self.tool, SIGNAL("doubleClicked"), self.doubleClicked)
		QObject.connect(self.tool, SIGNAL("deactivate"), self.deactivate)


	def deactivate(self):		#enable clean exit of the plugin
		QObject.disconnect(self.tool, SIGNAL("moved"), self.moved)
		QObject.disconnect(self.tool, SIGNAL("leftClicked"), self.leftClicked)
		QObject.disconnect(self.tool, SIGNAL("rightClicked"), self.rightClicked)
		QObject.disconnect(self.tool, SIGNAL("doubleClicked"), self.doubleClicked)
		self.iface.mainWindow().statusBar().showMessage(QString(""))

	def cleaning(self):			#used on right click
		try:
			#print str(self.previousLayer)
			self.previousLayer.removeSelection(False)
			#self.previousLayer.select(None)
		except:
			pass
		self.canvas.unsetMapTool(self.tool)
		self.canvas.setMapTool(self.saveTool)
		self.iface.mainWindow().statusBar().showMessage( "" )

	def onDialogClosed(self):		#used when Dock dialog is closed
		self.dockOpened = False
		self.cleaning()
		
	def findPath(self,pStart,pEnd):
		( vertices, edges ) = self.networkAnalyzer.shortestPath( pStart, pEnd )
		self.rbHelperLine.reset()
		
		if vertices:
			attrMASL = self.nodeLayer.dataProvider().fieldNameIndex( 'masl' ) # index of field meters above sea level
			attrLength = self.reachLayer.dataProvider().fieldNameIndex( 'length_effective' )
			self.rbShortestPath.reset()
			nodeFeat = QgsFeature()
			edgeFeat = QgsFeature()
			profile = QgepProfile()
			curIdx = 0
			
			pathPolyline = []
			
			for vertex in vertices:
				if self.nodeLayer.featureAtId( vertex[2], nodeFeat ):
					nodeAttrs = nodeFeat.attributeMap()
					masl = nodeAttrs[attrMASL].toFloat()[0]
					
					profile.addPoint( vertex[0], masl )
					
					if curIdx < len( edges ):
						
						if self.networkAnalyzer.networkLayer().featureAtId( edges[curIdx], edgeFeat ):
							newSegment = []
							mpl = edgeFeat.geometry().asMultiPolyline()
							newSegment = mpl[0]
							newSegment.reverse()
							pathPolyline.extend( newSegment )
						
					curIdx += 1
			
			self.rbShortestPath.addGeometry( QgsGeometry.fromPolyline( pathPolyline ), self.nodeLayer )
			self.plotWidget.setProfile( profile )
			return True
		else:
			QMessageBox.warning(self.iface.mainWindow(), "QGEP - No path found", "No connection exists between the selected points. Use right click to cancel this operation." )
			return False

	def about(self):
		from ui.ui_dlgabout import DlgAbout
		DlgAbout(self.iface.mainWindow()).exec_()
