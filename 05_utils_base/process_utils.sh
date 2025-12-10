#!/usr/bin/env bash
set -euo pipefail

list_processes() {
    ps aux | less
}

kill_process() {
    local pid=$1
    if [[ -z "$pid" ]]; then
        echo "Usage: kill_process <pid>"
        return 1
    fi
    kill -9 "$pid" && echo "Process $pid killed" || echo "Failed to kill $pid"
}

# Exemple
# list_processes
# kill_process 12345
