#!/bin/bash

# Define the directory containing the APK files
apk_directory="all_other_apks"

# Define the output directory for the Gradle projects
output_directory="gradle_projects"

# Create the output directory if it doesn't exist
mkdir -p "$output_directory"

# Iterate over all files in the APK directory
for filename in "$apk_directory"/*.apk; do
    if [[ -f "$filename" ]]; then
        apk_path="$filename"
        project_name=$(basename "$filename" .apk)
        project_output_path="$output_directory/$project_name"
        
        # Create the project output directory if it doesn't exist
        mkdir -p "$project_output_path"
        
        # Construct the jadx command
        jadx_command=("jadx" "-d" "$project_output_path" "$apk_path")
        
        # Run the jadx command
        "${jadx_command[@]}"
    fi
done

echo "APK files have been exported to Gradle projects."