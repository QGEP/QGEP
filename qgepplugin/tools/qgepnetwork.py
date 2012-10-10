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

from PyQt4.QtCore import QVariant, QCoreApplication
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
    graph = 0
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
        
    def _addVertices(self):
        self._profile( "add vertices" )
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
            
            self.vertexIds[str(objId)] = featId
            
            if reachObjId != '':
                self.edgeWithNodes[reachObjId].append( featId )
            elif wwStructObjId != '':
                self.nodesOnStructure[wwStructObjId].append( featId )
            
    def _addEdges( self ):
        self._profile( "add edges" )
        # Add all edges (reach)
        dataProvider = self.reachLayer.dataProvider()
        
        attrObjId           = dataProvider.fieldNameIndex( 'obj_id' )
        attrStrFromObjId    = dataProvider.fieldNameIndex( 'str_from_obj_id' )
        attrStrToObjId      = dataProvider.fieldNameIndex( 'str_to_obj_id' )
        attrRpFromObjId     = dataProvider.fieldNameIndex( 'rp_from_obj_id' )
        attrRpToObjId       = dataProvider.fieldNameIndex( 'rp_to_obj_id' )
        attrLengthEffective = dataProvider.fieldNameIndex( 'length_effective' )
        attrBlindNodes      = dataProvider.fieldNameIndex( 'nodes' )
        attrBlindOffsets    = dataProvider.fieldNameIndex( 'offsets' )
        
        # Only query needed attributes
        queryAttrs = [ attrObjId, attrStrFromObjId, attrStrToObjId, attrRpFromObjId, attrRpToObjId, attrLengthEffective, attrBlindNodes, attrBlindOffsets ]
        
        dataProvider.select( queryAttrs )
        
        feat = QgsFeature()
        
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
                ptId1 = self.vertexIds[str(rpFromId)]
            
            # Connect by structure if applicable. Reach points with reach as structure are handled specially
            wwStructToId = attrs[attrStrToObjId].toString()
            if wwStructToId != "" and self.nodesOnStructure.has_key( wwStructToId ):
                ptId2 = self.nodesOnStructure[wwStructToId][0]
            else:
                rpToId = attrs[attrRpToObjId].toString()
                ptId2 = self.vertexIds[str(rpToId)]
                
            length = attrs[attrLengthEffective].toDouble()[0]
            # If this reach contains blind connections it needs to be split
            blindNodes = attrs[attrBlindNodes].toString()
            
            if blindNodes != "":
                blindOffsets = attrs[attrBlindOffsets].toString()
                # First entry is always NULL...
                lstBlindNodes = [ptId1] + [ self.vertexIds[x] for x in str( blindNodes )[1:-1].split(',')[1:] ] + [ptId2]
                lstBlindOffsets = [0] + str( blindOffsets )[1:-1].split(',')[1:] + [1]
                
                for (pt1, pt2, offset1, offset2) in zip( lstBlindNodes[:-1], lstBlindNodes[1:], lstBlindOffsets[:-1], lstBlindOffsets[1:] ):
                    props = dict( weight = float(offset2) * length - float(offset1) * length, baseFeature = feat.id(), offset = offset1 )
                    self.graph.add_edge( pt1, pt2, props )
            
            # There are no blind connections on this reach
            else:
                props = dict( weight = length, baseFeature = feat.id() )
                self.graph.add_edge( ptId1, ptId2, props )
            
        
    def _profile(self,name):
        spenttime = 0
        if len( self.timings ) != 0:
            spenttime = time.clock() - self.timings[-1][1]
        self.timings.append( (name, spenttime) )
    
    # Creates a network graph
    def createGraph(self):
        self._profile( "create graph" )
        
        #try:
        self.vertexIds = {}
        self.edgeWithNodes = defaultdict( list )
        self.nodesOnStructure = defaultdict( list )
        self.graph = nx.DiGraph()
        
        self._addVertices()
        self._addEdges()
        
        self._profile( "finished" )
        
        for (name, spenttime) in self.timings:
            print name + ":" + str( spenttime ) 
        self.dirty = False
    
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
        
        p = ([],[])
        
        try:
            path = nx.algorithms.dijkstra_path( self.graph, pStart, pEnd )
            edges = [(u,v,self.graph[u][v]) for (u,v)in zip(path[0:], path[1:])]

            p = ( path, edges )
        
        except nx.NetworkXNoPath:
            print "no path found"
        
        return p
            
            
    def getEdgeGeometry(self, edge):
        feat = QgsFeature()
        if self.reachLayer.dataProvider().featureAtId( edge['baseFeature'], feat ):
            polyline = feat.geometry().asMultiPolyline()[0]
            return polyline