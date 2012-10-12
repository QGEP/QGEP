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
        nodeProvider = self.nodeLayer.dataProvider()
        
        feat = QgsFeature()
        attrObjId = nodeProvider.fieldNameIndex( 'obj_id' )
        attrWWStructObjId = nodeProvider.fieldNameIndex( 'wastewater_structure_obj_id' )
        
        nodeProvider.select( [attrObjId, attrWWStructObjId] )
        
        # Add all vertices
        while nodeProvider.nextFeature( feat ):
            attrs = feat.attributeMap()
            featId = feat.id()
            
            objId = attrs[attrObjId].toString()
            wwStructObjId = attrs[attrWWStructObjId].toString()
            
            vertex = feat.geometry().asPoint()
            self.graph.add_node( featId, dict( point=vertex) )
            
            self.vertexIds[str(objId)] = featId
            
            if wwStructObjId != '':
                self.nodesOnStructure[wwStructObjId].append( featId )
        
        self._profile( "add vertices" )
            
    def _addEdges( self ):
        # Add all edges (reach)
        dataProvider = self.reachLayer.dataProvider()
        
        attrObjId           = dataProvider.fieldNameIndex( 'obj_id' )
        attrStrFromObjId    = dataProvider.fieldNameIndex( 'str_from_obj_id' )
        attrStrToObjId      = dataProvider.fieldNameIndex( 'str_to_obj_id' )
        attrRpFromObjId     = dataProvider.fieldNameIndex( 'rp_from_obj_id' )
        attrRpToObjId       = dataProvider.fieldNameIndex( 'rp_to_obj_id' )
        attrStrFromType     = dataProvider.fieldNameIndex( 'str_from_type' )
        attrStrToType       = dataProvider.fieldNameIndex( 'str_to_type' )
        attrLengthEffective = dataProvider.fieldNameIndex( 'length_effective' )
        attrBlindNodes      = dataProvider.fieldNameIndex( 'nodes' )
        attrBlindOffsets    = dataProvider.fieldNameIndex( 'positions' )
        attrBlindRanks      = dataProvider.fieldNameIndex( 'ranks' )
        
        # Only query needed attributes
        queryAttrs = [ attrObjId, attrStrFromObjId, attrStrToObjId, attrRpFromObjId, attrRpToObjId, attrLengthEffective, attrBlindNodes, attrBlindOffsets, attrBlindRanks, attrStrToType, attrStrFromType ]
        
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
            strFromType = str(attrs[attrStrFromType].toString())
            rpFromId = attrs[attrRpFromObjId].toString()
            
            # Connect by structure if applicable. Reach points with reach as structure are handled specially
            if strFromType == "channel" or strFromType == "reach" or strFromType == "":
                ptId1 = self.vertexIds[str(rpFromId)]
            else:
                ptId1 = self.nodesOnStructure[wwStructFromId][0]

            wwStructToId = attrs[attrStrToObjId].toString()
            strToType = str(attrs[attrStrToType].toString())
            rpToId = attrs[attrRpToObjId].toString()
            
            # Connect by structure if applicable. Reach points with reach as structure are handled specially
            if strToType == "channel" or strToType == "reach" or strToType == "":
                ptId2 = self.vertexIds[str(rpToId)]
            else:
                ptId2 = self.nodesOnStructure[wwStructToId][0]
                
            length = attrs[attrLengthEffective].toDouble()[0]
            # If this reach contains blind connections it needs to be split
            blindNodes = attrs[attrBlindNodes].toString()
            
            if blindNodes != "":
                blindOffsets = attrs[attrBlindOffsets].toString()
                blindRanks = attrs[attrBlindRanks].toString()
                
                # First entry is always NULL...
                lstBlindNodes   = [ptId1] + [ self.vertexIds[x] for x in str( blindNodes )[1:-1].split(',')[1:] ] + [ptId2]
                lstBlindOffsets = [ float (a) for a in [0] + str( blindOffsets )[1:-1].split(',')[1:] + [1] ]
                lstBlindRanks   = [ int(a) for a in [0] + str( blindRanks )[1:-1].split(',')[1:] ]
                lstBlindRanks.append( lstBlindRanks[-1] + 1 )
                
                for (pt1, pt2, offset1, offset2, rank1, rank2) in zip( lstBlindNodes[:-1], lstBlindNodes[1:], lstBlindOffsets[:-1], lstBlindOffsets[1:], lstBlindRanks[1:], lstBlindRanks[:-1] ):
                    props = dict( weight = offset2 * length - offset1 * length, baseFeature = feat.id(), offset = offset1, rank = rank1 )
                    nd = self.graph.node[ pt1 ]
                    nd['pos'] = offset1
                    nd['baseEdge'] = feat.id()
                    nd['pt1'] = self.vertexIds[str(rpFromId)]
                    nd['pt2'] = self.vertexIds[str(rpToId)]
                    self.graph.add_edge( pt1, pt2, props )
            
            # There are no blind connections on this reach
            else:
                props = dict( weight = length, baseFeature = feat.id() )
                self.graph.add_edge( ptId1, ptId2, props )
                
        self._profile( "add edges" )
            
        
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
        self.nodesOnStructure = defaultdict( list )
        self._profile( "initiate dicts" )
        self.graph = nx.DiGraph()
        
        self._profile( "initiate graph" )
        
        self._addVertices()
        self._addEdges()
        
        self.print_profile()
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
        
        try:
            path = nx.algorithms.dijkstra_path( self.graph, pStart, pEnd )
            edges = [(u,v,self.graph[u][v]) for (u,v)in zip(path[0:], path[1:])]

            p = ( path, edges )
        
        except nx.NetworkXNoPath:
            print "no path found"
            p = ([],[])
            
        return p
            
            
    def getEdgeGeometry(self, edges):
        cache = {}
        polylines = []
        
        for edge in edges:
            try:
                feat = cache[edge['baseFeature']]
            except KeyError:
                feat = QgsFeature()
                if self.reachLayer.dataProvider().featureAtId( edge['baseFeature'], feat ):
                    cache[edge['baseFeature']] = feat
                    
            try:
                rank = edge['rank'] - 1
            except KeyError:
                rank = 0
                
            polylines.append (feat.geometry().asMultiPolyline()[rank] )
        
        return polylines
    
    def getNodeValue(self, nodeId, attribute):
        value = -1
        feat = QgsFeature()
        provider = self.nodeLayer.dataProvider()
        attIdx = provider.fieldNameIndex( attribute )
        
        try:
            feat1Id = self.graph.node[nodeId]['pt1']
            feat2Id = self.graph.node[nodeId]['pt2']
            feat1 = QgsFeature()
            feat2 = QgsFeature()
            
            provider.featureAtId( feat1Id, feat1, False, [attIdx] )
            provider.featureAtId( feat2Id, feat2, False, [attIdx] )
            
            value1 = feat1.attributeMap()[attIdx].toFloat()[0]
            value2 = feat2.attributeMap()[attIdx].toFloat()[0]
            
            value = value1 + (value2 - value1) * self.graph.node[nodeId]['pos']
            
        except KeyError:
            if self.nodeLayer.dataProvider().featureAtId( nodeId, feat, False, [attIdx] ):
                value = feat.attributeMap()[attIdx].toFloat()[0]
            
        return value
        
    def print_profile(self):
        for (name, spenttime) in self.timings:
            print name + ":" + str( spenttime ) 
