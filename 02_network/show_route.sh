#!/usr/bin/env bash
set -euo pipefail

echo "=== Routes IPv4 ==="
ip route show

echo ""
echo "=== Routes IPv6 ==="
ip -6 route show
echo "=== Fin des routes ==="