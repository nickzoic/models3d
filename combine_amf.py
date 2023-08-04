#!/usr/bin/env python
import sys
import xml.etree.ElementTree as ET

# XXX should handle units other than millimeters
# XXX probably should keep per file metadata
# XXX possibly should define materials per input file
# XXX possibly could unify vertices and produce multiple volumes in a single object

xout = ET.Element('amf', attrib={'unit': 'millimeter'})

obj_id = 0

for fn in sys.argv[1:]:
    et = ET.parse(fn)
    root = et.getroot()
    assert root.tag == 'amf'
    assert root.get('unit') == 'millimeter'

    for obj in root.findall('object'):
        obj.set('id', str(obj_id))
        xout.append(obj)
        obj_id += 1

ET.ElementTree(xout).write(sys.stdout, encoding='unicode', xml_declaration=True)
