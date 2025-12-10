#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
    echo "Usage: $0 <version_tag>"
    exit 1
fi

TAG=$1

git add .
git commit -m "Release $TAG"
git tag -a "$TAG" -m "Release $TAG"
git push origin main --tags

echo "✅ Release tag created and pushed: $TAG"
