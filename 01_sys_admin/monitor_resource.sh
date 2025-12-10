#!/usr/bin/env bash
set -euo pipefail

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
MEM=$(free -m | awk '/Mem/ { printf("%.2f"), $3/$2 * 100 }')
DISK=$(df -h / | awk '/\// {print $(NF-1)}')

echo "=== Resource Monitor - $(date) ==="
echo "CPU usage: $CPU%"
echo "Memory usage: $MEM%"
echo "Disk usage: $DISK"
