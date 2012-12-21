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

import json
import math

from PyQt4.QtGui import QMessageBox
from qgis.core import QgsGeometry

class QgepProfileElement():
    type = 'undefined'
    feat = None
    
    def __init__(self, elementType):
        self.type = elementType
        
    def asDict(self):
        return \
            { \
              'type': self.type \
            }
            
    def feature(self):
        return self.feat
    
    def highlight( self, rubberband ):
        msgBox = QMessageBox()
        msgBox.setText( 'Highlight unimplemented' )
        msgBox.exec_()
    
    def type(self):
        return type

#===============================================================================
# Define the base attributes for all edge elements (reaches and special structures)
#===============================================================================
class QgepProfileEdgeElement(QgepProfileElement):
    objId = None
    gid = None
    blindConnections = None
    
    def __init__(self, fromPointId, toPointId, edgeId, nodeCache, edgeCache, startOffset, endOffset, elemType):
        QgepProfileElement.__init__(self,elemType)
        self.reachPoints = {}
        
        edge   = edgeCache.featureById( edgeId )
        
        # Read the identifiers
        self.objId = edgeCache.attrAsUnicode( edge, u'obj_id' )
        self.gid = edge.id()
    
        self.addSegment(fromPointId, toPointId, edgeId, nodeCache, edgeCache, startOffset, endOffset)
        
    # Add a new segment
    def addSegment(self, fromPointId, toPointId, edgeId, nodeCache, edgeCache, startOffset, endOffset):
        fromPoint = nodeCache.featureById( fromPointId )
        toPoint = nodeCache.featureById( toPointId )
        edge   = edgeCache.featureById( edgeId )
        
        if not self.reachPoints.has_key(fromPointId):
            self.reachPoints[fromPointId] = {}
        if not self.reachPoints.has_key(toPointId):
            self.reachPoints[toPointId] = {}
        
        
        fromPos = edgeCache.attrAsFloat( edge, u'from_pos' )
        toPos = edgeCache.attrAsFloat( edge, u'to_pos' )

        interpolateFromObjId = edgeCache.attrAsUnicode( edge, u'from_obj_id_interpolate' )
        interpolateToObjId = edgeCache.attrAsUnicode( edge, u'to_obj_id_interpolate' )
        interpolateFrom = nodeCache.featureByObjId(interpolateFromObjId)
        interpolateTo   = nodeCache.featureByObjId(interpolateToObjId)
        interpolateFromLevel = nodeCache.attrAsFloat( interpolateFrom, u'level')
        interpolateToLevel = nodeCache.attrAsFloat( interpolateTo, u'level')
        
        if fromPos == 0 and toPos == 1:
            fromLevel   = nodeCache.attrAsFloat( fromPoint, u'level' )
            toLevel     = nodeCache.attrAsFloat( toPoint, u'level')
        else:
            try:
                fromLevel = interpolateFromLevel + ( fromPos * (interpolateToLevel-interpolateFromLevel) )
            except TypeError:
                fromLevel = None
            try:
                toLevel   = interpolateFromLevel + ( toPos * (interpolateToLevel-interpolateFromLevel) )
            except TypeError:
                toLevel = None
                
        self.fromLevel = interpolateFromLevel
        self.toLevel = interpolateToLevel
        
        self.reachPoints[fromPointId]['offset']  = startOffset
        self.reachPoints[fromPointId]['level']   = fromLevel
        self.reachPoints[fromPointId]['pos']     = fromPos
        self.reachPoints[fromPointId]['objId']   = nodeCache.attrAsUnicode( fromPoint, u'obj_id' )
        
        self.reachPoints[toPointId]['offset']    = endOffset
        self.reachPoints[toPointId]['level']     = toLevel
        self.reachPoints[toPointId]['pos']       = toPos
        self.reachPoints[toPointId]['objId']     = nodeCache.attrAsUnicode( toPoint, u'obj_id' )
        
    
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
          'globStartLevel':self.fromLevel, \
          'globEndLevel':  self.toLevel, \
          'objId':         self.objId, \
          'gid':           self.gid, \
          'reachPoints':   self.reachPoints.values() \
        } )
        return el

