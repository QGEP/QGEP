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

from PyQt4.QtCore import QPoint
from PyQt4.QtGui import QMenu, QAction
from collections import defaultdict
from qgis.core import QgsTolerance, QgsSnapper, QgsFeature, QgsRectangle
import networkx as nx
import time

class QgepGraphManager():
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
            
        if self.nodeLayer and self.reachLayer:
            self.createGraph()
        
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
        allAttrs = nodeProvider.attributeIndexes()
        attrObjId = nodeProvider.fieldNameIndex( 'obj_id' )
        attrType = nodeProvider.fieldNameIndex( 'type' )
        
        nodeProvider.select( allAttrs )
        
        # Add all vertices
        while nodeProvider.nextFeature( feat ):
            attrs = feat.attributeMap()
            featId = feat.id()
            
            objId = attrs[attrObjId].toString()
            objType = attrs[attrType].toString()
            
            vertex = feat.geometry().asPoint()
            self.graph.add_node( featId, dict( point=vertex, objType=objType ) )
            
            self.vertexIds[str(objId)] = featId
        
        self._profile( "add vertices" )
            
    def _addEdges( self ):
        # Add all edges (reach)
        reachProvider = self.reachLayer.dataProvider()
        
        allAttrs = reachProvider.attributeIndexes()
        
        attrObjId      = reachProvider.fieldNameIndex( 'obj_id' )
        attrFromObjId  = reachProvider.fieldNameIndex( 'from_obj_id' )
        attrToObjId    = reachProvider.fieldNameIndex( 'to_obj_id' )
        attrLength     = reachProvider.fieldNameIndex( 'length_calc' )
        attrType       = reachProvider.fieldNameIndex( 'type' )
        
        reachProvider.select( allAttrs )
        
        feat = QgsFeature()
        
        graphNodes = self.graph.nodes(True)
        
        #Loop throuth all reaches
        while reachProvider.nextFeature( feat ):
            try:
                attrs = feat.attributeMap()
                
                objId = attrs[attrObjId].toString()
                objType = attrs[attrType].toString()
                fromObjId = attrs[attrFromObjId].toString()
                toObjId = attrs[attrToObjId].toString()
                
                length = attrs[attrLength].toDouble()[0]
                
                ptId1 = self.vertexIds[str(fromObjId)]
                ptId2 = self.vertexIds[str(toObjId)]
                
                props = { \
                  'weight': length,\
                  'feature': feat.id(),\
                  'baseFeature': unicode(objId),\
                  'objType': unicode( objType )\
                }
                self.graph.add_edge( ptId1, ptId2, props )
            except KeyError as e:
                print e

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
    
    def snapPoint(self, event):
        pClicked = QPoint( event.pos().x(), event.pos().y() )
        ( _, snappedPoints ) = self.snapper.snapPoint( pClicked, [] )

        if len( snappedPoints ) == 0:
            return None
        elif len( snappedPoints ) == 1:
            return snappedPoints[0]
        elif len( snappedPoints ) > 1:
            attrObjId = self.getNodeLayer().dataProvider().fieldNameIndex('obj_id')
            attrType = self.getNodeLayer().dataProvider().fieldNameIndex('type')
            attrDescr = self.getNodeLayer().dataProvider().fieldNameIndex('description')
            
            attributes = [attrObjId, attrType, attrDescr ]
            pointIds = [point.snappedAtGeometry for point in snappedPoints]
            nodeFeatures = self.getFeaturesById(self.getNodeLayer(), attributes, pointIds, True)

            # Filter wastewater nodes            
            filteredFeatures = { id: nodeFeatures.featureById(id) for id in nodeFeatures.asDict() if nodeFeatures.attrAsUnicode( nodeFeatures.featureById(id), u'type' ) == u'wastewater_node' }

            # Only one wastewater node left: return this
            if len( filteredFeatures ) == 1:
                return [point for point in snappedPoints if point.snappedAtGeometry == filteredFeatures.iterkeys().next() ][0]

            # Still not sure which point to take?
            # Are there no wastewater nodes filtered? Let the user choose from the reach points
            if len( filteredFeatures ) == 0:
                filteredFeatures = nodeFeatures.asDict()
            
            # Ask the user which point he wants to use 
            actions = dict()
            
            menu = QMenu( self.iface.mapCanvas() )
            
            for id, feature in filteredFeatures.iteritems():
                title = feature.attributeMap()[attrDescr].toString() + " (" + feature.attributeMap()[attrObjId].toString() + ")" 
                action = QAction( title, menu )
                actions[action] = point
                menu.addAction( action )
            
            clickedAction = menu.exec_( self.iface.mapCanvas().mapToGlobal( event.pos()  ) )
            
            if clickedAction is not None:
                return actions[clickedAction]
            
            return None
        
    
    # Finds the shortes path from the start point
    # to the end point
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
            
    def getTree(self,node,reverse=False):
        if self.dirty:
            self.createGraph()
        
        if reverse:
            myGraph = self.graph.reverse()
        else:
            myGraph = self.graph
            
        # Returns pred, weight
        pred, _ = nx.bellman_ford(myGraph, node)
        edges = [(v,u,myGraph[v][u]) for (u,v) in pred.items() if v is not None]
        
        return edges
    
    def getEdgeGeometry(self, edges):
        cache = self.getFeaturesById(self.reachLayer, self.reachLayer.dataProvider().attributeIndexes(), edges, True)
        polylines = [feat.geometry().asPolyline() for feat in cache.asDict().values()]
        return polylines
    
    def getFeaturesById(self, layer, attributes, ids, fetchGeometry):
        featCache = QgepFeatureCache(layer)
        dataProvider = layer.dataProvider()
        
        feat = QgsFeature()
        
        # For larger quantities of ids, batch query and filter locally
        if len( ids ) > dataProvider.featureCount() / 10000:
            dataProvider.select( attributes, QgsRectangle(), fetchGeometry )
            while dataProvider.nextFeature( feat ):
                if feat.id() in ids:
                    featCache.addFeature(feat)
                    feat = QgsFeature()
        # If only a few ids, query each
        else:
            for featureId in ids:
                dataProvider.featureAtId( featureId, feat, True, attributes )
                featCache.addFeature(feat)
                feat = QgsFeature()
        
        return featCache
    
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

