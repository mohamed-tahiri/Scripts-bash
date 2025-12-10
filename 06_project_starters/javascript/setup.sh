#!/usr/bin/env bash
set -euo pipefail

echo "=== JS: Installation dépendances ==="
if [ -f "package-lock.json" ]; then
    npm install
elif [ -f "yarn.lock" ]; then
    yarn install
else
    echo "❌ Aucun fichier de dépendances détecté"
    exit 1
fi
echo "✅ Dépendances installées"
