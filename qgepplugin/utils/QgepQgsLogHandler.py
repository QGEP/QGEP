import logging
from qgis.core import QgsMessageLog

class QgepQgsLogHandler( logging.Handler ):
    qgsMessageLog = QgsMessageLog.instance()
    
    def emit( self, record ):
        QgsMessageLog.logMessage( record.name + ':' + record.msg, 'qgep', record.levelno )        