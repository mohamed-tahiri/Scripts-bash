#!/usr/bin/env bash
FILE_NAME="my_file.txt"

while IFS= read -r line; do
	echo "LINE: $line"
done < "$FILENAME"

