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

from copy import copy
import json

class QgepProfileElement():
    type = 'undefined'
    
    def __init__(self, elementType):
        self.type = elementType
        
    def asDict(self):
        return \
            { \
              'type': self.type \
            }

#===============================================================================
# Define the base attributes for all edge elements (reaches and special structures)
#===============================================================================
class QgepProfileEdgeElement(QgepProfileElement):
    objId = None
    gid = None
    nodeCache = None
    edgeCache = None
    blindConnections = None
    
    def __init__(self, fromPointId, toPointId, edgeId, nodeCache, edgeCache, startOffset, endOffset, type):
        QgepProfileElement.__init__(self,type)
        self.nodeCache = nodeCache
        self.edgeCache = edgeCache
        self.reachPoints = {}
        
        edge   = self.edgeCache.featureById( edgeId )
        
        # Read the identifiers
        self.objId = self.edgeCache.attrAsUnicode( edge, u'obj_id' )
        self.gid = edge.id()
    
        self.addSegment(fromPointId, toPointId, edgeId, startOffset, endOffset)
        
    # Add a new segment
    def addSegment(self, fromPointId, toPointId, edgeId, startOffset, endOffset):
        fromPoint = self.nodeCache.featureById( fromPointId )
        toPoint = self.nodeCache.featureById( toPointId )
        edge   = self.edgeCache.featureById( edgeId )
        
        if not self.reachPoints.has_key(fromPointId):
            self.reachPoints[fromPointId] = {}
        if not self.reachPoints.has_key(toPointId):
            self.reachPoints[toPointId] = {}
        
        
        fromPos = self.edgeCache.attrAsFloat( edge, u'from_pos' )
        toPos = self.edgeCache.attrAsFloat( edge, u'to_pos' )

        if fromPos == 0 and toPos == 1:
            fromLevel   = self.nodeCache.attrAsFloat( fromPoint, u'level' )
            toLevel     = self.nodeCache.attrAsFloat( toPoint, u'level')
        else:
            interpolateFromObjId = self.edgeCache.attrAsUnicode( edge, u'from_obj_id_interpolate' )
            interpolateToObjId = self.edgeCache.attrAsUnicode( edge, u'to_obj_id_interpolate' )
            interpolateFrom = self.nodeCache.featureByObjId(interpolateFromObjId)
            interpolateTo   = self.nodeCache.featureByObjId(interpolateToObjId)
            interpolateFromLevel = self.nodeCache.attrAsFloat( interpolateFrom, u'level')
            interpolateToLevel = self.nodeCache.attrAsFloat( interpolateTo, u'level')
        
            fromLevel = interpolateFromLevel + ( fromPos * (interpolateToLevel-interpolateFromLevel) )  
            toLevel   = interpolateFromLevel + ( toPos * (interpolateToLevel-interpolateFromLevel) )

        self.reachPoints[fromPointId]['offset'] = startOffset
        self.reachPoints[toPointId]['offset']   = endOffset
        
        self.reachPoints[fromPointId]['level'] = fromLevel  
        self.reachPoints[fromPointId]['pos']   = fromPos
        
        self.reachPoints[toPointId]['level']   = toLevel
        self.reachPoints[toPointId]['pos']     = toPos
        
    
    def asDict(self):
        startOffset = min([p['offset'] for p in self.reachPoints.values()])
        endOffset = max([p['offset'] for p in self.reachPoints.values()])
        fromLevel = max([p['level'] for p in self.reachPoints.values()])
        toLevel = min([p['level'] for p in self.reachPoints.values()])
        
        el = QgepProfileElement.asDict(self)
        el.update( \
        { \
          'startOffset':   startOffset, \
          'endOffset':     endOffset, \
          'startLevel':    fromLevel, \
          'endLevel':      toLevel, \
          'objId':         self.objId, \
          'gid':           self.gid, \
          'reachPoints':   self.reachPoints \
        } )
        return el

