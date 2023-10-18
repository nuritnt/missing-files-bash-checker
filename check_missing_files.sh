#!/bin/bash

# Path to the text file containing file names on the server
input_file="/path/to/filenames.txt"

# Check if the text file exists
if [ ! -f "$input_file" ]; then
    echo "The text file $input_file was not found."
    exit 1
fi

# Number of file names in the input
input_count=$(wc -l < "$input_file")

# List to store missing files
missing_files=()

# Loop through each file name in the text file and check if it is missing
while IFS= read -r file; do
    # Check if the file is missing
    if [ ! -e "$file" ]; then
        echo "The file $file is missing on the server."
        missing_files+=("$file")
    fi
done < "$input_file"

# Output the number of file names in the input
echo "Number of file names in the input: $input_count"

# Calculate the number of missing files
missing_files_count=${#missing_files[@]}

# Output the number of missing files and the list of missing files on the server
echo "Number of missing files on the server: $missing_files_count"
echo "Missing files on the server: ${missing_files[@]}"
