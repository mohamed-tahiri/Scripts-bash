#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 2 ]; then
    echo "Usage: $0 <Dockerfile_dir> <image:tag>"
    exit 1
fi

DIR=$1
IMAGE=$2

docker buildx create --use || true
docker buildx build --platform linux/amd64,linux/arm64 -t "$IMAGE" "$DIR" --push

echo "✅ Multi-arch image built and pushed: $IMAGE"
