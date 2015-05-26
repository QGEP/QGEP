# -*- coding: utf-8 -*-

import psycopg2 as pg
import xml.etree.ElementTree as ET
import os
import json
import io
import codecs
from pprint import pprint

basepath = os.path.dirname(os.path.realpath(__file__))

with open(os.path.join(basepath, '../../datamodel/defs.json')) as defs_file:
    views = json.load(defs_file)

def set_translation(message, text):

    if text and text[:4] != 'zzz_':
        print u'{} {} {}'.format(text, text[:4], text[:4] == 'zzz_')
        message.find('translation').text = text
        message.find('translation').attrib.pop('type')

def sync_language(lang_code):
    fields = {}

    with pg.connect("service=pg_qgep") as conn:
        with conn.cursor() as cur:
            pg.extensions.register_type(pg.extensions.UNICODE, cur)

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

    tsfile = os.path.join(basepath, '../i18n/qgep-project_{}.ts').format(
        lang_code)
    tree = ET.parse(tsfile)
    root = tree.getroot()

    for context in root.findall('context'):
        contextname = context.find('name').text
        layer = contextname[4:]
        ltype = contextname[:3]

        if ltype == 'fld':
            for message in context.findall('message'):
                # The source is the fieldname
                source = message.find('source')
                try:
                    # The most simple type: the translation is in the db for an od_ table
                    set_translation(message, fields[layer][source.text]['name'])
                except KeyError:
                    # If there is no layer with that name it's probably a vw_ view... Lookup in the view definitions
                    if layer in views:
                        for lyr, opts in views[layer]['parents'].iteritems():
                            try:
                                src = source.text
                                # If the field has a different name in the view, do the remapping
                                if 'remap' in opts:
                                    try:
                                        src = opts['remap'][src]
                                    except KeyError:
                                        pass

                                # Now search for the translation (remapped or not)
                                set_translation(message, fields[lyr][src]['name'])
                            except KeyError:
                                pass

    with codecs.open(tsfile, 'w', encoding='utf8') as f:
        f.write(u'<?xml version="1.0" ?><!DOCTYPE TS>')
        tree.write(f)


for lang in ['fr', 'de', 'it', 'en']:
    print 'Translating {}'.format(lang)
    sync_language(lang)

# Uncomment to debug views definitions:
# pprint(views)
