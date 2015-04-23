# The following commands can be executed in the python console.
# Create field names in the format %#{table}#{field}#name#% for every layer in
# the project
for l in QgsMapLayerRegistry.instance().mapLayers().values():
    for f in l.pendingFields():
        l.remAttributeAlias( l.fieldNameIndex( f.name() ) )
        tbl_name = QgsDataSourceURI( l.dataProvider().dataSourceUri() ).table()
        if (tbl_name[:3] == 'od_' or tbl_name[:3] == 'vw_') and f.name() != 'obj_id':
            l.addAttributeAlias( l.fieldNameIndex( f.name() ), '%#' + tbl_name + '#' + f.name() + '#name#%' )
