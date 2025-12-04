#!/usr/bin/env bash
FILENAME="servers.txt"
while IFS= read -r line; do
	
	if [[ -z "$line" ]]; then
		continue
	fi

	if [[ "$line" == \#* ]]; then
		echo "Skipping comment: $line"
		continue
	fi

	echo "Pinging server: $line"
	ping -c 1 "$line"

	echo "------------------------"
done < "$FILENAME"
