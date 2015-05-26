import psycopg2 as pg
import xml.etree.ElementTree as ET
import os

pg.extensions.register_type(pg.extensions.UNICODE)

views = {
    'vw_cover': {
        'parents': [
            'od_cover',
            'od_structure_part'
        ]
    },
    'vw_access_aid': {
        'parents': [
            'od_access_aid',
            'od_structure_part'
        ]
    },
    'vw_dryweather_flume': {
        'parents': [
            'od_dryweather_flume',
            'od_structure_part'
        ]
    },
    'vw_dryweather_downspout': {
        'parents': [
            'od_dryweather_downspout',
            'od_structure_part'
        ]
    },
    'vw_benching': {
        'parents': [
            'od_benching',
            'od_structure_part'
        ]
    }
}


def syncLanguage(lang_code):
    fields = {}

    with pg.connect("service=pg_qgep") as conn:
        with conn.cursor() as cur:
            cur.execute('SELECT * FROM qgep.is_dictionary_od_field;')

            cols = [desc[0] for desc in cur.description]
            # print('Dealing with the following fields from is_dictionary_od_field: {}'.format('\n'.join(cols)))
            nameidx = cols.index('field_name_{}'.format(lang_code))
            descidx = cols.index('field_description_{}'.format(lang_code))
            for record in cur:
                if record[3] not in fields:
                    fields[record[3]] = dict()
                fields[record[3]][record[4]] = dict()
                fields[record[3]][record[4]]['name'] = record[nameidx]
                fields[record[3]][record[4]]['description'] = record[descidx]

    tsfile = os.path.join(os.path.dirname(os.path.realpath(__file__)), '../i18n/qgep-project_{}.ts').format(
        lang_code)
    tree = ET.parse(tsfile)
    root = tree.getroot()

    for context in root.findall('context'):
        contextname = context.find('name').text
        layer = contextname[4:]
        type = contextname[:3]

        if type == 'fld':
            for message in context.findall('message'):
                # The source is the fieldname
                source = message.find('source')
                try:
                    message.find('translation').text = fields[layer][source.text]['name']
                    print 'Translated {} {} to {}'.format(layer, source.text, message.find('translation').text)
                except KeyError:
                    if layer in views:
                        for lyr in views[layer]['parents']:
                            try:
                                if fields[lyr][source.text]['name'] is not None:
                                    message.find('translation').text = fields[lyr][source.text]['name']
                                    message.find('translation').attrib.pop('type')
                                    if source.text == 'last_modification':
                                        print 'Translated {} {} to {}'.format(layer, source.text,
                                                                              message.find('translation').text)
                            except KeyError:
                                pass

    with open(tsfile, 'w') as f:
        f.write('<?xml version="1.0" ?><!DOCTYPE TS>')
        tree.write(f, 'utf-8')


for lang in ['fr', 'de', 'it', 'en']:
    print 'Translating {}'.format(lang)
    syncLanguage(lang)
