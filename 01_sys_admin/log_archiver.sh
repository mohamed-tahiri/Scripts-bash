#!/usr/bin/env bash
set -euo pipefail

LOG_DIR="/var/log"
ARCHIVE_DIR="/var/log/archive"
mkdir -p "$ARCHIVE_DIR"

find "$LOG_DIR" -name "*.log" -mtime +7 | while read -r file; do
    gzip "$file"
    mv "${file}.gz" "$ARCHIVE_DIR"
    echo "Archivé: $file"
done

echo "Archivage terminé."
