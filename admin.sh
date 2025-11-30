#!/usr/bin/env bash
USER_ID=$(id -u)

# check if user ID is not zero 
if [ "$USER_ID" -ne 0 ]; then
	echo "Error: this script must be run as root."
	exit 1
fi 

echo "Welcome, administrator !"
