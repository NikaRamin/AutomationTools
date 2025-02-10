#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# Check if required commands exist
for cmd in tar mv mkdir; do
    if ! command -v "$cmd" &> /dev/null; then
        echo "Error: '$cmd' command is not available. Please install it and try again."
        exit 1
    fi
done

# Determine input address
if [ $# -eq 0 ]; then
    input_address="$(pwd)"
else
    input_address="$1"
fi

# Validate input directory
if [ ! -d "$input_address" ]; then
    echo "Error: Input directory does not exist: $input_address"
    exit 1
fi

backup_directory="$HOME/backup"

# Prevent backing up the backup directory itself
if [ "$input_address" == "$backup_directory" ]; then
    echo "Error: The input directory cannot be the same as the backup directory."
    exit 1
fi

archive_name="archive.tar"

# Create the archive
echo "Creating archive..."
tar -cvf "$archive_name" "$input_address"
echo "Archive file successfully created: $archive_name"

# Create backup directory if it doesn't exist
if [ ! -d "$backup_directory" ]; then
    mkdir -p "$backup_directory"
    echo "Backup directory successfully created: $backup_directory"
fi

# Handle existing archive file
if [ -f "$backup_directory/$archive_name" ]; then
    echo "Warning: An archive file with the same name already exists in $backup_directory and will be overwritten."
fi

# Move the archive to the backup directory
mv "$archive_name" "$backup_directory"
echo "Archive file successfully moved to: $backup_directory"

exit 0
