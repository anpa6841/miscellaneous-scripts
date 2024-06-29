#!/bin/bash

# Set the name of the zip file
ZIP_FILE="backup_$(date +%Y%m%d_%H%M%S).zip"

# Password prompt
echo "Enter password for zip file:"
read -s PASSWORD

# Find all directories in the current directory and store them in an array
IFS=$'\n' read -d '' -r -a DIRS < <(find . -maxdepth 1 -type d ! -path . && printf '\0')

# Create the password-protected zip file
zip -r -P "$PASSWORD" "$ZIP_FILE" "${DIRS[@]}"

echo "Backup completed: $ZIP_FILE"

