#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR=${1:-"./backup"}
mkdir -p "$TARGET_DIR"
TIMESTAMP=$(date '+%Y%m%d_%H%M%S')
tar czf "$TARGET_DIR/php_project_backup_$TIMESTAMP.tar.gz" . 
echo "✅ Backup créé: $TARGET_DIR/php_project_backup_$TIMESTAMP.tar.gz"
