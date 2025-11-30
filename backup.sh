#!/usr/bin/env bash
today=$(date +"%Y-%m-%d")
backup_dir="/tmp/backup-$today"
source_file="/var/log/syslog"

# Checking if backup directory exist
echo "Checking for directory: $backup_dir"
if [[ ! -d $backup_dir ]]; then
	echo "Directory $backup_dir not found. creating ..."
	mkdir "$backup_dir"
	echo "Backup directory created successfully."
else
	echo "Directory $backup_dir already exists."
fi
# Checking if source file exists and is readable
if [[ ! -f $source_file || ! -r $source_file ]]; then
	echo "Error: source file $source_file does not exist or is not readable."
	exit 1
fi
#Checking if source file is empty
if [[ ! -s $source_file ]]; then
	echo "Warning: source file $source_file is empty, Backing up anyway."
fi

cp "$source_file" "$backup_dir/syslog.bak"
echo "Backup of $source_file completed successfully to $backup_dir"
