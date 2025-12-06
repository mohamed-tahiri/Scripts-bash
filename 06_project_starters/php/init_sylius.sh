#!/usr/bin/env bash

# Initialize a PHP project with Composer for Sylius
set -e

PROJECT_DIR=$1    

# function to print usage
print_usage() {
    echo "Usage: $0 <project_directory>"
    exit 1
}

# Check argument
if [ -z "$PROJECT_DIR" ]; then
    print_usage
fi

# --- Prerequisites Checks ---

# Check if PHP is installed
if ! command -v php &> /dev/null; then
    echo "PHP is not installed. Please install PHP to proceed."
    exit 1
fi

# Check if Composer is installed
if ! command -v composer &> /dev/null; then
    echo "Composer is not installed. Please install Composer to proceed."
    exit 1
fi  

# --- Project Initialization ---

# Create project directory if it doesn't exist
if [ ! -d "$PROJECT_DIR" ]; then
    mkdir -p "$PROJECT_DIR"
    echo "Created project directory: $PROJECT_DIR"
fi  

# Move inside project directory
cd "$PROJECT_DIR"
echo "Changed directory to $PROJECT_DIR"

# Correction: Autoriser le plugin RECTOR au NIVEAU DU PROJET AVANT create-project 
# Note: Cela nécessite que composer.json existe, ce qui n'est pas le cas.
# La meilleure pratique est de le faire APRÈS, mais cela crée le risque d'échec des scripts post-création.

# Tentative de créer le projet avec installation complète
if [ ! -f "composer.json" ]; then
    echo "Initializing a new Sylius project (with installation)..."
    
    # Étape 1: Tente de configurer l'autorisation du plugin au niveau global de Composer
    # Si cela échoue, la seule solution est de le faire après la création du fichier.
    echo "Attempting to allow the Rector plugin globally for this run..."
    composer config --no-plugins allow-plugins.rector/extension-installer true --global || true
    
    # Étape 2: Création du projet AVEC installation (ce qui est l'état désiré pour éviter l'erreur Runtime)
    composer create-project sylius/sylius-standard . --no-interaction
    
else
    echo "composer.json found. Skipping project initialization."
    
    # --- Dependency Installation (for existing project) ---
    if [ -f "composer.lock" ]; then
        echo "Installing dependencies..."
        composer install --no-interaction
    else
        echo "No composer.lock found. Skipping dependency installation."
    fi
fi

echo "Sylius project setup complete in $PROJECT_DIR."
exit 0