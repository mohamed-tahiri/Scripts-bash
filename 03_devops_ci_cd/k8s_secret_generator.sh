#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 3 ]; then
    echo "Usage: $0 <secret_name> <namespace> <key=value,...>"
    exit 1
fi

SECRET_NAME=$1
NAMESPACE=$2
DATA=$3

kubectl create secret generic "$SECRET_NAME" -n "$NAMESPACE" $(echo "$DATA" | tr ',' ' ') --dry-run=client -o yaml | kubectl apply -f -

echo "✅ Secret $SECRET_NAME applied in namespace $NAMESPACE"
