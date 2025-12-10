#!/usr/bin/env bash
set -euo pipefail

echo "=== JS: Transpilation ==="
if [ -f "tsconfig.json" ]; then
    npx tsc
else
    echo "❌ Aucun fichier tsconfig.json trouvé"
    exit 1
fi
echo "✅ Transpilation terminée avec succès"