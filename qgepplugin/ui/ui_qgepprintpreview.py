# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'C:\Daten\VMKUHN\Eigene Dateien\mkuhn\QGEP\qgepplugin\ui\qgepprintpreview.ui'
#
# Created: Tue Sep 18 16:56:35 2012
#      by: PyQt4 UI code generator 4.8.3
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s

class Ui_QgepPrintPreview(object):
    def setupUi(self, Form):
        Form.setObjectName(_fromUtf8("Form"))
        Form.resize(915, 641)
        self.horizontalLayout = QtGui.QHBoxLayout(Form)
        self.horizontalLayout.setObjectName(_fromUtf8("horizontalLayout"))
        self.optionsScrollArea = QtGui.QScrollArea(Form)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Expanding)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.optionsScrollArea.sizePolicy().hasHeightForWidth())
        self.optionsScrollArea.setSizePolicy(sizePolicy)
        self.optionsScrollArea.setWidgetResizable(True)
        self.optionsScrollArea.setObjectName(_fromUtf8("optionsScrollArea"))
        self.scrollAreaWidgetContents = QtGui.QWidget()
        self.scrollAreaWidgetContents.setGeometry(QtCore.QRect(0, 0, 180, 619))
        self.scrollAreaWidgetContents.setObjectName(_fromUtf8("scrollAreaWidgetContents"))
        self.formLayout = QtGui.QFormLayout(self.scrollAreaWidgetContents)
        self.formLayout.setObjectName(_fromUtf8("formLayout"))
        self.label = QtGui.QLabel(self.scrollAreaWidgetContents)
        self.label.setObjectName(_fromUtf8("label"))
        self.formLayout.setWidget(0, QtGui.QFormLayout.LabelRole, self.label)
        self.lineEdit = QtGui.QLineEdit(self.scrollAreaWidgetContents)
        self.lineEdit.setObjectName(_fromUtf8("lineEdit"))
        self.formLayout.setWidget(0, QtGui.QFormLayout.FieldRole, self.lineEdit)
        self.optionsScrollArea.setWidget(self.scrollAreaWidgetContents)
        self.horizontalLayout.addWidget(self.optionsScrollArea)
        self.frame = QtGui.QFrame(Form)
        self.frame.setFrameShape(QtGui.QFrame.StyledPanel)
        self.frame.setFrameShadow(QtGui.QFrame.Raised)
        self.frame.setObjectName(_fromUtf8("frame"))
        self.gridLayout = QtGui.QGridLayout(self.frame)
        self.gridLayout.setObjectName(_fromUtf8("gridLayout"))
        self.previewScrollArea = QtGui.QScrollArea(self.frame)
        self.previewScrollArea.setWidgetResizable(True)
        self.previewScrollArea.setObjectName(_fromUtf8("previewScrollArea"))
        self.scrollAreaWidgetContents_2 = QtGui.QWidget()
        self.scrollAreaWidgetContents_2.setGeometry(QtCore.QRect(0, 0, 681, 568))
        self.scrollAreaWidgetContents_2.setObjectName(_fromUtf8("scrollAreaWidgetContents_2"))
        self.previewScrollArea.setWidget(self.scrollAreaWidgetContents_2)
        self.gridLayout.addWidget(self.previewScrollArea, 0, 0, 1, 2)
        self.exportButton = QtGui.QPushButton(self.frame)
        self.exportButton.setObjectName(_fromUtf8("exportButton"))
        self.gridLayout.addWidget(self.exportButton, 1, 1, 1, 1)
        spacerItem = QtGui.QSpacerItem(40, 20, QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Minimum)
        self.gridLayout.addItem(spacerItem, 1, 0, 1, 1)
        self.horizontalLayout.addWidget(self.frame)

        self.retranslateUi(Form)
        QtCore.QMetaObject.connectSlotsByName(Form)

    def retranslateUi(self, Form):
        Form.setWindowTitle(QtGui.QApplication.translate("Form", "Form", None, QtGui.QApplication.UnicodeUTF8))
        self.label.setText(QtGui.QApplication.translate("Form", "TextLabel", None, QtGui.QApplication.UnicodeUTF8))
        self.exportButton.setText(QtGui.QApplication.translate("Form", "Export to PDF", None, QtGui.QApplication.UnicodeUTF8))

