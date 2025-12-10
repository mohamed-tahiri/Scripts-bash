#!/usr/bin/env bash
set -euo pipefail

DEPENDENCIES=("bash" "wget" "curl" "openssl" "dig")

echo "=== Vérification des dépendances ==="
for dep in "${DEPENDENCIES[@]}"; do
    if ! command -v "$dep" &>/dev/null; then
        echo "❌ Dépendance manquante : $dep"
    else
        echo "✅ $dep installé"
    fi
done
echo "=== Fin de la vérification des dépendances ==="
