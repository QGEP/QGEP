# -*- coding: utf-8 -*-
#-----------------------------------------------------------
#
# Qgep
# Copyright (C) 2014  Matthias Kuhn
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


from PyQt4.QtCore import (Qt,pyqtSignal)
from PyQt4.QtGui import (QCursor
                        ,QColor
                        ,QMessageBox
                        ,QApplication
                        ,QDialog
                        ,QGridLayout
                        ,QLabel
                        ,QLineEdit
                        ,QDialogButtonBox)
from qgis.gui import (QgsMapTool
                     ,QgsRubberBand
                     ,QgsMessageBar)
from qgis.core import (QgsFeature
                      ,QgsPoint
                      ,QgsSnapper
                      ,QgsTolerance
                      ,QgsFeatureRequest
                      ,QGis
                      ,QgsGeometry)
from qgepplugin.utils.qgeplayermanager import QgepLayerManager
import math

class QgepMapToolAddFeature( QgsMapTool ):
    def __init__(self, iface, layer):
        QgsMapTool.__init__(self, iface.mapCanvas() )
        self.iface = iface
        self.canvas = iface.mapCanvas()
        self.layer = layer
        self.rubberband = QgsRubberBand( iface.mapCanvas(), layer.geometryType() )
        self.rubberband.setColor( QColor( "#ee5555" ) )
        self.rubberband.setWidth( 2 )
        self.tempRubberband = QgsRubberBand( iface.mapCanvas(), layer.geometryType() )
        self.tempRubberband.setColor( QColor( "#ee5555" ) )
        self.tempRubberband.setWidth( 2 )
        self.tempRubberband.setLineStyle(Qt.DotLine)

    def activate(self):
        QgsMapTool.activate( self )
        self.canvas.setCursor( QCursor( Qt.CrossCursor ) )
        pass

    def deactivate(self):
        QgsMapTool.deactivate( self )
        self.canvas.unsetCursor()
        pass

    def isZoomTool( self ):
        return False

    #===========================================================================
    # Events
    #===========================================================================

    def canvasMoveEvent( self, event ):
        self.mouseMoved( event )

    def canvasReleaseEvent( self, event ):
        if event.button() == Qt.RightButton:
            self.rightClicked ( event )
        else:
            self.leftClicked( event )

    def leftClicked(self, event):
        mousePos = self.canvas.getCoordinateTransform().toMapCoordinates( event.pos().x(), event.pos().y() )
        self.rubberband.addPoint( mousePos )
        self.tempRubberband.reset()

    def rightClicked(self, event):
        f = QgsFeature( self.layer.pendingFields() )
        f.setGeometry( self.rubberband.asGeometry() )
        dlg = self.iface.getFeatureForm( self.layer, f )
        dlg.setIsAddDialog(True)
        dlg.exec_()
        self.rubberband.reset()
        self.tempRubberband.reset()

    def mouseMoved(self, event):
        mousePos = self.canvas.getCoordinateTransform().toMapCoordinates( event.pos().x(), event.pos().y() )
        self.tempRubberband.movePoint( mousePos )

class QgepMapToolAddReach( QgepMapToolAddFeature ):
    currentSnappingResult = None
    firstSnappingResult = None
    lastSnappingResult = None

    def __init__(self,iface,layer):
        QgepMapToolAddFeature.__init__(self,iface,layer)
        self.nodeLayer = QgepLayerManager.layer('vw_wastewater_node')
        assert self.nodeLayer
        self.reachLayer = QgepLayerManager.layer('vw_qgep_reach')
        assert self.reachLayer

    def mouseMoved(self, event):
        mousePos = self.canvas.getCoordinateTransform().toMapCoordinates( event.pos().x(), event.pos().y() )
        self.tempRubberband.movePoint(mousePos)

    def leftClicked(self, event):
        p = self.snap(event.pos())
        if self.rubberband.numberOfVertices() == 0:
            self.firstSnappingResult = self.currentSnappingResult
        self.lastSnappingResult = self.currentSnappingResult
        if self.currentSnappingResult:
            pt = self.currentSnappingResult.snappedVertex
        else:
            pt = self.canvas.getCoordinateTransform().toMapCoordinates( event.pos().x(), event.pos().y() )
        self.rubberband.addPoint(pt)
        self.tempRubberband.reset()
        self.tempRubberband.addPoint(pt)

    def snap(self,pos):
        snapper = QgsSnapper( self.iface.mapCanvas().mapSettings() )
        snapNodeLayer = QgsSnapper.SnapLayer()
        snapNodeLayer.mLayer = self.nodeLayer
        snapNodeLayer.mTolerance = 10
        snapNodeLayer.mUnitType = QgsTolerance.Pixels
        snapNodeLayer.mSnapTo = QgsSnapper.SnapToVertex
        snapper.setSnapLayers([snapNodeLayer])
        (_, snappedPoints) = snapper.snapPoint(pos)
        if len(snappedPoints) >= 1:
            self.currentSnappingResult = snappedPoints[0]
            return self.currentSnappingResult.snappedVertex
        else:
            snapper = QgsSnapper( self.iface.mapCanvas().mapSettings() )
            snapReachLayer = QgsSnapper.SnapLayer()
            snapReachLayer.mLayer = self.reachLayer
            snapReachLayer.mTolerance = 10
            snapReachLayer.mUnitType = QgsTolerance.Pixels
            snapReachLayer.mSnapTo = QgsSnapper.SnapToVertexAndSegment
            snapper.setSnapLayers([snapReachLayer])
            (_, snappedPoints) = snapper.snapPoint(pos)
            if len(snappedPoints) >= 1:
                self.currentSnappingResult = snappedPoints[0]
                return self.currentSnappingResult.snappedVertex
            else:
                self.currentSnappingResult = None
                return pos

    def rightClicked(self, event):
        self.tempRubberband.reset()

        f = QgsFeature(self.layer.pendingFields())
        f.setGeometry(self.rubberband.asGeometry())

        if self.firstSnappingResult is not None:
            req = QgsFeatureRequest(self.firstSnappingResult.snappedAtGeometry)
            fromNetworkElement = self.firstSnappingResult.layer.getFeatures(req).next()
            fromfield = self.layer.pendingFields().indexFromName('rp_from_fk_wastewater_networkelement')
            f.setAttribute(fromfield, fromNetworkElement.attribute('obj_id'))

        if self.lastSnappingResult is not None:
            req = QgsFeatureRequest( self.lastSnappingResult.snappedAtGeometry )
            toNetworkElement = self.lastSnappingResult.layer.getFeatures(req).next()
            tofield = self.layer.pendingFields().indexFromName('rp_to_fk_wastewater_networkelement')
            f.setAttribute(tofield, toNetworkElement.attribute('obj_id'))

        dlg = self.iface.getFeatureForm(self.layer, f)
        dlg.setIsAddDialog(True)
        dlg.exec_()
        self.rubberband.reset()