#===============================================================================
# Define the profile for the REACH element
#===============================================================================
class QgepProfileReachElement(QgepProfileEdgeElement):
    usageCurrent = 0
    width = 0.5
    
    def __init__(self, fromPointId, toPointId, reachId, nodeCache, edgeCache, startOffset, endOffset ):
        QgepProfileEdgeElement.__init__( self, fromPointId, toPointId, reachId, nodeCache, edgeCache, startOffset, endOffset, 'reach' )
        reach   = edgeCache.featureById( reachId )
        
        self.width = edgeCache.attrAsFloat( reach, u'depth' ) / 1000

    def asDict(self):
        el = QgepProfileEdgeElement.asDict(self)
        el.update( \
        { \
          'usage_current': self.usageCurrent, \
          'width_m':       self.width \
        } )
        return el
    
#===============================================================================
# Define the profile element for the SPECIAL STRUCTURE
#===============================================================================
class QgepProfileSpecialStructureElement(QgepProfileEdgeElement):
    bottomLevel = None
    coverLevel = None
    description = None
    
    def __init__(self, fromPointId, toPointId, reachId, nodeCache, edgeCache, startOffset, endOffset):
        QgepProfileEdgeElement.__init__( self, fromPointId, toPointId, reachId, nodeCache, edgeCache, startOffset, endOffset, 'special_structure' )
        
        self.addSegment( fromPointId, toPointId, reachId, startOffset, endOffset )

    def addSegment(self, fromPointId, toPointId, edgeId, startOffset, endOffset):
        QgepProfileEdgeElement.addSegment(self, fromPointId, toPointId, edgeId, startOffset, endOffset)
        fromPoint = self.nodeCache.featureById( fromPointId )
        toPoint = self.nodeCache.featureById( toPointId )
        specialStructure = self.edgeCache.featureById( edgeId )
        
        self.bottomLevel  = self.edgeCache.attrAsFloat( specialStructure, u'bottom_level' )
        
        definingWasteWaterNode = None
        
        if u'wastewater_node' == self.nodeCache.attrAsUnicode(fromPoint, u'type'):
            definingWasteWaterNode = fromPoint
        elif u'wastewater_node' == self.nodeCache.attrAsUnicode(toPoint, u'type'):
            definingWasteWaterNode = toPoint
        
        # There should always be a wastewater node but checking does not hurt
        if definingWasteWaterNode is not None:
            self.coverLevel  = self.nodeCache.attrAsFloat( definingWasteWaterNode, u'cover_level' )
            self.description  = self.nodeCache.attrAsUnicode( definingWasteWaterNode, u'description' )
        
    def asDict(self):
            el = QgepProfileEdgeElement.asDict(self)
            el.update( \
            { \
              'bottomLevel': self.bottomLevel, \
              'description': self.description, \
              'coverLevel':  self.coverLevel \
            } )
            return el

#===============================================================================
# 
#===============================================================================
class QgepProfileNodeElement(QgepProfileElement):
    coverLevel = None
    offset = None
    
    def __init__(self, pointId, nodeCache, offset):
        QgepProfileElement.__init__(self,'node')
        
        point = nodeCache.featureById( pointId )
        
        self.offset = offset
        self.coverLevel = nodeCache.attrAsFloat( point, u'cover_level' )
        
    def asDict(self):
        el = QgepProfileElement.asDict(self)
        el.update( \
        { \
          'offset': self.offset, \
          'coverLevel': self.coverLevel \
        } )
        return el

#===============================================================================
# 
#===============================================================================
class QgepProfile():
    def __init__( self, elements={} ):
        self.elements = elements

    def copy( self ):
        newProfile = QgepProfile( self.elements.copy() )
        return newProfile

    def __getitem__(self, key):
        return self.elements[key]
    
    def hasElement(self, key):
        return self.elements.has_key( key)
    
    def addElement( self, key, elem ):
        self.elements[key] = elem

    def getElements(self):
        return self.elements.values()

    def asJson(self):
        return json.dumps( [element.asDict() for element in self.elements.values()] )

    def reset(self):
        self.elements = {}