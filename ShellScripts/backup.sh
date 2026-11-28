#!/bin/bash

# Author: Himanshu Yadav
# Purpose: Create compressed backups of folders

# Check whether an argument is provided

if [ $# -eq 0 ]; then
    echo "Usage: ./backup.sh <folder>"
    exit 1
fi

SOURCE="$1"

# Check whether the folder exists

if [ ! -d "$SOURCE" ]; then
    echo "Error: Folder does not exist."
    exit 1
fi

# Create backup directory

BACKUP_DIR="$HOME/DeveloperPortfolio_Backups"

mkdir -p "$BACKUP_DIR"

# Generate timestamp

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

FILENAME="backup_${TIMESTAMP}.tar.gz"

# Create compressed archive

if tar -czf "$BACKUP_DIR/$FILENAME" -C "$(dirname "$SOURCE")" "$(basename "$SOURCE")"; then

    SIZE=$(du -h "$BACKUP_DIR/$FILENAME" | cut -f1)

    echo "Backup created successfully!"
    echo "Backup filename: $FILENAME"
    echo "Backup size: $SIZE"

    echo "$TIMESTAMP - SUCCESS - $FILENAME - $SIZE" >> "$BACKUP_DIR/backup.log"

else

    echo "Error: Backup failed."

    echo "$TIMESTAMP - FAILED - $SOURCE" >> "$BACKUP_DIR/backup.log"

    exit 1
fi
