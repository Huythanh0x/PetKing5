from pathlib import Path
import xml.etree.ElementTree as ET
from xml.dom import minidom
from logger import Logger

class StringsXmlHandler:
    def __init__(self, output_dir: str):
        self.output_dir = Path(output_dir)
        self.output_dir.mkdir(exist_ok=True)
        self.root = ET.Element('resources')
        self.existing_keys = set()
        self.logger = Logger().get_logger()
    
    def add_string(self, name: str, value: str):
        """Add a string entry to the XML if the key is unique"""
        if name in self.existing_keys:
            self.logger.warning(f"Key '{name}' already exists in the XML file.")
            return
        self.existing_keys.add(name)
        self.logger.info(f"Adding string: {name} = {value}")
        
        string_elem = ET.SubElement(self.root, 'string')
        string_elem.set('name', name)
        string_elem.text = value
    
    def save(self, filename: str = 'strings.xml'):
        """Save the XML file with pretty formatting"""
        xml_str = ET.tostring(self.root, encoding='unicode')
        pretty_xml = minidom.parseString(xml_str).toprettyxml(indent='    ')
        
        output_path = self.output_dir / filename
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write(pretty_xml.encode('utf-8').decode('unicode_escape'))