#!/usr/bin/env bash
set -euo pipefail

echo "=== Interactive Prompt Example ==="
PS3="Choisissez une option: "
options=("Option 1" "Option 2" "Quitter")
select opt in "${options[@]}"; do
    case $opt in
        "Option 1")
            echo "Vous avez choisi Option 1"
            ;;
        "Option 2")
            echo "Vous avez choisi Option 2"
            ;;
        "Quitter")
            echo "Bye 👋"
            break
            ;;
        *)
            echo "❌ Choix invalide"
            ;;
    esac
done
echo "=== Fin de l'exemple d'invite interactive ==="