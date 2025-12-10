#!/usr/bin/env bash
set -euo pipefail

read_integer() {
    local prompt=$1
    local input
    while true; do
        read -rp "$prompt" input
        if [[ "$input" =~ ^[0-9]+$ ]]; then
            echo "$input"
            return
        else
            echo "❌ Entrée invalide. Veuillez entrer un nombre entier."
        fi
    done
}

# Exemple d'utilisation
# num=$(read_integer "Entrez un nombre: ")
# echo "Vous avez entré: $num"
