#!/usr/bin/env bash
set -euo pipefail

echo "=== JS: Démarrage serveur dev ==="
if [ -f "package.json" ]; then
    npm run dev || yarn dev
else
    echo "❌ package.json introuvable"
    exit 1
fi
echo "✅ Serveur dev démarré"