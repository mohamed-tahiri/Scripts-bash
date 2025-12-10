#!/usr/bin/env bash
set -euo pipefail

echo "=== PHP: Installation dépendances Composer ==="
if [ -f "composer.json" ]; then
    composer install
    echo "✅ Dépendances installées"
else
    echo "❌ Aucun fichier composer.json trouvé"
    exit 1
fi