#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 2 ]; then
    echo "Usage: $0 <deployment_name> <replicas>"
    exit 1
fi

DEPLOYMENT=$1
REPLICAS=$2

kubectl scale deployment "$DEPLOYMENT" --replicas="$REPLICAS"

echo "✅ Deployment $DEPLOYMENT scaled to $REPLICAS replicas"
