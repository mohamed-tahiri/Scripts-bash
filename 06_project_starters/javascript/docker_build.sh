#!/usr/bin/env bash
set -euo pipefail

IMAGE_NAME=${1:-"js_project:latest"}
echo "=== Build Docker image $IMAGE_NAME ==="

docker build -t "$IMAGE_NAME" .
echo "✅ Docker image $IMAGE_NAME créée"
