import os
from pathlib import Path

class SmaliFileScanner:
    def __init__(self, smali_dir: str):
        self.smali_dir = Path(smali_dir)
    
    def scan_smali_files(self) -> list[Path]:
        """Recursively scan for all .smali files in the directory"""
        smali_files = []
        for root, _, files in os.walk(self.smali_dir):
            for file in files:
                if file.endswith('.smali'):
                    smali_files.append(Path(root) / file)
        return smali_files