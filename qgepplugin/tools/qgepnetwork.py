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
from qgis.networkanalysis import *
from collections import defaultdict


class QgepNetworkAnalyzer():
	def __init__( self, iface, reachLayer, connectionLayer ):
		self.iface = iface
		self.reachLayer = reachLayer
		self.connectionLayer = connectionLayer
		self.graph = 0
		
		self.graph = QgsGraph()
		
		self.vertexIds = {}
		self.edgeWithNodes = defaultdict(list)
		self.nodesOnStructure = defaultdict(list)
	
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
		
		allAttrs = provider.attributeIndexes()
		
		provider.select( allAttrs )
		
	def _addVertices(self):
		provider = self.connectionLayer.dataProvider()
		
		feat = QgsFeature()
		allAttrs = provider.attributeIndexes()
		attrObjId = provider.fieldNameIndex( 'obj_id' )
		attrReachObjId = provider.fieldNameIndex( 'reach_obj_id' )
		attrWWStructObjId = provider.fieldNameIndex( 'wastewater_structure_obj_id' )
		
		provider.select( allAttrs )
		
		# Add all vertices
		while provider.nextFeature( feat ):
			attrs = feat.attributeMap()
			featId = feat.id()
			
			objId = attrs[attrObjId].toString()
			reachObjId = attrs[attrReachObjId].toString()
			wwStructObjId = attrs[attrWWStructObjId].toString()
			
			vertex = feat.geometry().asPoint()
			idx = self.graph.addVertex( vertex, featId )
			
			self.vertexIds[objId] = idx
			
			if reachObjId != '':
				self.edgeWithNodes[reachObjId].append( idx )
			elif wwStructObjId != '':
				self.nodesOnStructure[wwStructObjId].append( idx )
			
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
				
				
				
				
			if objId in self.edgeWithNodes:
				multiPolyLine = feat.geometry().asMultiPolyline()
				if len( multiPolyLine ) > 1:
					raise Exception("Unexpected MultiPolyLine with more than 1 segement.")
				polyLine = multiPolyLine[0]
				
				nodes = []
				
				nodes.append( ( ptId1, polyLine[0] ) )
				for node in polyLine[1:-1]:
					nodes.append( ( -1, node ) )
				nodes.append( ( ptId2, polyLine[-1] ) )
				
				vertexIndex = -1
				closestPoint = QgsPoint()
				
				for node in self.edgeWithNodes[objId]:
					point = self.graph.vertex(node).point()
					( sqrdDist, closestPoint, vertexIndex) = QgsGeometry.fromPolyline( polyLine ).closestSegmentWithContext( point )
					polyLine.insert( vertexIndex, point )
					nodes.insert( vertexIndex, ( node, point ) )
				
				newPolyLine = [ polyLine[0] ]
				( lastNode, lastPoint ) = nodes[0]
				
				for ( node, point ) in nodes[1:]:
					newPolyLine.append( point )
					
					if node > -1:
						newFeature = QgsFeature()
						newFeature.setTypeName( "WKBLineString" )
						newFeature.setGeometry( QgsGeometry.fromMultiPolyline( [newPolyLine] ) )
						newFeature.setAttributeMap( feat.attributeMap() )
						netProvider.addFeatures( [ newFeature ] )
						newPolyLine = [point]
						props = [newFeature.geometry().length()]
						featid = netProvider.featureCount()
						self.graph.addArc( lastNode, node, props, featid )
						lastNode = node
				
			
			else:
				try:
					netProvider.addFeatures( [feat] )
					featId = netProvider.featureCount() # Very likely to break
					props = [attrs[attrLengthEffective]]
					self.graph.addArc( ptId1, ptId2, props, featId )
				except KeyError as e:
					print "Could not find point." + e.message
			
			# Do only update the progress bar occasionally
			if currentFeatureCount % 100 == 0:
				progressDialog.setValue( currentFeatureCount / featureCount * 90 + 10 )
			currentFeatureCount += 1
	
	# Creates a network graph
	def createGraph(self):
		progressDialog = QProgressDialog( "Initializing Graph", "Cancel", 0, 100, self.iface.mapCanvas() )
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
		
		QgsMapLayerRegistry.instance().addMapLayer( self.networkLayer() )

	def networkLayer(self):
		return self.networkElementsLayer
	
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
		if self.graph == 0:
			print ("Graph is not initialized. Can not find a path on a not existent graph.")

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