#===============================================================================
# Define the profile for the REACH element
#===============================================================================
class QgepProfileReachElement(QgepProfileEdgeElement):
    usageCurrent = None
    width = None
    length = None
    gradient = None
    detailGeometry = None
    material = None
    
    def __init__(self, fromPointId, toPointId, reachId, nodeCache, edgeCache, startOffset, endOffset ):
        QgepProfileEdgeElement.__init__( self, fromPointId, toPointId, reachId, nodeCache, edgeCache, startOffset, endOffset, 'reach' )
        reach   = edgeCache.featureById( reachId )
        self.feat = reach
        
        try:
            self.width = edgeCache.attrAsFloat( reach, u'depth' ) / 1000
        except TypeError:
            pass
            
        self.usageCurrent = edgeCache.attrAsFloat( reach, u'usage_current' )
        self.material = edgeCache.attrAsUnicode( reach, u'material' )
        self.length = edgeCache.attrAsFloat( reach, u'length_full' )
        self.detailGeometry = reach.geometry()
        
        try:
            self.gradient = (self.fromLevel - self.toLevel) / self.length
        except:
            pass

    def asDict(self):
        el = QgepProfileEdgeElement.asDict(self)
        
        # Global length: whole reach
        el.update( \
        { \
          'usageCurrent': self.usageCurrent, \
          'width_m':       self.width, \
          'gradient':     self.gradient, \
          'length':       self.length, \
          'material':     self.material \
        } )
        return el
    
    def highlight( self, rubberband ):
        rubberband.reset( self.detailGeometry.type() )
        rubberband.addGeometry( self.detailGeometry, None )
    
#===============================================================================
# Define the profile element for the SPECIAL STRUCTURE
#===============================================================================
class QgepProfileSpecialStructureElement(QgepProfileEdgeElement):
    bottomLevel = None
    coverLevel = None
    description = None
    wwNodeOffset = None
    detailGeometry = None
    
    def __init__(self, fromPointId, toPointId, edgeId, nodeCache, edgeCache, startOffset, endOffset):
        QgepProfileEdgeElement.__init__( self, fromPointId, toPointId, edgeId, nodeCache, edgeCache, startOffset, endOffset, 'special_structure' )
        specialStructure = edgeCache.featureById( edgeId )
        self.feat = specialStructure
        
        self.addSegment( fromPointId, toPointId, edgeId, nodeCache, edgeCache, startOffset, endOffset )

    def addSegment(self, fromPointId, toPointId, edgeId, nodeCache, edgeCache, startOffset, endOffset):
        QgepProfileEdgeElement.addSegment(self, fromPointId, toPointId, edgeId, nodeCache, edgeCache, startOffset, endOffset)
        fromPoint = nodeCache.featureById( fromPointId )
        toPoint = nodeCache.featureById( toPointId )
        specialStructure = edgeCache.featureById( edgeId )
        
        self.bottomLevel  = edgeCache.attrAsFloat( specialStructure, u'bottom_level' )
        
        definingWasteWaterNode = None
        
        if u'wastewater_node' == nodeCache.attrAsUnicode(fromPoint, u'type'):
            definingWasteWaterNode = fromPoint
            self.wwNodeOffset = startOffset
        elif u'wastewater_node' == nodeCache.attrAsUnicode(toPoint, u'type'):
            definingWasteWaterNode = toPoint
            self.wwNodeOffset = endOffset
        
        # There should always be a wastewater node but checking does not hurt
        if definingWasteWaterNode is not None:
            self.coverLevel  = nodeCache.attrAsFloat( definingWasteWaterNode, u'cover_level' )
            self.description  = nodeCache.attrAsUnicode( definingWasteWaterNode, u'description' )
            self.usageCurrent = nodeCache.attrAsFloat( definingWasteWaterNode, u'usage_current' )
            self.detailGeometry = QgsGeometry()
            wktDetailGeometry = nodeCache.attrAsUnicode( definingWasteWaterNode, u'detail_geometry' )
            self.detailGeometry.fromWkt( wktDetailGeometry )
        
    def highlight(self, rubberband):
        rubberband.reset( self.detailGeometry.type() )
        rubberband.addGeometry( self.detailGeometry, None )
        
    def asDict(self):
            el = QgepProfileEdgeElement.asDict(self)
            el.update( \
            { \
              'bottomLevel':  self.bottomLevel, \
              'description':  self.description, \
              'coverLevel':   self.coverLevel, \
              'usageCurrent': self.usageCurrent, \
              'wwNodeOffset': self.wwNodeOffset \
            } )
            return el

#===============================================================================
# A node (wastewater node or reach point)
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
# Manages a profile of reaches and special structures
#===============================================================================
class QgepProfile():
    rubberband = None
    
    def __init__( self, elements={} ):
        self.elements = elements
        
    def setRubberband(self, rubberband):
        self.rubberband = rubberband

    def copy( self ):
        newProfile = QgepProfile( self.elements.copy() )
        newProfile.setRubberband( self.rubberband )
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
        
    def highlight( self, objId ):
        try:
            if objId is not None:
                self.elements[objId].highlight( self.rubberband )
            else:
                self.rubberband.reset()
        except KeyError, AttributeError:
            pass