class QgepMapToolDigitizeDrainageChannel(QgsMapTool):
    '''
    This is used to digitize a drainage channel.

    It lets you digitize two points and then creates a polygon based on these two points
    by adding an orthogonal offset at each side.

    Input:

       x==============x

    Output:

       ----------------
       |              |
       ----------------

    Usage:
      Connect to the signals deactivated() and geometryDigitized()
      If geometryDigitized() is called you can use the member variable geometry
      which will contain a rectangle polygon
      deactivated() will be emited after a right click
    '''

    geometryDigitized=pyqtSignal()

    def __init__(self, iface, layer):
        QgsMapTool.__init__(self, iface.mapCanvas() )
        self.iface = iface
        self.canvas = iface.mapCanvas()
        self.layer = layer
        self.rubberband = QgsRubberBand( iface.mapCanvas(), QGis.Line )
        self.rubberband.setColor( QColor( "#ee5555" ) )
        self.rubberband.setWidth( 2 )
        self.firstPoint = None

    def activate(self):
        QgsMapTool.activate( self )
        self.canvas.setCursor( QCursor( Qt.CrossCursor ) )
        self.messageBarItem = QgsMessageBar.createMessage( self.tr('Digitizing Drainage Channel'), self.tr('Digitize start and end point. Rightclick to abort.') )
        self.iface.messageBar().pushItem(self.messageBarItem)
        pass

    def deactivate(self):
        QgsMapTool.deactivate( self )
        self.iface.messageBar().popWidget(self.messageBarItem)
        try:
            self.iface.mapCanvas().scene().removeItem(self.rubberband)
            del self.rubberband
        except AttributeError:
            #Called repeatedly... bail out
            pass
        self.canvas.unsetCursor()

    def canvasMoveEvent( self, event ):
        mousePos = self.canvas.getCoordinateTransform().toMapCoordinates( event.pos().x(), event.pos().y() )
        self.rubberband.movePoint( mousePos )

    def canvasReleaseEvent( self, event ):
        if event.button() == Qt.RightButton:
            self.deactivate()
        else:
            mousePos = self.canvas.getCoordinateTransform().toMapCoordinates( event.pos().x(), event.pos().y() )
            self.rubberband.addPoint( mousePos )
            if self.firstPoint: # If the first point was set before, we are doing the second one
                lp1 = self.rubberband.asGeometry().asPolyline()[0]
                lp2 = self.rubberband.asGeometry().asPolyline()[1]
                width = 0.2
                if QApplication.keyboardModifiers() & Qt.ControlModifier:
                    dlg = QDialog()
                    dlg.setLayout(QGridLayout())
                    dlg.layout().addWidget(QLabel('Enter width'))
                    txt = QLineEdit('0.2')
                    dlg.layout().addWidget(txt)
                    bb = QDialogButtonBox(QDialogButtonBox.Ok | QDialogButtonBox.Cancel)
                    dlg.layout().addWidget(bb)
                    bb.accepted.connect(dlg.accept)
                    bb.rejected.connect(dlg.reject)
                    if dlg.exec_():
                        try:
                            width = float(txt.text())
                        except ValueError:
                            width = 0.2

                length = math.sqrt(math.pow(lp1.x()-lp2.x(), 2) + math.pow(lp1.y()-lp2.y(), 2) )
                xd = lp2.x() - lp1.x()
                yd = lp2.y() - lp1.y()

                pt1 = QgsPoint(lp1.x()+width*(yd/length), lp1.y()-width*(xd/length))
                pt2 = QgsPoint(lp1.x()-width*(yd/length), lp1.y()+width*(xd/length))
                pt3 = QgsPoint(lp2.x()-width*(yd/length), lp2.y()+width*(xd/length))
                pt4 = QgsPoint(lp2.x()+width*(yd/length), lp2.y()-width*(xd/length))

                self.geometry = QgsGeometry.fromPolygon([[pt1, pt2, pt3, pt4, pt1]])

                self.geometryDigitized.emit()

            self.firstPoint = mousePos