#===============================================================================
# A feature cache.
# The DB can be slow sometimes, so if we know, that we'll be using some features
# several times consecutively it's better to keep it in memory.
# There is no check done for maximum size. You have to care for your memory
# yourself, when using this class! 
#===============================================================================
class QgepFeatureCache:
    _featuresById = None
    _featuresByObjId = None
    attrIndices = None
    objIdField = None
    layer = None
    
    def __init__(self, layer, objIdField = 'obj_id'):
        self._featuresById = {}
        self._featuresByObjId = {}
        self.attrIndices = { unicode( field.name() ) : idx for idx, field in layer.pendingFields().items() }
        self.objIdField = objIdField
        self.layer = layer
        
    def __getitem__(self, key):
        return self.featureById(key)
        
    def addFeature(self, feat):
        self._featuresById[feat.id()] = feat
        self._featuresByObjId[self.attrAsUnicode( feat, self.objIdField )] = feat
        
    def featureById(self, featId):
        return self._featuresById[featId]
        
    def featureByObjId(self, objId):
        return self._featuresByObjId[objId]
    
    def attrAsFloat(self, feat, attr):
        var = self.attrAsQVariant(feat, attr)
        res = var.toFloat()
        
        # If the value in the database was NULL return None
        # Will also return None if you're trying to convert a String...
        if res[1] != True:
            return None
        else:
            return res[0]
    
    def attrAsUnicode(self, feat, attr):
        var = self.attrAsQVariant(feat, attr)
        return unicode( var.toString() ) 
    
    def attrAsQVariant(self, feat, attr):
        attrMap = feat.attributeMap()
        attrIdx = self.attrIndices[attr]
        return attrMap[attrIdx]
    
    def asDict(self):
        return self._featuresById
        
