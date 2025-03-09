import re
from pathlib import Path
from xml.etree import ElementTree as ET
from logger import Logger

class SmaliStringInjector:
    def __init__(self, translation_file: Path):
        self.translation_file = translation_file
        self.translations = self.load_translations()
        self.logger = Logger().get_logger()
    
    def load_translations(self) -> dict[str, str]:
        """Load translations from the XML file"""
        tree = ET.parse(self.translation_file)
        root = tree.getroot()
        translations = {}
        for string in root.findall('string'):
            name = string.get('name')
            value = string.text
            translations[name] = value
        return translations
    
    def __init__(self, translation_file: Path):
        self.translation_file = translation_file
        self.translations = self.load_translations()
        self.logger = Logger().get_logger()
        self.chinese_pattern = re.compile(r'[\u4e00-\u9fff]')
        self.unicode_string_pattern = re.compile(r'\\u[0-9a-fA-F]{4}')
        self.string_field_pattern = re.compile(r'\.field.*?String.*?=\s*"(.*?)"')

    def inject_translations(self, smali_file: Path):
        """Inject translations into the smali file"""
        with open(smali_file, 'r', encoding='utf-8') as f:
            lines = f.readlines()
        
        with open(smali_file, 'w', encoding='utf-8') as f:
            for line in lines:
                if self.chinese_pattern.search(line) or self.unicode_string_pattern.search(line) or self.string_field_pattern.search(line):
                    for key, value in self.translations.items():
                        escaped_key = key.encode("unicode_escape").decode("utf-8")
                        if f'"{key}"' in line or f'"{escaped_key}"' in line:
                            line = line.replace(f'"{key}"', f'"{value}"')
                            line = line.replace(f'"{escaped_key}"', f'"{value}"')
                            self.logger.info(f"Translated line: {line}")
                f.write(line)
