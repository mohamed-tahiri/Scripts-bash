#!/usr/bin/env bash
set -euo pipefail

echo "=== Vérification des mots de passe faibles ==="

# Nécessite libpam-cracklib ou John the Ripper pour un vrai audit
# Ici on vérifie les comptes sans mot de passe
awk -F: '($2=="" && $1!="root") {print "⚠️ Account without password: "$1}' /etc/shadow || true
echo "=== Vérification terminée ==="