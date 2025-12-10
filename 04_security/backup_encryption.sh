#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 2 ]; then
    echo "Usage: $0 <source_dir> <destination_file.enc>"
    exit 1
fi

SOURCE_DIR=$1
DEST_FILE=$2
PASSPHRASE=${PASSPHRASE:-""}

if [ -z "$PASSPHRASE" ]; then
    read -rsp "Enter passphrase for encryption: " PASSPHRASE
    echo ""
fi

tar czf - "$SOURCE_DIR" | openssl enc -aes-256-cbc -e -pass pass:"$PASSPHRASE" -out "$DEST_FILE"

echo "Backup encrypted to $DEST_FILE"
