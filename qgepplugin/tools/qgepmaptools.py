# -*- coding: utf-8 -*-
#-----------------------------------------------------------
# 
# Qgep
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

from PyQt4.QtCore import Qt, QPoint, pyqtSignal, QSignalMapper
from PyQt4.QtGui import QCursor, QMessageBox, QColor, QMenu, QAction
from qgis.core import QgsSnapper, QgsTolerance, QgsFeature, QgsGeometry, QgsPoint
from qgis.gui import QgsMapTool, QgsRubberBand, QgsVertexMarker
from qgepprofile import QgepProfile
import time

class QgepMapTool( QgsMapTool ):
    
    profileChanged = pyqtSignal( object )
    profile = QgepProfile()
    segmentOffset = 0
    timings = []
    highLightedPoints = []
    
    def __init__( self, canvas, button ):
        QgsMapTool.__init__( self, canvas )
        self.canvas = canvas
        self.cursor = QCursor( Qt.CrossCursor )
        self.button = button

    def activate( self ):
        QgsMapTool.activate( self )
        self.canvas.setCursor( self.cursor )
        self.button.setChecked( True )

    # Gets called whenever the tool is deactivated directly or indirectly
    def deactivate( self ):
        self.button.setChecked( False )
        QgsMapTool.deactivate( self )

    def isZoomTool( self ):
        return False

    def setCursor( self, cursor ):
        self.cursor = QCursor( cursor )

#************************************ Events (Convenience relays) *******************************************
    def canvasMoveEvent( self, event ):
        try:
            self.mouseMoved( event )
        except AttributeError:
            pass

    def canvasReleaseEvent( self, event ):
        if event.button() == Qt.RightButton:
            self.rightClicked ( event )
        else:
            self.leftClicked( event )

    def canvasDoubleClickEvent( self, event ):
        try:
            self.doubleClicked( event )
        except AttributeError:
            pass


class QgepProfileMapTool( QgepMapTool ):
    def __init__( self, canvas, button, networkAnalyzer ):
        QgepMapTool.__init__(self, canvas, button)
        
        self.networkAnalyzer = networkAnalyzer
        
        self.selectedPathPoints = []
        self.pathPolyline = []
        
        # Init rubberband to visualize current status
        self.rbHelperLine = QgsRubberBand( self.canvas )
        self.rbHelperLine.setColor( QColor( "#FFD900" ) )
        self.rbHelperLine.setWidth( 2 )

        self.rbShortestPath = QgsRubberBand( self.canvas )
        self.rbShortestPath.setColor( QColor( "#FF9500" ) )
        self.rbShortestPath.setWidth( 3 )

    def setActive( self ):
        self.saveTool = self.canvas.mapTool()
        self.canvas.setMapTool( self )

    def deactivate(self):
        QgepMapTool.deactivate(self)
        self.rbShortestPath.reset()
        self.rbHelperLine.reset()
        self.selectedPathPoints = []
        self.pathPolyline = []
        
    def _profile(self,name):
        spenttime = 0
        if len( self.timings ) != 0:
            spenttime = time.clock() - self.timings[-1][1]
        self.timings.append( (name, spenttime) )

        
    def findPath( self, pStart, pEnd ):
        backupCursor = self.canvas.cursor()
        self.canvas.setCursor(Qt.WaitCursor)
        ( vertices, edges ) = self.networkAnalyzer.shortestPath( pStart, pEnd )
        
        nodeLayer  = self.networkAnalyzer.getNodeLayer()
        
        if vertices:
            self.rbShortestPath.reset()
            attrMASL = nodeLayer.dataProvider().fieldNameIndex( 'masl' ) # index of field meters above sea level
            
            for vertex in zip(vertices,[0]+[edge[2]['weight'] for edge in edges]):
                masl = self.networkAnalyzer.getNodeValue( vertex[0], 'masl' )
                self.segmentOffset += vertex[1]
                self.profile.addPoint( self.segmentOffset, masl )
            
            polylines = self.networkAnalyzer.getEdgeGeometry( [edge[2] for edge in edges] )
            for polyline in polylines:
                self.pathPolyline.extend( polyline )
            
            self.rbShortestPath.addGeometry( QgsGeometry.fromPolyline( self.pathPolyline ), nodeLayer )
            self.profileChanged.emit( self.profile )
            self.canvas.setCursor(backupCursor)
            return True
        else:
            # QMessageBox.warning(self.iface.mainWindow(), "QGEP - No path found", "No connection exists between the selected points. Use right click to cancel this operation." )
            self.canvas.setCursor(backupCursor)
            return False

