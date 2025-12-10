#!/usr/bin/env bash
set -euo pipefail

TEST_URL="http://speedtest.tele2.net/1MB.zip"
TMP_FILE="/tmp/speedtest.bin"

echo "=== Test de bande passante ==="

echo "[1] Test de latence (ping vers 8.8.8.8)..."
ping -c 4 8.8.8.8

echo "[2] Test de débit (download fichier 1MB)..."
START=$(date +%s)
wget -q --show-progress -O "$TMP_FILE" "$TEST_URL"
END=$(date +%s)

SIZE_MB=1
DURATION=$(( END - START ))
SPEED=$(( SIZE_MB * 8 / ( DURATION > 0 ? DURATION : 1 ) ))

echo "Temps: ${DURATION}s"
echo "Débit approx: ~${SPEED} Mbps"

rm -f "$TMP_FILE"
echo "=== Test terminé ==="