#!/usr/bin/env bash
servers=("web-01" "web-02" "web-03" "db" "monitoring")

echo "The first server : ${servers}"
echo "The database server is : ${servers[3]}"
echo "Total servers: ${#servers[@]}"

servers+=("app-01" "app-02")

echo "Total servers after: ${#servers[@]}"
