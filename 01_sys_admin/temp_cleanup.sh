#!/usr/bin/env bash
set -euo pipefail

TARGETS=("/tmp" "/var/tmp")

for path in "${TARGETS[@]}"; do
    echo "Nettoyage de $path..."
    find "$path" -type f -mtime +3 -delete
done

echo "Nettoyage terminé."
echo "=== Fin du nettoyage — $(date) ==="