#!/usr/bin/env bash
set -euo pipefail

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"

run_script() {
    local script="$BASE_DIR/$1"
    if [ ! -f "$script" ]; then
        echo "❌ Script introuvable: $script"
        exit 1
    fi
    bash "$script" "${@:2}"
}

menu() {
    clear
    echo "======================================="
    echo "     🚀 PROJECT STARTERS TOOLBOX"
    echo "======================================="
    echo ""
    echo "1) PHP - Init projet"
    echo "2) PHP - Installer dépendances (Composer)"
    echo "3) PHP - Lancer serveur local"
    echo "4) PHP - Backup projet"
    echo "5) JS - Setup dépendances"
    echo "6) JS - Dev server"
    echo "7) JS - Run project"
    echo "8) JS - Transpile"
    echo "9) JS - Docker build"
    echo "10) JS - Lancer tests"
    echo "11) Java - Build"
    echo "12) Java - Nettoyer projet"
    echo "13) Java - Lancer tests"
    echo "0) Quitter"
    echo ""
    read -rp "Choix : " CHOICE

    case "$CHOICE" in
        1)
            read -rp "Projet PHP (drupal/laravel/php/prestashop/sylius/symfony/wordpress) : " proj
            run_script "php/init_${proj}.sh"
            ;;
        2)
            run_script "php/composer_install.sh"
            ;;
        3)
            run_script "php/run.sh"
            ;;
        4)
            run_script "php/backup.sh"
            ;;
        5)
            run_script "javascript/setup.sh"
            ;;
        6)
            run_script "javascript/dev.sh"
            ;;
        7)
            run_script "javascript/run.sh"
            ;;
        8)
            run_script "javascript/transpile.sh"
            ;;
        9)
            read -rp "Nom image Docker : " img
            run_script "javascript/docker_build.sh" "$img"
            ;;
        10)
            run_script "javascript/test.sh"
            ;;
        11)
            run_script "java/build.sh"
            ;;
        12)
            run_script "java/clean.sh"
            ;;
        13)
            run_script "java/test.sh"
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