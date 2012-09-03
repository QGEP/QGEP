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

class QgepProfile():
	def __init__( self ):
		self.points = []

	def addPoint( self, offset, masl ):
		self.points.append( ( offset, masl ) )
		
	def getOffsetArray(self):
		offsetArray = []
		for point in self.points:
			offsetArray.append(point[0])
		
		return offsetArray
		
	def getMaslArray(self):
		maslArray = []
		for point in self.points:
			maslArray.append(point[1])
			
		return maslArray