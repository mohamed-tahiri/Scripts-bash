#!/usr/bin/env bash
set -euo pipefail

echo "=== Audit des clés SSH ==="

AUTHORIZED_KEYS="/root/.ssh/authorized_keys"
[ -f "$AUTHORIZED_KEYS" ] && echo "Root authorized keys:" && cat "$AUTHORIZED_KEYS"

for user in $(cut -f1 -d: /etc/passwd); do
    USER_KEYS="/home/$user/.ssh/authorized_keys"
    if [ -f "$USER_KEYS" ]; then
        echo "User $user keys:"
        cat "$USER_KEYS"
    fi
done
echo "=== Audit terminé ==="