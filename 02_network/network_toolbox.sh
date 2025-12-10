#!/usr/bin/env bash
set -euo pipefail

NETWORK_DIR="$(cd "$(dirname "$0")" && pwd)"

# Vérifier qu’un script existe avant de l’exécuter
run_script() {
    local script="$NETWORK_DIR/$1"
    if [ ! -f "$script" ]; then
        echo "❌ Script introuvable: $script"
        exit 1
    fi
    bash "$script" "${@:2}"
}

menu() {
    clear
    echo "======================================="
    echo "        🧰 NETWORK TOOLBOX v1.0"
    echo "======================================="
    echo ""
    echo "1) Test de bande passante"
    echo "2) Vérifier certificat SSL"
    echo "3) Vérifier propagation DNS"
    echo "4) Trouver IP & MAC d'une interface"
    echo "5) Configurer port forwarding"
    echo "6) Afficher les routes"
    echo "0) Quitter"
    echo ""
    read -rp "Choix : " CHOICE

    case "$CHOICE" in
        1)
            run_script "bandwidth_test.sh"
            ;;
        2)
            read -rp "Domaine : " domain
            run_script "check_ssl_cert.sh" "$domain"
            ;;
        3)
            read -rp "Domaine : " domain
            run_script "dns_propagation_check.sh" "$domain"
            ;;
        4)
            read -rp "Interface (eth0, wlan0...) : " iface
            run_script "find_ip_mac.sh" "$iface"
            ;;
        5)
            read -rp "Port source : " src
            read -rp "Port destination : " dst
            run_script "port_forward_setup.sh" "$src" "$dst"
            ;;
        6)
            run_script "show_route.sh"
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
