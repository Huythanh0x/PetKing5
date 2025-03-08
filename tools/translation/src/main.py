from pathlib import Path
from file_scanner import SmaliFileScanner
from string_extractor import SmaliStringExtractor
from xml_handler import StringsXmlHandler
from logger import Logger
from string_injector import SmaliStringInjector
from translation_enum import Translation

def extract_chinese_string_from_smali():
    # Configure paths
    smali_dir = "../../apktool_output"
    excluded_dir = "com/uc/paymentsdk"
    output_dir = "out_strings"
    
    # Initialize components
    logger = Logger().get_logger()
    scanner = SmaliFileScanner(smali_dir)
    extractor = SmaliStringExtractor()
    xml_handler = StringsXmlHandler(output_dir)
    
    # Process files
    smali_files = scanner.scan_smali_files()
    for smali_file in smali_files:
        if str(excluded_dir) in str(smali_file.absolute):
            continue
        logger.info(f"Found {len(smali_files)} smali files to process.")
        chinese_strings = extractor.extract_chinese_strings(smali_file)
        for field_name, string_value in chinese_strings:
            xml_handler.add_chinese_string(field_name, string_value)
    
    # Save results
    xml_handler.save()
    logger.info("Processing completed and results saved.")

def inject_translations_to_smali():
    # Configure paths
    smali_dir = "../../apktool_output"
    translation_file = Translation.EN.value
    
    # Initialize components
    logger = Logger().get_logger()
    scanner = SmaliFileScanner(smali_dir)
    injector = SmaliStringInjector(translation_file)
    
    # Process files
    smali_files = scanner.scan_smali_files()
    # logger.info(f"Found {len(smali_files)} smali files to process.")
    for smali_file in smali_files:
        injector.inject_translations(smali_file)
    
    logger.info("Translation injection completed.")

if __name__ == "__main__":
    extract_chinese_string_from_smali()
    inject_translations_to_smali()