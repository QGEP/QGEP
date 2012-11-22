#-----------------------------------------------------------
# 
# QGEP
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
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
# 
#---------------------------------------------------------------------

def name():
 return "QGEP"

def description():
 return "Plugin to manage wastewater networks"

def version():
 return "Version 0.2.2"

def qgisMinimumVersion():
  return '1.8'

def authorName():
  return 'Matthias Kuhn'

def homepage():
  return 'https://github.com/qgep/QGEP'

def classFactory(iface):
 from qgepplugin import QgepPlugin
 return QgepPlugin(iface)
