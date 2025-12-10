#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
    echo "Usage: $0 <username>"
    exit 1
fi

USER=$1

echo "Désactivation du compte : $USER"
sudo usermod -L "$USER"
sudo passwd -l "$USER"

echo "Compte verrouillé."
echo "=== Fin du verrouillage — $(date) ==="