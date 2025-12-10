#!/usr/bin/env bash
set -euo pipefail

echo "=== PHP: Lancement serveur local ==="
php -S 127.0.0.1:8000 -t public || echo "⚠️ Assurez-vous que le dossier 'public' existe"
