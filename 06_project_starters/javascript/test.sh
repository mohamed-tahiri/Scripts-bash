#!/usr/bin/env bash
set -euo pipefail

echo "=== JS: Lancer tests ==="
npm test || yarn test
