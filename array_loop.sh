#!/usr/bin/env bash

declare -A server_ips=(
	[web-01]="192.168.1.10"
	[web-02]="192.168.1.11"
	[db-01]="192.168.1.20"
)

for server in "${!server_ips[@]}"; do
	echo "Server: ${server} --- IP: ${server_ips[$server]}"
done
