#!/usr/bin/python3

import sys
import os
from lxml import etree

for lang_file in sys.argv[1:]:
    with open(lang_file) as file:
        filename = os.path.split(lang)[-1]
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
                elif source == 'abbr_en':
                    translation.text = 'abbr_de'.format(lang_code)
                else:
                    print('Value relation widget {} has {} as source field, not translated'.format(name, source))

    tree.write(lang_file)


