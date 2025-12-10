#!/usr/bin/env bash
set -euo pipefail

TARGET_DIRS=("/etc" "/usr/bin" "/usr/sbin")
LOG_FILE="/var/log/fs_integrity.log"

echo "=== Vérification d’intégrité — $(date) ===" | tee -a "$LOG_FILE"

for dir in "${TARGET_DIRS[@]}"; do
    echo "Scanning $dir..." | tee -a "$LOG_FILE"
    find "$dir" -type f -exec sha256sum {} \; >> "$LOG_FILE"
done

echo "Intégrité terminée."
echo "=== Fin de la vérification — $(date) ===" | tee -a "$LOG_FILE"