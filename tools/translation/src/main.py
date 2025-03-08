from pathlib import Path
from file_scanner import SmaliFileScanner
from string_extractor import SmaliStringExtractor
from xml_handler import StringsXmlHandler
from logger import Logger

def extract_chinese_string_from_smali():
    # Configure paths
    smali_dir = "../../apktool_output"
    output_dir = "out"
    
    # Initialize components
    logger = Logger().get_logger()
    scanner = SmaliFileScanner(smali_dir)
    extractor = SmaliStringExtractor()
    xml_handler = StringsXmlHandler(output_dir)
    
    # Process files
    smali_files = scanner.scan_smali_files()
    # logger.info(f"Found {len(smali_files)} smali files to process.")
    for smali_file in smali_files:
        chinese_strings = extractor.extract_chinese_strings(smali_file)
        for field_name, string_value in chinese_strings:
            xml_handler.add_string(field_name, string_value)
    
    # Save results
    xml_handler.save()
    logger.info("Processing completed and results saved.")

if __name__ == "__main__":
    extract_chinese_string_from_smali()