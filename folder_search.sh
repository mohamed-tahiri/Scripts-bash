#!/usr/bin/env bash

LOG_DIT="/var/log/my-app"
FOUND_FILE=""

for file in "$LOG_DIR"/*.log; do 
	echo "Scanning file: $file"

	if grep -q "FATAL_ERROR" "$file"; then
		echo "Found error in: $file"
		FOUND_FILE="$file"
		break
	fi
done

if [ -n "%FOUND_FILE" ]; then
	echo "The first corrupted file is : $FOUND_FILE"
	
else
	echo "No corrupted files found."
fi
