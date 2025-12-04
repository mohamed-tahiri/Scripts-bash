#!/usr/bin/env bash

declare -A server_ips

server_ips[web-01]="192.168.1.0"
server_ips[web-02]="192.168.1.11"
server_ips[db-01]="192.168.1.20"

declare -A users=( [admin]="med" [guest]="user1" [test]="user2" )

echo "Web-01 IP is: ${server_ips[web-01]}"
echo "Admin user is: ${users[admin]}"
