#!/usr/bin/env bash

for in in 1 2 3; do 
	echo "--- Outer loop (i=$i) ---"

	for j in a b c; do
		echo "--- Inner loop (j=$j) ---"
		
		if [[ $j == 'b' ]]; then
			break 2
		fi
	done

	echo "--- End of outer loop (i=$i) ---"
done
