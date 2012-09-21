# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'C:\Daten\VMKUHN\Eigene Dateien\mkuhn\QGEP\qgepplugin\ui\qgepdockwidget.ui'
#
# Created: Tue Sep 18 17:23:42 2012
#      by: PyQt4 UI code generator 4.8.3
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    _fromUtf8 = lambda s: s

class Ui_QgepDockWidget(object):
    def setupUi(self, QgepDockWidget):
        QgepDockWidget.setObjectName(_fromUtf8("QgepDockWidget"))
        QgepDockWidget.resize(928, 332)
        self.dockWidgetContents = QtGui.QWidget()
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Expanding)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.dockWidgetContents.sizePolicy().hasHeightForWidth())
        self.dockWidgetContents.setSizePolicy(sizePolicy)
        self.dockWidgetContents.setObjectName(_fromUtf8("dockWidgetContents"))
        self.verticalLayout_3 = QtGui.QVBoxLayout(self.dockWidgetContents)
        self.verticalLayout_3.setObjectName(_fromUtf8("verticalLayout_3"))
        self.tabWidget = QtGui.QTabWidget(self.dockWidgetContents)
        self.tabWidget.setAutoFillBackground(True)
        self.tabWidget.setTabPosition(QtGui.QTabWidget.North)
        self.tabWidget.setTabShape(QtGui.QTabWidget.Rounded)
        self.tabWidget.setElideMode(QtCore.Qt.ElideNone)
        self.tabWidget.setUsesScrollButtons(True)
        self.tabWidget.setObjectName(_fromUtf8("tabWidget"))
        self.tab_1 = QtGui.QWidget()
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Expanding)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.tab_1.sizePolicy().hasHeightForWidth())
        self.tab_1.setSizePolicy(sizePolicy)
        self.tab_1.setObjectName(_fromUtf8("tab_1"))
        self.gridlayout = QtGui.QGridLayout(self.tab_1)
        self.gridlayout.setObjectName(_fromUtf8("gridlayout"))
        self.scaleSlider = QtGui.QSlider(self.tab_1)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Maximum, QtGui.QSizePolicy.Expanding)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.scaleSlider.sizePolicy().hasHeightForWidth())
        self.scaleSlider.setSizePolicy(sizePolicy)
        self.scaleSlider.setOrientation(QtCore.Qt.Vertical)
        self.scaleSlider.setObjectName(_fromUtf8("scaleSlider"))
        self.gridlayout.addWidget(self.scaleSlider, 0, 0, 1, 1)
        self.frameForPlot = QtGui.QFrame(self.tab_1)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Preferred)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.frameForPlot.sizePolicy().hasHeightForWidth())
        self.frameForPlot.setSizePolicy(sizePolicy)
        self.frameForPlot.setFrameShape(QtGui.QFrame.StyledPanel)
        self.frameForPlot.setFrameShadow(QtGui.QFrame.Raised)
        self.frameForPlot.setObjectName(_fromUtf8("frameForPlot"))
        self.verticalLayoutForPlot = QtGui.QVBoxLayout(self.frameForPlot)
        self.verticalLayoutForPlot.setMargin(0)
        self.verticalLayoutForPlot.setObjectName(_fromUtf8("verticalLayoutForPlot"))
        self.gridlayout.addWidget(self.frameForPlot, 0, 1, 1, 1)
        self.gridLayout = QtGui.QGridLayout()
        self.gridLayout.setObjectName(_fromUtf8("gridLayout"))
        self.reachToSelectionButton = QtGui.QPushButton(self.tab_1)
        self.reachToSelectionButton.setObjectName(_fromUtf8("reachToSelectionButton"))
        self.gridLayout.addWidget(self.reachToSelectionButton, 1, 0, 1, 1)
        self.performCalculationButton = QtGui.QPushButton(self.tab_1)
        self.performCalculationButton.setObjectName(_fromUtf8("performCalculationButton"))
        self.gridLayout.addWidget(self.performCalculationButton, 2, 0, 1, 1)
        spacerItem = QtGui.QSpacerItem(20, 40, QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Expanding)
        self.gridLayout.addItem(spacerItem, 4, 0, 1, 1)
        self.printButton = QtGui.QPushButton(self.tab_1)
        self.printButton.setObjectName(_fromUtf8("printButton"))
        self.gridLayout.addWidget(self.printButton, 3, 0, 1, 1)
        self.gridlayout.addLayout(self.gridLayout, 0, 2, 1, 1)
        self.tabWidget.addTab(self.tab_1, _fromUtf8(""))
        self.tab = QtGui.QWidget()
        self.tab.setObjectName(_fromUtf8("tab"))
        self.gridLayout_2 = QtGui.QGridLayout(self.tab)
        self.gridLayout_2.setObjectName(_fromUtf8("gridLayout_2"))
        self.recreateGraphButton = QtGui.QPushButton(self.tab)
        self.recreateGraphButton.setObjectName(_fromUtf8("recreateGraphButton"))
        self.gridLayout_2.addWidget(self.recreateGraphButton, 0, 0, 1, 1)
        spacerItem1 = QtGui.QSpacerItem(20, 40, QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Expanding)
        self.gridLayout_2.addItem(spacerItem1, 1, 0, 1, 1)
        spacerItem2 = QtGui.QSpacerItem(40, 20, QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Minimum)
        self.gridLayout_2.addItem(spacerItem2, 0, 1, 1, 1)
        self.tabWidget.addTab(self.tab, _fromUtf8(""))
        self.verticalLayout_3.addWidget(self.tabWidget)
        QgepDockWidget.setWidget(self.dockWidgetContents)

        self.retranslateUi(QgepDockWidget)
        self.tabWidget.setCurrentIndex(0)
        QtCore.QMetaObject.connectSlotsByName(QgepDockWidget)

    def retranslateUi(self, QgepDockWidget):
        QgepDockWidget.setWindowTitle(QtGui.QApplication.translate("QgepDockWidget", "QGEP", None, QtGui.QApplication.UnicodeUTF8))
        self.reachToSelectionButton.setText(QtGui.QApplication.translate("QgepDockWidget", "Add reaches to selection", None, QtGui.QApplication.UnicodeUTF8))
        self.performCalculationButton.setText(QtGui.QApplication.translate("QgepDockWidget", "Perform calculation", None, QtGui.QApplication.UnicodeUTF8))
        self.printButton.setText(QtGui.QApplication.translate("QgepDockWidget", "Print", None, QtGui.QApplication.UnicodeUTF8))
        self.tabWidget.setTabText(self.tabWidget.indexOf(self.tab_1), QtGui.QApplication.translate("QgepDockWidget", "&Profile", None, QtGui.QApplication.UnicodeUTF8))
        self.recreateGraphButton.setText(QtGui.QApplication.translate("QgepDockWidget", "Recreate graph", None, QtGui.QApplication.UnicodeUTF8))
        self.tabWidget.setTabText(self.tabWidget.indexOf(self.tab), QtGui.QApplication.translate("QgepDockWidget", "Tools", None, QtGui.QApplication.UnicodeUTF8))

