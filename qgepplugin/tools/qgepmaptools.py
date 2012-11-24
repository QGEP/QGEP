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

from PyQt4.QtCore import Qt, QPoint, pyqtSignal
from PyQt4.QtGui import QCursor, QColor
from qgis.core import QgsGeometry, QgsPoint
from qgis.gui import QgsMapTool, QgsRubberBand, QgsVertexMarker
from qgepprofile import *

#===============================================================================
# Base class for all the map tools 
#===============================================================================

class QgepMapTool( QgsMapTool ):
    
    profileChanged = pyqtSignal( object )
    profile = QgepProfile()
    segmentOffset = 0
    highLightedPoints = []
    
    def __init__( self, canvas, button ):
        QgsMapTool.__init__( self, canvas )
        self.canvas = canvas
        self.cursor = QCursor( Qt.CrossCursor )
        self.button = button

        self.rubberBand = QgsRubberBand( self.canvas )
        self.rubberBand.setColor( QColor( "#FF9500" ) )
        self.rubberBand.setWidth( 3 )

    # Gets called when the tool is activated
    def activate( self ):
        QgsMapTool.activate( self )
        self.canvas.setCursor( self.cursor )
        self.button.setChecked( True )

    # Gets called whenever the tool is deactivated directly or indirectly
    def deactivate( self ):
        QgsMapTool.deactivate( self )
        self.button.setChecked( False )

    def isZoomTool( self ):
        return False

    def setCursor( self, cursor ):
        self.cursor = QCursor( cursor )

    #===========================================================================
    # Events
    #===========================================================================
    
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

#===============================================================================
# The map tool used for PROFILE
# 
# Allows to find the shortest path between several nodes.
#===============================================================================

class QgepProfileMapTool( QgepMapTool ):
    
    selectedPathPoints = []
    pathPolyline = []
    
    def __init__( self, canvas, button, networkAnalyzer ):
        QgepMapTool.__init__(self, canvas, button)
        
        self.networkAnalyzer = networkAnalyzer
        
        # Init rubberband to visualize current status
        self.rbHelperLine = QgsRubberBand( self.canvas )
        self.rbHelperLine.setColor( QColor( "#FFD900" ) )
        self.rbHelperLine.setWidth( 2 )

    #===============================================================================
    # activates this map tool
    #===============================================================================
    def setActive( self ):
        self.saveTool = self.canvas.mapTool()
        self.canvas.setMapTool( self )

    #===============================================================================
    # Called whenever this map tool is deactivated.
    # Used to clean up code
    #===============================================================================
    def deactivate(self):
        QgepMapTool.deactivate(self)
        self.rubberBand.reset()
        self.rbHelperLine.reset()
        self.selectedPathPoints = []
        self.pathPolyline = []
        
    #=======================================================================
    # Tries to find the shortest path between pStart and pEnd.
    # If it finds a path:
    #  * The path is visualized with a QgsRubberband
    #  * The profile plot is updated to represent the current path
    #=======================================================================
    def findPath( self, pStart, pEnd ):
        backupCursor = self.canvas.cursor()
        self.canvas.setCursor(Qt.WaitCursor)
        #try:
        ( vertices, edges ) = self.networkAnalyzer.shortestPath( pStart, pEnd )
        self.appendProfile( vertices, edges )
