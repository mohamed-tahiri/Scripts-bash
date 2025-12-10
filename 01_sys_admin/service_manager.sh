#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 2 ]; then
    echo "Usage: $0 <service> <start|stop|restart|status>"
    exit 1
fi

SERVICE=$1
ACTION=$2

echo "Action : $ACTION sur service : $SERVICE"
sudo systemctl "$ACTION" "$SERVICE"
