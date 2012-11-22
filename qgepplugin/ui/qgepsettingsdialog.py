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
# with this program; if not, print to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#
#---------------------------------------------------------------------

from ui_qgepsettingsdialog import Ui_QgepSettingsDialog
from PyQt4.QtCore import QSettings, pyqtSlot, QCoreApplication
from PyQt4.QtGui import QDialog, QFileDialog

class QgepSettingsDialog(QDialog, Ui_QgepSettingsDialog):
    settings = QSettings()
    
    def __init__(self, parent=None):
        QDialog.__init__(self, parent)
        self.setupUi(self)
        
        svgProfilePath = self.settings.value( "/QGEP/SvgProfilePath", None ).toString()
        if svgProfilePath != u'':
            self.mGbOverrideDefaultProfileTemplate.setChecked( True )
            self.mProfileTemplateFile.setText( svgProfilePath.toString() )
        else:
            self.mGbOverrideDefaultProfileTemplate.setChecked( False )
            
        self.mPbnChooseProfileTemplateFile.clicked.connect( self.onChooseProfileTemplateFileClicked)
        self.accepted.connect( self.onAccept )
        
    @pyqtSlot()
    def onChooseProfileTemplateFileClicked(self):
        fileName = QFileDialog.getOpenFileName(self, self.tr('Select profile template'), '', self.tr('HTML files(*.htm *.html)') )
        self.mProfileTemplateFile.setText( fileName )
        
    @pyqtSlot()
    def onAccept(self):
        if self.mGbOverrideDefaultProfileTemplate.isChecked() \
        and self.mProfileTemplateFile != '':
            self.settings.setValue( "/QGEP/SvgProfilePath", self.mProfileTemplateFile.text())
        else:
            self.settings.remove( "/QGEP/SvgProfilePath" )