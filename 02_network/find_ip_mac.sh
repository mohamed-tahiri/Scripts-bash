#!/usr/bin/env bash
set -euo pipefail

IFACE=${1:-"eth0"}

echo "=== Informations réseau pour interface: $IFACE ==="

IP=$(ip addr show "$IFACE" | awk '/inet / {print $2}')
MAC=$(ip link show "$IFACE" | awk '/link\/ether/ {print $2}')

echo "Adresse IP : $IP"
echo "Adresse MAC : $MAC"
echo "=== Fin des informations réseau ==="