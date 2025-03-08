import logging
from pathlib import Path

class Logger:
    def __init__(self, log_file: str = 'app.log'):
        self.logger = logging.getLogger('SmaliStringExtractorLogger')
        self.logger.setLevel(logging.DEBUG)
        
        # Create file handler
        fh = logging.FileHandler(log_file)
        fh.setLevel(logging.DEBUG)
        
        # Create console handler
        ch = logging.StreamHandler()
        ch.setLevel(logging.INFO)
        
        # Create formatter and add it to the handlers
        formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
        fh.setFormatter(formatter)
        ch.setFormatter(formatter)
        
        # Add handlers to the logger
        self.logger.addHandler(fh)
        self.logger.addHandler(ch)
    
    def get_logger(self):
        return self.logger
