#!/usr/bin/env bash
set -euo pipefail

TARGET_DIRS=("/etc" "/usr/bin" "/usr/sbin")
LOG_FILE="/var/log/file_integrity_security.log"

echo "=== File Integrity Check - $(date) ===" | tee -a "$LOG_FILE"

for dir in "${TARGET_DIRS[@]}"; do
    echo "Scanning $dir..." | tee -a "$LOG_FILE"
    find "$dir" -type f -exec sha256sum {} \; >> "$LOG_FILE"
done

echo "Integrity check completed."
echo "=== End of Check ===" | tee -a "$LOG_FILE"