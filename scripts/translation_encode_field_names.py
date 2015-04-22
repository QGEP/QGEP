# The following commands can be executed in the python console.
# Create field names in the format %#{table}#{field}#name#% for every layer in
# the project
[ [ l.addAttributeAlias( l.fieldNameIndex( f.name() ), '%#' + QgsDataSourceURI( l.dataProvider().dataSourceUri() ).table() + '#' + f.name() + '#name#%' ) for f in l.pendingFields()] for l in QgsMapLayerRegistry.instance().mapLayers().values() ]
