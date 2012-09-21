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

from PyQt4.QtCore import QObject
from copy import copy

class QgepProfile( QObject ):
    def __init__( self, points=[] ):
        self.points = points
        
    def copy( self ):
        newPoints = copy( self.points )
        newProfile = QgepProfile( newPoints )
        return newProfile

    # Adds a point if no point is present at this offset
    # @param offset:   offset of the point (x)
    # @param masl:     meters above sea level (y)
    # @param props:    dict of properties for this point 
    def addPoint( self, offset, masl, props={} ):
        if ( offset not in self.getOffsetArray() ):
            self.points.append( ( offset, masl, props ) )
        
    def getOffsetArray(self):
        return [ point[0] for point in self.points ]
        
    def getMaslArray(self):
        return [ point[1] for point in self.points ]
    
    def getPropsArray(self):
        return [ point[2] for point in self.points ]
    
    def reset(self):
        self.points = []