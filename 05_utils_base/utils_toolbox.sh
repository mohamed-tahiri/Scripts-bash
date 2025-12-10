#!/usr/bin/env bash
set -euo pipefail

UTILS_DIR="$(cd "$(dirname "$0")" && pwd)"

run_script() {
    local script="$UTILS_DIR/$1"
    if [ ! -f "$script" ]; then
        echo "❌ Script introuvable: $script"
        exit 1
    fi
    bash "$script" "${@:2}"
}

menu() {
    clear
    echo "======================================="
    echo "      🛠️ UTILS BASE TOOLBOX v1.0"
    echo "======================================="
    echo ""
    echo "1) Parser fichier de configuration"
    echo "2) Vérifier dépendances"
    echo "3) Validation d'entrée"
    echo "4) Menu interactif"
    echo "5) Logging"
    echo "6) Gestion des processus"
    echo "0) Quitter"
    echo ""
    read -rp "Choix : " CHOICE

    case "$CHOICE" in
        1)
            read -rp "Fichier config : " cfg
            run_script "config_parser.sh" "$cfg"
            ;;
        2)
            run_script "dependency_check.sh"
            ;;
        3)
            echo "Exemple de lecture d'un entier :"
            run_script "input_validation.sh"
            ;;
        4)
            run_script "interactive_prompt.sh"
            ;;
        5)
            run_script "logging.sh"
            ;;
        6)
            run_script "process_utils.sh"
            ;;
        0)
            echo "Bye 👋"
            exit 0
            ;;
        *)
            echo "❌ Choix invalide"
            ;;
    esac

    echo ""
    read -rp "Appuie sur Entrée pour revenir au menu..."
}

while true; do
    menu
done