#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
    echo "Usage: $0 <config_file>"
    exit 1
fi

CONFIG_FILE="$1"

if [ ! -f "$CONFIG_FILE" ]; then
    echo "❌ Fichier de config introuvable: $CONFIG_FILE"
    exit 1
fi

echo "=== Parsing configuration: $CONFIG_FILE ==="
while IFS='=' read -r key value; do
    [[ "$key" =~ ^#.*$ ]] && continue
    [[ -z "$key" ]] && continue
    echo "$key = $value"
done < "$CONFIG_FILE"
echo "=== End of configuration ==="