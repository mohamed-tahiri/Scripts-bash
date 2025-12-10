#!/usr/bin/env bash
set -euo pipefail

echo "=== Java: Nettoyage projet ==="
if [ -d "target" ]; then
    rm -rf target
fi
if [ -d "build" ]; then
    rm -rf build
fi
echo "✅ Nettoyage terminé"
