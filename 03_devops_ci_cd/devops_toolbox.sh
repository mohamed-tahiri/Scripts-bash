#!/usr/bin/env bash
set -euo pipefail

DEVOPS_DIR="$(cd "$(dirname "$0")" && pwd)"

run_script() {
    local script="$DEVOPS_DIR/$1"
    if [ ! -f "$script" ]; then
        echo "❌ Script introuvable: $script"
        exit 1
    fi
    bash "$script" "${@:2}"
}

menu() {
    clear
    echo "======================================="
    echo "       ⚙️ DEVOPS TOOLBOX v1.0"
    echo "======================================="
    echo ""
    echo "1) Synchroniser Docker image tags"
    echo "2) Build multi-arch Docker"
    echo "3) Créer un Git release tag"
    echo "4) Mettre à jour les dépendances Helm"
    echo "5) Scale un déploiement Kubernetes"
    echo "6) Générer un secret Kubernetes"
    echo "0) Quitter"
    echo ""
    read -rp "Choix : " CHOICE

    case "$CHOICE" in
        1)
            read -rp "Source image:tag : " src
            read -rp "Target image:tag : " tgt
            run_script "docker_image_tag_sync.sh" "$src" "$tgt"
            ;;
        2)
            read -rp "Dockerfile directory : " dir
            read -rp "Image:tag : " img
            run_script "docker_multiarch_build.sh" "$dir" "$img"
            ;;
        3)
            read -rp "Version tag : " ver
            run_script "git_release_tag.sh" "$ver"
            ;;
        4)
            read -rp "Chart directory : " chart
            run_script "helm_dependency_update.sh" "$chart"
            ;;
        5)
            read -rp "Deployment name : " dep
            read -rp "Nombre de replicas : " reps
            run_script "k8s_scale_deployment.sh" "$dep" "$reps"
            ;;
        6)
            read -rp "Secret name : " secret
            read -rp "Namespace : " ns
            read -rp "Data (key=value,key=value) : " data
            run_script "k8s_secret_generator.sh" "$secret" "$ns" "$data"
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