#        except:
#            pass
        self.canvas.setCursor(backupCursor)
        if len( vertices ) > 0:
            return True
        else:
            return False
        
    #=======================================================================
    # Appends to the current profile
    #=======================================================================
    def appendProfile( self, vertices, edges ):
        # Fetch all the needed edges in one batch
        edgeLayer = self.networkAnalyzer.getReachLayer()
        edgeAttrs = edgeLayer.dataProvider().attributeIndexes()
        edgeIds = [edge['feature'] for p1, p2, edge in edges]
        
        edgeFeatures = self.networkAnalyzer.getFeaturesById(edgeLayer, edgeAttrs, edgeIds, True)

        # We need some additional nodes, where we need to interpolate...
        interpolateNodesFrom = [edgeFeatures.attrAsUnicode( feat, u'from_obj_id_interpolate' ) for feat in edgeFeatures.asDict().values()]
        interpolateNodesTo   = [edgeFeatures.attrAsUnicode( feat, u'to_obj_id_interpolate' ) for feat in edgeFeatures.asDict().values()]
        additionalIds = [self.networkAnalyzer.vertexIds[node] for node in interpolateNodesFrom]
        additionalIds += [self.networkAnalyzer.vertexIds[node] for node in interpolateNodesTo]
        
        # Now, fetch the nodes we need
        nodeLayer = self.networkAnalyzer.getNodeLayer()
        nodeIds = vertices + additionalIds
        nodeAttrs = nodeLayer.dataProvider().attributeIndexes()
        nodeFeatures = self.networkAnalyzer.getFeaturesById(nodeLayer, nodeAttrs, nodeIds, False)
        
        if len( vertices ) > 1:
            self.rubberBand.reset()
            
            elem = QgepProfileNodeElement( vertices[0], nodeFeatures, 0 )
            self.profile.addElement(vertices[0], elem)
            
            for p1, p2, edge in edges:
                fromOffset = self.segmentOffset
                toOffset = self.segmentOffset + edge['weight']
                
                if 'reach' == edge['type']:
                    if self.profile.hasElement( edge['baseFeature'] ):
                        self.profile[edge['baseFeature']].addSegment( p1, p2, edge['feature'], fromOffset, toOffset )
                    else:
                        elem = QgepProfileReachElement( p1, p2, edge['feature'], nodeFeatures, edgeFeatures, fromOffset, toOffset )
                        self.profile.addElement(edge['baseFeature'], elem)
                    
                elif 'special_structure' == edge['type']:
                    if self.profile.hasElement( edge['baseFeature'] ):
                        self.profile[edge['baseFeature']].addSegment( p1, p2, edge['feature'], fromOffset, toOffset )
                    else:
                        elem = QgepProfileSpecialStructureElement( p1, p2, edge['feature'], nodeFeatures, edgeFeatures, fromOffset, toOffset )
                        self.profile.addElement(edge['baseFeature'], elem)
                
                elem = QgepProfileNodeElement( p2, nodeFeatures, toOffset )
                self.profile.addElement(p2, elem)
                
                self.segmentOffset = toOffset

            self.profileChanged.emit( self.profile )
            
            # Create rubberband geometry
            for id in edgeIds:
                self.pathPolyline.extend( edgeFeatures[id].geometry().asPolyline() )
            
            self.rubberBand.addGeometry( QgsGeometry.fromPolyline( self.pathPolyline ), nodeLayer )
            self.profileChanged.emit( self.profile )
            return True
        else:
            return False

    #===========================================================================
    # Mouse moved: update helper line
    #===========================================================================
    def mouseMoved( self, event ):
        if len( self.selectedPathPoints ) > 0:
            self.rbHelperLine.reset()
            for point in self.selectedPathPoints:
                self.rbHelperLine.addPoint( point[1] )
            mousePos = self.canvas.getCoordinateTransform().toMapCoordinates( event.pos().x(), event.pos().y() )
            self.rbHelperLine.addPoint( mousePos )

    #===========================================================================
    # Cancel any ongoing routing selection
    #===========================================================================
    def rightClicked( self, event ):
        self.selectedPathPoints = []
        self.pathPolyline = []
        self.rbHelperLine.reset()
        self.profile.reset()
        self.segmentOffset = 0

    #===========================================================================
    # Select startpoint / endpoint
    #===========================================================================
    def leftClicked( self, event ):
        snappedPoint = self.networkAnalyzer.snapPoint( event )
        
        if snappedPoint is not None:
            if len( self.selectedPathPoints ) > 0:
                pf = self.findPath( self.selectedPathPoints[-1][0], snappedPoint.snappedAtGeometry )
                if pf:
                    self.selectedPathPoints.append( ( snappedPoint.snappedAtGeometry, QgsPoint( snappedPoint.snappedVertex ) ) )
            else:
                self.selectedPathPoints.append( ( snappedPoint.snappedAtGeometry, QgsPoint( snappedPoint.snappedVertex ) ) )

#===============================================================================
# The map tool used to find TREES 
#===============================================================================

class QgepTreeMapTool( QgepMapTool ):
    direction = "downstream"
    
    def __init__( self, canvas, button, networkAnalyzer ):
        QgepMapTool.__init__(self, canvas, button)
        
        self.networkAnalyzer = networkAnalyzer
        
    def setDirection(self, direction):
        self.direction = direction
        
    def getTree(self,point):
        backupCursor = self.canvas.cursor()
        self.canvas.setCursor(Qt.WaitCursor)
        upstream = False
        if self.direction == "upstream":
            upstream = True
        
        self.rubberBand.reset()
        
        edges = self.networkAnalyzer.getTree(point,upstream)
        polylines = self.networkAnalyzer.getEdgeGeometry( [edge[2]['feature'] for edge in edges] )
        
        # Fix for QGIS < 2.0
        filteredPolylines = [pl for pl in polylines if len(pl) > 0]
        
        self.rubberBand.addGeometry( QgsGeometry.fromMultiPolyline( filteredPolylines ), self.networkAnalyzer.getNodeLayer() )
        
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
        self.rubberBand.reset()

    def leftClicked( self, event ):
        snappedPoint = self.networkAnalyzer.snapPoint( event )
        
        if snappedPoint is not None:
            self.getTree( snappedPoint.snappedAtGeometry )
            
    def setActive( self ):
        self.saveTool = self.canvas.mapTool()
        self.canvas.setMapTool( self )
        
    def deactivate(self):
        QgepMapTool.deactivate(self)
        self.rubberBand.reset()

        for marker in self.highLightedPoints:
            self.canvas.scene().removeItem( marker )
        
        self.highLightedPoints = []
        