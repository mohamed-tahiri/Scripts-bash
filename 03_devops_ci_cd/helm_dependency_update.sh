#!/usr/bin/env bash
set -euo pipefail

CHART_DIR=${1:-.}

echo "Updating Helm dependencies in $CHART_DIR..."
helm dependency update "$CHART_DIR"

echo "✅ Helm dependencies updated"
