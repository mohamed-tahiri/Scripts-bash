#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
    echo "Usage: $0 <domain>"
    exit 1
fi

DOMAIN=$1
NAMESERVERS=("8.8.8.8" "1.1.1.1" "9.9.9.9" "208.67.222.222")

echo "=== Vérification DNS pour $DOMAIN ==="

for ns in "${NAMESERVERS[@]}"; do
    echo -n "Serveur $ns → "
    dig @"$ns" +short A "$DOMAIN"
done
echo "=== Vérification terminée ==="