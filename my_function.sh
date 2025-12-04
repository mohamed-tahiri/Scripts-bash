#!/usr/bin/env bash

get_formatted_date() {

	local name="$1"
	local date
	date=$(date +"%Y-%m-%d")

	echo "$name (Date: $date)"
}

user_string=$(get_formatted_date "Mohamed")
report_string=$(get_formatted_date "Report_backup")

echo "Result 1: $user_string"
echo "Result 2: $report_string"
