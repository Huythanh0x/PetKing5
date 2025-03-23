#!/bin/bash

# Usage information
usage() {
  echo "Usage: $0 [options] directory"
  echo ""
  echo "Find and remove duplicate APK files based on their content hash."
  echo ""
  echo "Options:"
  echo "  -a, --algorithm ALGO    Hash algorithm to use: md5, sha1, sha256, sha512 (default: sha256)"
  echo "  -b, --backup DIR        Directory to move duplicates to instead of deleting"
  echo "  -e, --execute           Actually remove duplicates (default is dry run)"
  echo "  -h, --help              Display this help message"
  exit 1
}

# Default values
ALGORITHM="sha256"
DRY_RUN=true
BACKUP_DIR=""

# Parse arguments
POSITIONAL=()
while [[ $# -gt 0 ]]; do
  key="$1"
  case $key in
    -a|--algorithm)
      ALGORITHM="$2"
      if [[ ! "$ALGORITHM" =~ ^(md5|sha1|sha256|sha512)$ ]]; then
        echo "Error: Algorithm must be one of: md5, sha1, sha256, sha512"
        exit 1
      fi
      shift 2
      ;;
    -b|--backup)
      BACKUP_DIR="$2"
      shift 2
      ;;
    -e|--execute)
      DRY_RUN=false
      shift
      ;;
    -h|--help)
      usage
      ;;
    *)
      POSITIONAL+=("$1")
      shift
      ;;
  esac
done

set -- "${POSITIONAL[@]}"

# Check for directory argument
if [ $# -ne 1 ]; then
  echo "Error: Please specify a directory containing APK files"
  usage
fi

DIRECTORY="$1"

# Validate directory exists
if [ ! -d "$DIRECTORY" ]; then
  echo "Error: Directory '$DIRECTORY' does not exist"
  exit 1
fi

# Create backup directory if needed
if [ "$BACKUP_DIR" != "" ] && [ "$DRY_RUN" = false ]; then
  mkdir -p "$BACKUP_DIR"
  if [ $? -ne 0 ]; then
    echo "Error: Failed to create backup directory '$BACKUP_DIR'"
    exit 1
  fi
fi

echo "Scanning directory: $DIRECTORY"
echo "Hash algorithm: $ALGORITHM"
if [ "$DRY_RUN" = true ]; then
  echo "Running in DRY RUN mode (no files will be modified)"
else
  if [ "$BACKUP_DIR" != "" ]; then
    echo "Duplicates will be moved to: $BACKUP_DIR"
  else
    echo "Duplicates will be PERMANENTLY DELETED"
  fi
fi

echo -e "\nCalculating file hashes..."

# Create a temporary directory for hash files
TEMP_DIR=$(mktemp -d)
trap 'rm -rf "$TEMP_DIR"' EXIT

# Find all APK files and calculate their hashes
find "$DIRECTORY" -type f -name "*.apk" | while read -r file; do
  filename=$(basename "$file")
  case "$ALGORITHM" in
    md5) hash=$(md5sum "$file" | cut -d' ' -f1) ;;
    sha1) hash=$(sha1sum "$file" | cut -d' ' -f1) ;;
    sha256) hash=$(sha256sum "$file" | cut -d' ' -f1) ;;
    sha512) hash=$(sha512sum "$file" | cut -d' ' -f1) ;;
  esac
  
  echo "$hash $file" >> "$TEMP_DIR/hashes.txt"
  echo "Processed: $filename ($hash)"
done

# Count total and unique files
TOTAL_FILES=$(wc -l < "$TEMP_DIR/hashes.txt")
if [ "$TOTAL_FILES" -eq 0 ]; then
  echo "No APK files found in $DIRECTORY"
  exit 0
fi

# Sort the hashes and find duplicates
sort -k1,1 "$TEMP_DIR/hashes.txt" > "$TEMP_DIR/sorted_hashes.txt"

echo -e "\nFound $TOTAL_FILES APK files"

# Process each unique hash
current_hash=""
files_for_hash=()
duplicate_count=0

while read -r line; do
  hash=$(echo "$line" | cut -d' ' -f1)
  file=$(echo "$line" | cut -d' ' -f2-)
  
  if [ "$hash" != "$current_hash" ]; then
    # Process previous hash group if it has duplicates
    if [ ${#files_for_hash[@]} -gt 1 ]; then
      echo -e "\nHash: $current_hash"
      echo "Keeping: ${files_for_hash[0]}"
      
      for ((i=1; i<${#files_for_hash[@]}; i++)); do
        duplicate_count=$((duplicate_count + 1))
        echo "  Duplicate: ${files_for_hash[$i]}"
        
        if [ "$DRY_RUN" = false ]; then
          if [ "$BACKUP_DIR" != "" ]; then
            filename=$(basename "${files_for_hash[$i]}")
            echo "  Moving to: $BACKUP_DIR/$filename"
            mv "${files_for_hash[$i]}" "$BACKUP_DIR/$filename"
          else
            echo "  Deleting: ${files_for_hash[$i]}"
            rm "${files_for_hash[$i]}"
          fi
        fi
      done
    fi
    
    # Start new hash group
    current_hash="$hash"
    files_for_hash=("$file")
  else
    # Add to current hash group
    files_for_hash+=("$file")
  fi
done < "$TEMP_DIR/sorted_hashes.txt"

# Process the last hash group
if [ ${#files_for_hash[@]} -gt 1 ]; then
  echo -e "\nHash: $current_hash"
  echo "Keeping: ${files_for_hash[0]}"
  
  for ((i=1; i<${#files_for_hash[@]}; i++)); do
    duplicate_count=$((duplicate_count + 1))
    echo "  Duplicate: ${files_for_hash[$i]}"
    
    if [ "$DRY_RUN" = false ]; then
      if [ "$BACKUP_DIR" != "" ]; then
        filename=$(basename "${files_for_hash[$i]}")
        echo "  Moving to: $BACKUP_DIR/$filename"
        mv "${files_for_hash[$i]}" "$BACKUP_DIR/$filename"
      else
        echo "  Deleting: ${files_for_hash[$i]}"
        rm "${files_for_hash[$i]}"
      fi
    fi
  done
fi

UNIQUE_FILES=$((TOTAL_FILES - duplicate_count))
echo -e "\nSummary:"
echo "Total APK files: $TOTAL_FILES"
echo "Unique files: $UNIQUE_FILES"
echo "Duplicate files: $duplicate_count"

if [ "$DRY_RUN" = true ] && [ $duplicate_count -gt 0 ]; then
  echo -e "\nThis was a DRY RUN. No files were modified."
  echo "To actually remove duplicates, run again with the --execute option."
elif [ $duplicate_count -eq 0 ]; then
  echo -e "\nNo duplicate files found."
fi