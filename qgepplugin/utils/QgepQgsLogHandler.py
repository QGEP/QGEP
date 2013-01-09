# -*- coding: utf-8 -*-
#-----------------------------------------------------------
#
# Profile
# Copyright (C) 2013  Matthias Kuhn
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

import logging
from qgis.core import QgsMessageLog

class QgepQgsLogHandler( logging.Handler ):
    '''
    A class acting as a translator between pythons log system and the QGIS log
    system.
    '''
    qgsMessageLog = QgsMessageLog.instance()
    
    def emit( self, record ):
        '''
        Will be called by pythons logging and is the actual bridge
        @param record: The record to be logged
        '''
        
        # Should be adjusted to translate the levelno to QGIS debug levels once
        # QGIS agreed on standards. 
        # See http://hub.qgis.org/issues/6965
        QgsMessageLog.logMessage( record.name + ':' + record.msg, 'qgep', record.levelno )        