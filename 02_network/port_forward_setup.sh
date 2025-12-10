#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 2 ]; then
    echo "Usage: $0 <port_source> <port_destination>"
    exit 1
fi

SRC=$1
DST=$2

echo "=== Setup NAT port forwarding $SRC → $DST ==="

sudo iptables -t nat -A PREROUTING -p tcp --dport "$SRC" -j REDIRECT --to-port "$DST"

echo "Règle ajoutée."
echo "=== Setup terminé ==="