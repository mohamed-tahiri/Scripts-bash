#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 2 ]; then
    echo "Usage: $0 <source_image:tag> <target_image:tag>"
    exit 1
fi

SOURCE=$1
TARGET=$2

echo "Pulling $SOURCE..."
docker pull "$SOURCE"

echo "Tagging $TARGET..."
docker tag "$SOURCE" "$TARGET"

echo "Pushing $TARGET..."
docker push "$TARGET"

echo "✅ Image tag synced from $SOURCE to $TARGET"
