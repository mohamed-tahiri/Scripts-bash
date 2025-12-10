#!/usr/bin/env bash
set -euo pipefail

SEC_DIR="$(cd "$(dirname "$0")" && pwd)"

run_script() {
    local script="$SEC_DIR/$1"
    if [ ! -f "$script" ]; then
        echo "❌ Script introuvable: $script"
        exit 1
    fi
    bash "$script" "${@:2}"
}

menu() {
    clear
    echo "======================================="
    echo "       🔒 SECURITY TOOLBOX v1.0"
    echo "======================================="
    echo ""
    echo "1) Chiffrer un backup"
    echo "2) Vérifier les mots de passe faibles"
    echo "3) Vérifier l’intégrité des fichiers"
    echo "4) Vérifier les patchs OS"
    echo "5) Auditer les clés SSH"
    echo "6) Auditer les privilèges sudo"
    echo "0) Quitter"
    echo ""
    read -rp "Choix : " CHOICE

    case "$CHOICE" in
        1)
            read -rp "Dossier source : " src
            read -rp "Fichier destination (.enc) : " dst
            run_script "backup_encryption.sh" "$src" "$dst"
            ;;
        2)
            run_script "check_bad_passwd.sh"
            ;;
        3)
            run_script "file_integrity_check.sh"
            ;;
        4)
            run_script "os_patch_check.sh"
            ;;
        5)
            run_script "ssh_key_audit.sh"
            ;;
        6)
            run_script "sudo_audit.sh"
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