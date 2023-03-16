#!/usr/bin/python3

import sys
import os
from lxml import etree

for lang_file in sys.argv[1:]:
    print('Translating {}'.format(lang_file))
    with open(lang_file) as file:
        filename = os.path.split(lang_file)[-1]
        basename, _ = os.path.splitext(filename)
        _, lang_code = basename.split('_')

        tree = etree.parse(file)
        for context in tree.iterfind('context'):
            name = context.find('name')
            if name.text.split(':')[-1] == 'valuerelationvalue':
                source = context.find('message').find('source').text
                translation = context.find('message').find('translation')
                if source == 'value_en':
                    translation.text = 'value_{}'.format(lang_code)
                    try:
                        translation.attrib.pop('type')
                    except KeyError:
                        pass
                elif source == 'abbr_en':
                    translation.text = 'abbr_{}'.format(lang_code)
                    try:
                        translation.attrib.pop('type')
                    except KeyError:
                        pass
                else:
                    print('Value relation widget {} has {} as source field, not translated'.format(name, source))

    tree.write(lang_file, xml_declaration=True)
