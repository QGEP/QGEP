from PyQt4.QtCore import (QObject, pyqtSlot, pyqtSignal)

from qgis.core import (QgsMapLayerRegistry, QgsProject)

class QgepLayerNotifier(QObject):
    '''
    This class sends out notification when a given set of layers is available or unavailable.
    '''
    layersAvailable = pyqtSignal( [dict] )
    layersUnavailable = pyqtSignal()

    available = False

    def __init__(self,parent,layers):
        QObject.__init__(self,parent)
        self.layers=layers

        QgsMapLayerRegistry.instance().layersWillBeRemoved.connect( self.layersWillBeRemoved )
        QgsMapLayerRegistry.instance().layersAdded.connect( self.layersAdded )

    def layersWillBeRemoved( self, layerList ):
        '''
        Gets called when a layer is removed

        @param layerList: The layers about to be removed
        '''

        if self.available:
            for qgepId in self.layers:
                l = [lyr for (id,lyr) in QgsMapLayerRegistry.instance().mapLayers().iteritems() if id.startswith( qgepId )]
                if len(l) == 0:
                    self.layersUnavailable.emit()
                    self.available = False
                    return

    def layersAdded( self, layers ):
        '''
        Gets called when a layer is added
        @param layers: the layers to check
        '''
        if not self.available:
            lyrlist=dict()
            for qgepId in self.layers:
                l = [lyr for (id,lyr) in QgsMapLayerRegistry.instance().mapLayers().iteritems() if id.startswith( qgepId )]
                if len(l) == 0:
                    return
                lyrlist[qgepId] = l[0]

            self.available = True
            self.layersAvailable.emit(lyrlist)

class QgepLayerManager():
    @staticmethod
    def layer(qgepId):
        l = [lyr for (id,lyr) in QgsMapLayerRegistry.instance().mapLayers().iteritems() if id.startswith( qgepId )]
        if len(l) == 0:
            return None
        else:
            return l[0]