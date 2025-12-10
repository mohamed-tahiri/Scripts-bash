#!/usr/bin/env bash
set -euo pipefail

echo "=== Vérification des mises à jour de sécurité ==="

if command -v apt >/dev/null 2>&1; then
    sudo apt update
    sudo apt list --upgradable | grep -i security || echo "No security updates available"
elif command -v yum >/dev/null 2>&1; then
    sudo yum check-update --security || echo "No security updates available"
else
    echo "OS non supporté pour cette vérification"
fi
echo "=== Vérification terminée ==="