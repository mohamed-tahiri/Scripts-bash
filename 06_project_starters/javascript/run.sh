#!/usr/bin/env bash
set -euo pipefail

echo "=== JS: Lancement du projet ==="
npm start || yarn start
