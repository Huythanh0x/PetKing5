import re
from pathlib import Path
from logger import Logger

class SmaliStringExtractor:
    def __init__(self):
        self.chinese_pattern = re.compile(r'[\u4e00-\u9fff]')
        self.unicode_string_pattern = re.compile(r'\\u[0-9a-fA-F]{4}')
        self.string_field_pattern = re.compile(r'\.field.*?String.*?=\s*"(.*?)"')
        self.logger = Logger().get_logger()
    
    def extract_chinese_strings(self, smali_file: Path) -> list[tuple[str, str]]:
        """Extract Chinese strings from a smali file"""
        chinese_strings = []
        # self.logger.info(f"Processing file: {smali_file}")
        with open(smali_file, 'r', encoding='utf-8') as f:
            for line in f:
                if self.contains_chinese(line):
                    field_name, string_value = self.parse_string_field(line)
                    if field_name and string_value:
                        chinese_strings.append((field_name, string_value))
                        # self.logger.debug(f"Found Chinese string: {field_name} = {string_value}")
        return chinese_strings
    
    def contains_chinese(self, text: str) -> bool:
        return bool(self.chinese_pattern.search(text) or self.unicode_string_pattern.search(text) )
    
    def parse_string_field(self, line: str) -> tuple[str, str]:
        """Parse field name and string value from a smali line"""
        if match := self.string_field_pattern.search(line):
            field_name = match.group(1)
            string_value = match.group(1)
            return field_name, string_value
        return None, None