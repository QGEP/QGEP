from qgis.gui import QgsAttributeFormInterface
from PyQt4.QtGui import QMessageBox

DEBUGMODE=True

class ReachFormInterface( QgsAttributeFormInterface ):
  def __init__( self, form ):
    QgsAttributeFormInterface.__init__( self, form )
    QMessageBox.information( None, "__init__", "Initializing" )

  def initForm():
    QMessageBox.information( None, "initForm", "Initializing form" )

def formOpen( form ):
  return ReachFormInterface( form )
