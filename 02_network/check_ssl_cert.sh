#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
    echo "Usage: $0 <domain>"
    exit 1
fi

DOMAIN=$1

echo "=== Vérification du certificat SSL pour $DOMAIN ==="
echo | openssl s_client -servername "$DOMAIN" -connect "$DOMAIN:443" 2>/dev/null \
    | openssl x509 -noout -dates
echo "=== Vérification terminée ==="