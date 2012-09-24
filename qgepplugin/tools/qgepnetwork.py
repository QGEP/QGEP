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

from PyQt4.QtCore import QVariant
from PyQt4.QtGui import QProgressDialog
from collections import defaultdict
from qgis.core import QgsVectorLayer, QgsField, QgsTolerance, QgsSnapper, \
    QgsFeature, QgsPoint, QgsGeometry, QgsMapLayerRegistry
from qgis.networkanalysis import QgsGraph, QgsGraphAnalyzer
import networkx as nx
import time

class QgepNetworkAnalyzer():
    reachLayer = 0
    reachLayerId = 0
    nodeLayerId = 0
    nodeLayer = 0
    dirty = True
    graph = nx.DiGraph()
    vertexIds = {}
    edgeWithNodes = defaultdict(list)
    nodesOnStructure = defaultdict(list)
    # Logs performance of graph creation
    timings = []
    
    def __init__( self, iface ):
        self.iface = iface
        self.snapper = QgsSnapper( self.iface.mapCanvas().mapRenderer() )
        
    def setReachLayer( self, reachLayer ):
        self.reachLayer = reachLayer
        self.dirty = True
                
        if reachLayer:
            self.reachLayerId = reachLayer.id()
            
        else:
            self.reachLayerId = 0
        
    def setNodeLayer( self, nodeLayer ):
        self.dirty = True
        
        self.nodeLayer = nodeLayer
        
        if nodeLayer:
            self.nodeLayerId = nodeLayer.id()
            snapLayer = QgsSnapper.SnapLayer()
            snapLayer.mLayer = nodeLayer
            snapLayer.mTolerance = 10
            snapLayer.mUnitType = QgsTolerance.Pixels
            snapLayer.mSnapTo = QgsSnapper.SnapToVertex
            self.snapper.setSnapLayers( [snapLayer] )
            
        else:
            self.snapper.setSnapLayers( [] )
            self.nodeLayerId = 0
            
        if self.nodeLayer and self.reachLayer:
            self.createGraph()
        
    def _createMemoryLayer( self ):
        provider = self.reachLayer.dataProvider()
        memoryLayerUrl = 'LineString?crs=proj4:' + provider.crs().toProj4()
        self.networkElementsLayer = QgsVectorLayer( memoryLayerUrl, "network_elements", "memory" )
        pr = self.networkElementsLayer.dataProvider()
        
        fields = provider.fields()
        curKey = -1
        for key, value in fields.iteritems():
            while key != curKey+1:
                pr.addAttributes( [QgsField( "dummy", QVariant.Double )] )
                curKey += 1
            pr.addAttributes([ value ])
            curKey += 1
        
    def _addVertices(self):
        nodeProvider = self.nodeLayer.dataProvider()
        
        feat = QgsFeature()
        allAttrs = nodeProvider.attributeIndexes()
        attrObjId = nodeProvider.fieldNameIndex( 'obj_id' )
        attrReachObjId = nodeProvider.fieldNameIndex( 'reach_obj_id' )
        attrWWStructObjId = nodeProvider.fieldNameIndex( 'wastewater_structure_obj_id' )
        
        nodeProvider.select( allAttrs )
        
        # Add all vertices
        while nodeProvider.nextFeature( feat ):
            attrs = feat.attributeMap()
            featId = feat.id()
            
            objId = attrs[attrObjId].toString()
            reachObjId = attrs[attrReachObjId].toString()
            wwStructObjId = attrs[attrWWStructObjId].toString()
            
            vertex = feat.geometry().asPoint()
            self.graph.add_node( featId, dict( point=vertex) )
            
            self.vertexIds[objId] = featId
            
            if reachObjId != '':
                self.edgeWithNodes[reachObjId].append( featId )
            elif wwStructObjId != '':
                self.nodesOnStructure[wwStructObjId].append( featId )
            
    def _addEdges( self, progressDialog ):
        # Add all edges (reach)
        dataProvider = self.reachLayer.dataProvider()
        netProvider = self.networkElementsLayer.dataProvider()
        
        attrObjId           = dataProvider.fieldNameIndex( 'obj_id' )
        attrStrFromObjId    = dataProvider.fieldNameIndex( 'str_from_obj_id' )
        attrStrToObjId      = dataProvider.fieldNameIndex( 'str_to_obj_id' )
        attrRpFromObjId     = dataProvider.fieldNameIndex( 'rp_from_obj_id' )
        attrRpToObjId       = dataProvider.fieldNameIndex( 'rp_to_obj_id' )
        attrLengthEffective = dataProvider.fieldNameIndex( 'length_effective' )
        
        allAttrs = dataProvider.attributeIndexes()
        
        dataProvider.select( allAttrs )
        
        feat = QgsFeature()
        
        # For progress dialog
        currentFeatureCount = 0
        featureCount = dataProvider.featureCount()
        
        newEdges = []
        graphNodes = self.graph.nodes(True)
        
        #Loop throuth all reaches
        while dataProvider.nextFeature( feat ):
            attrs = feat.attributeMap()
            
            objId = attrs[attrObjId].toString()
            
            ptId1 = -1
            ptId2 = -1
            wwStructFromId = attrs[attrStrFromObjId].toString()
            # Connect by structure if applicable. Reach points with reach as structure are handled specially  
            if wwStructFromId != "" and self.nodesOnStructure.has_key( wwStructFromId ):
                ptId1 = self.nodesOnStructure[wwStructFromId][0]
            else:
                rpFromId = attrs[attrRpFromObjId].toString()
                ptId1 = self.vertexIds[rpFromId]
            
            # Connect by structure if applicable. Reach points with reach as structure are handled specially
            wwStructToId = attrs[attrStrToObjId].toString()
            if wwStructToId != "" and self.nodesOnStructure.has_key( wwStructToId ):
                ptId2 = self.nodesOnStructure[wwStructToId][0]
            else:
                rpToId = attrs[attrRpToObjId].toString()
                ptId2 = self.vertexIds[rpToId]
                
            # If this reach contains blind connections it needs to be split
            if objId in self.edgeWithNodes:
                multiPolyLine = feat.geometry().asMultiPolyline()
                if len( multiPolyLine ) > 1:
                    raise Exception("Unexpected MultiPolyLine with more than 1 segement. Please file a bug on https://github.com/qgep/QGEP/issues.")

                
                polyLine = multiPolyLine[0]
                
                # nodes is an array of tuples. Every Tuple consists of 
                # ( VerticeId, QgsPoint ) where the VerticeId is the ID
                # of the node in the QgsGraph or -1 if it is just there
                # for the reach geometry 
                nodes = []
                # The first vertex is always a node
                nodes.append( ( ptId1, polyLine[0] ) )  
                for node in polyLine[1:-1]:
                    nodes.append( ( -1, node ) )
                # The last vertex is always a node
                nodes.append( ( ptId2, polyLine[-1] ) ) 
                
                vertexIndex = -1
                closestPoint = QgsPoint()
                
                # Insert a new vertex for all nodes on this reach
                for node in self.edgeWithNodes[objId]:
                    point = graphNodes[node][1]['point']
                    ( sqrdDist, closestPoint, vertexIndex ) = QgsGeometry.fromPolyline( polyLine ).closestSegmentWithContext( point )
                    polyLine.insert( vertexIndex, point )
                    nodes.insert( vertexIndex, ( node, point ) )
                
                # Create a new polyline for all segments
                # Begin with first vertex/node
                newPolyLine = [ polyLine[0] ]
                ( lastNode, lastPoint ) = nodes[0]
                
                for ( node, point ) in nodes[1:]:
                    newPolyLine.append( point )
                    
                    # If the just added vertex is a node: the segment is finished
                    if node > -1:
                        # Generate feature for memory layer
                        newFeature = QgsFeature()
                        newFeature.setTypeName( "WKBLineString" )
                        newFeature.setGeometry( QgsGeometry.fromMultiPolyline( [newPolyLine] ) )
                        newFeature.setAttributeMap( feat.attributeMap() )
                        
                        # Add a new arc to the graph
                        props = dict( weight = newFeature.geometry().length(), baseFeature = feat.id() )
                        newEdges.append( ( ptId1, ptId2, props, newFeature ) )
                        
                        # Begin new segment
                        newPolyLine = [point]
                        lastNode = node
            
            # There are no blind connections on this reach
            else:
                props = dict( weight = attrs[attrLengthEffective], baseFeature = feat.id() )
                self.graph.add_edge( ptId1, ptId2, props )
            
            # From time to time update progress bar and insert features
            if currentFeatureCount % 1000 == 0:
                self._profile( "collected edges")
                self._addEdgeBatch( newEdges, netProvider )
                newEdges = []
                self._profile( "added edges")
                progressDialog.setValue( currentFeatureCount / featureCount * 90 + 10 )
            currentFeatureCount += 1
        
        #Add remaining edges
        self._addEdgeBatch( newEdges, netProvider )
    
    def _profile(self,name):
        spenttime = 0
        if len( self.timings ) != 0:
            spenttime = time.clock() - self.timings[-1][1]
        self.timings.append( (name, spenttime) )
    
    def _addEdgeBatch( self, edges, provider ):
        # Extract a list of features to add
        features = [ edge[3] for edge in edges ]
        
        # Add the features
        ( ok, newFeatures ) = provider.addFeatures( features )
        if ok:
            featureIds = [ feature.id() for feature in newFeatures ]
            # Assign feature ids to the original edge data
            arcs = zip ( featureIds, edges )
            # Add the arcs to the graph
            for ( featId, ( ptId1, ptId2, props, feat ) ) in arcs:
                props['helpFeature'] = featId
                self.graph.add_edge( ptId1, ptId2, props )
    
    # Creates a network graph
    def createGraph(self):
        progressDialog = QProgressDialog( "Initializing Graph", "Cancel", 0, 100, self.iface.mapCanvas() )
        
        #try:
        self.vertexIds = {}
        self.edgeWithNodes = defaultdict( list )
        self.nodesOnStructure = defaultdict( list )
        
        
        progressDialog.setAutoClose( True )
        self._createMemoryLayer()
        progressDialog.setLabelText( "Adding network elements" )
        progressDialog.setValue( 33 )
        if progressDialog.wasCanceled():
            return
        
        self._addVertices()
        progressDialog.setLabelText( "Adding network reaches" )
        progressDialog.setValue( 67 )
        if progressDialog.wasCanceled():
            return
        
        self._addEdges( progressDialog )
        progressDialog.reset()
        
        QgsMapLayerRegistry.instance().addMapLayer( self.networkElementsLayer )
        self.dirty = False
        #except Exception as e:
        #    progressDialog.close()

    def getNetworkLayer(self):
        return self.networkElementsLayer
    
    def getNodeLayer(self):
        return self.nodeLayer
    
    def getReachLayer(self):
        return self.reachLayer
    
    def getNodeLayerId(self):
        return self.nodeLayerId
    
    def getReachLayerId(self):
        return self.reachLayerId
    
    def getSnapper(self):
        return self.snapper
    
    # Finds the shortes path from the start point
    # to the end point
    # Returns a tuple ( vertices, edges )
    # where each vertex is a tuple in the form
    # (qgspoint, obj_id) again
    #
    # ( 
    #   [
    #     ( QgsPoint, VertexObjId ),
    #     ..., 
    #     ( QgsPoint, VertexObjId )
    #   ],
    #   [
    #     ( 0, ArcObjId ),
    #     ...,
    #     ( 0, ArcObjId )
    #   ] 
    # )
    def shortestPath(self,pStart,pEnd):
        if self.dirty:
            self.createGraph()
            
        path = nx.algorithms.dijkstra_path( self.graph, pStart, pEnd )
        idStart = self.graph.findVertex( pStart )
        idEnd = self.graph.findVertex( pEnd )

        ( tree, cost ) = QgsGraphAnalyzer.dijkstra( self.graph, idStart, 0 )

        p = (0,0)

        if tree[idEnd] == -1:
            print "Path not found"
        else:
            vertices = []
            edges = []
            curPos = idEnd
            while curPos != idStart:
                curArc = self.graph.arc( tree[ curPos ] )
                curInVertex = self.graph.vertex( curArc.inVertex() )
                
                edges.append( curArc.userData().toInt()[0] )
                vertices.append( ( cost[ curPos ], curInVertex.point(), curInVertex.userData().toInt()[0] ) )
                
                curPos = self.graph.arc( tree[ curPos ] ).outVertex()
            
            # Append last vertex (=pStart)
            lastVertex = self.graph.vertex( curPos )
            vertices.append( ( cost[ curPos ], lastVertex.point(), lastVertex.userData().toInt()[0] ) )
            p = ( vertices, edges )

        return p
