#!/usr/bin/env bash
set -euo pipefail

echo "=== Audit des privilèges sudo ==="

sudo grep -E '^[^#].*ALL' /etc/sudoers /etc/sudoers.d/* || echo "Aucun privilège sudo trouvé"
echo "=== Audit terminé ==="