#************************************* Mouse listener actions ***********************************************

    # Mouse moved: update helper line
    def mouseMoved( self, event ):
        if len( self.selectedPathPoints ) > 0:
            self.rbHelperLine.reset()
            for point in self.selectedPathPoints:
                self.rbHelperLine.addPoint( point[1] )
            mousePos = self.canvas.getCoordinateTransform().toMapCoordinates( event.pos().x(), event.pos().y() )
            self.rbHelperLine.addPoint( mousePos )

    # Cancel any ongoing routing selection
    def rightClicked( self, event ):
        self.selectedPathPoints = []
        self.pathPolyline = []
        self.rbHelperLine.reset()
        self.profile.reset()
        self.segmentOffset = 0

    # Select startpoint / endpoint
    def leftClicked( self, event ):
        pClicked = QPoint( event.pos().x(), event.pos().y() )
        snappedPoint = []
        ( res, snappedPoint ) = self.networkAnalyzer.getSnapper().snapPoint( pClicked, snappedPoint )

        if len( snappedPoint ) > 0:
            if len( self.selectedPathPoints ) > 0:
                pf = self.findPath( self.selectedPathPoints[-1][0], snappedPoint[0].snappedAtGeometry )
                if pf:
                    self.selectedPathPoints.append( ( snappedPoint[0].snappedAtGeometry, QgsPoint( snappedPoint[0].snappedVertex ) ) )
            else:
                self.selectedPathPoints.append( ( snappedPoint[0].snappedAtGeometry, QgsPoint( snappedPoint[0].snappedVertex ) ) )

    def doubleClicked( self, event ):
#        pClicked = QPoint( position["x"], position["y"] )
#        snappedPoint = []
#        ( res, snappedPoint ) = self.networkAnalyzer.getSnapper().snapPoint( pClicked, snappedPoint )
#
#        if len( snappedPoint ) > 0 and len( self.selectedPathPoints ) > 0:
#            self.findPath( self.selectedPathPoints[-1], QgsPoint( snappedPoint[0].snappedVertex.x(), snappedPoint[0].snappedVertex.y() ) )
#            self.selectedPathPoints = []
#            self.pathPolyline = []
        return


class QgepTreeMapTool( QgepMapTool ):
    direction = "downstream"
    signalMapper = QSignalMapper()
    
    def __init__( self, canvas, button, networkAnalyzer ):
        QgepMapTool.__init__(self, canvas, button)
        
        self.networkAnalyzer = networkAnalyzer
        
        self.rbTree = QgsRubberBand( self.canvas )
        self.rbTree.setColor( QColor( "#FF0095" ) )
        self.rbTree.setWidth( 3 )
        
        self.signalMapper.mapped.connect( self.nodeMenuClicked )
        
    def setDirection(self, direction):
        self.direction = direction
        
    def getTree(self,point):
        backupCursor = self.canvas.cursor()
        self.canvas.setCursor(Qt.WaitCursor)
        upstream = False
        if self.direction == "upstream":
            upstream = True
        
        self.rbTree.reset()
        
        edges = self.networkAnalyzer.getTree(point,upstream)
        polylines = self.networkAnalyzer.getEdgeGeometry( [edge[2] for edge in edges] )
        
        self.rbTree.addGeometry( QgsGeometry.fromMultiPolyline( polylines ), self.networkAnalyzer.getNodeLayer() )
        
        self.canvas.setCursor(backupCursor)
        
    def mouseMoved(self, event):
        pClicked = QPoint( event.pos().x(), event.pos().y() )
        ( res, snappedPoints ) = self.networkAnalyzer.getSnapper().snapPoint( pClicked, [] )
        
        for marker in self.highLightedPoints:
            self.canvas.scene().removeItem( marker )
        
        self.highLightedPoints = []
        
        if len( snappedPoints ) > 0:
            for point in snappedPoints:
                marker = QgsVertexMarker( self.canvas )
                marker.setCenter( point.snappedVertex )
                marker.setColor( QColor( "#FFFF33" ) )
                marker.setIconSize( 10 )
                marker.setIconType( QgsVertexMarker.ICON_X )
                marker.setPenWidth( 2 )
                self.highLightedPoints.append(marker)
                
    def rightClicked(self, event):
        self.rbTree.reset()
                
    def leftClicked( self, event ):
        pClicked = QPoint( event.pos().x(), event.pos().y() )
        ( res, snappedPoints ) = self.networkAnalyzer.getSnapper().snapPoint( pClicked, [] )

        if len( snappedPoints ) == 0:
            print "No node selected to start search"
        elif len( snappedPoints ) == 1:
            self.getTree( snappedPoints[0].snappedAtGeometry )
        elif len( snappedPoints ) > 1:
            menu = QMenu( self.canvas )
            nodeFeatures = self.networkAnalyzer.getNodes( [point.snappedAtGeometry for point in snappedPoints], ['obj_id'] )
            
            attrObjId = self.networkAnalyzer.getNodeLayer().dataProvider().fieldNameIndex('obj_id')
            
            for id, feature in nodeFeatures.iteritems():
                action = QAction( feature.attributeMap()[attrObjId].toString(), menu )
                action.triggered.connect( self.signalMapper.map )
                self.signalMapper.setMapping(action, point.snappedAtGeometry )
                menu.addAction( action )
            
            menu.exec_( self.canvas.mapToGlobal( event.pos()  ) )
            
            for action in menu.actions():
                menu.removeAction( action )
         
    def nodeMenuClicked(self,index):
        self.getTree(index)
            
    def setActive( self ):
        self.saveTool = self.canvas.mapTool()
        self.canvas.setMapTool( self )