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
    startOffset = 0
    endOffset = 0
    fromLevel = None
    toLevel = None
    objId = None
    gid = None
    nodeCache = None
    edgeCache = None
    
    def __init__(self, fromPointId, toPointId, edgeId, nodeCache, edgeCache, startOffset, endOffset, type):
        QgepProfileElement.__init__(self,type)
        self.startOffset = startOffset
        self.endOffset   = endOffset
        self.nodeCache = nodeCache
        self.edgeCache = edgeCache
        
        fromPoint = nodeCache.featureById( fromPointId )
        toPoint   = nodeCache.featureById( toPointId )
        edge   = edgeCache.featureById( edgeId )
        fromPos = edgeCache.attrAsFloat( edge, u'from_pos' )
        toPos   = edgeCache.attrAsFloat( edge, u'to_pos' )
        
        # Interpolate height if necessary
        if fromPos != 0 or toPos != 1:
            interpolateFromObjId = edgeCache.attrAsUnicode( edge, u'from_obj_id_interpolate' )
            interpolateToObjId = edgeCache.attrAsUnicode( edge, u'to_obj_id_interpolate' )
            interpolateFrom = nodeCache.featureByObjId(interpolateFromObjId)
            interpolateTo   = nodeCache.featureByObjId(interpolateToObjId)
            interpolateFromLevel = self.nodeCache.attrAsFloat( interpolateFrom, u'level')
            interpolateToLevel = self.nodeCache.attrAsFloat( interpolateTo, u'level')
            
            self.fromLevel = interpolateFromLevel + ( fromPos * (interpolateToLevel-interpolateFromLevel) )  
            self.toLevel   = interpolateFromLevel + ( toPos * (interpolateToLevel-interpolateFromLevel) )
        else:
            self.fromLevel   = nodeCache.attrAsFloat( fromPoint, u'level' )
            self.toLevel     = nodeCache.attrAsFloat( toPoint, u'level')
            
        # Read the identifiers
        self.objId = edgeCache.attrAsUnicode( edge, u'obj_id' )
        self.gid = edge.id()
    
    # Add a new segment
    def addSegment(self, fromPointId, toPointId, edgeId, startOffset, endOffset):
        toPoint = self.nodeCache.featureById( toPointId )
        edge   = edgeCache.featureById( edgeId )
        
        self.endOffset = endOffset
        toPos = edgeCache.attrAsFloat( edge, u'to_pos' )
        
        if toPos != 1:
            interpolateToObjId = edgeCache.attrAsUnicode( edge, u'to_obj_id_interpolate' )
            interpolateTo   = nodeCache.featureByObjId(interpolateToObjId)
            self.toLevel = toPos * self.nodeCache.attrAsFloat( interpolateTo, u'level')
        else:
            self.toLevel = self.nodeCache.attrAsFloat( toPoint, u'level')
    
    def asDict(self):
            el = QgepProfileElement.asDict(self)
            el.update( \
            { \
              'startOffset':   self.startOffset, \
              'endOffset':     self.endOffset, \
              'startLevel':    self.fromLevel, \
              'endLevel':      self.toLevel, \
              'objId':         self.objId, \
              'gid':           self.gid \
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
    def __init__( self, elements=[] ):
        self.elements = elements

    def copy( self ):
        newElements = copy( self.elements )
        newProfile = QgepProfile( newElements )
        return newProfile

    def addElement( self, elem ):
        self.elements.append( elem )

    def getElements(self):
        return self.elements

    def asJson(self):
        return json.dumps( [element.asDict() for element in self.elements] )

    def reset(self):
        self.elements = []