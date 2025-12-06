#!/usr/bin/env bash

# Initialize a generic PHP project with Composer and a starter structure
set -e

PROJECT_DIR=$1    
DEFAULT_VENDOR="mycompany"
DEFAULT_NAMESPACE="App"
PACKAGE_NAME="$DEFAULT_VENDOR/$PROJECT_DIR"
MONOLOG_VERSION="^3.0" # Version stable compatible avec PHP 8.x

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

# Check if composer.json already exists
if [ ! -f "composer.json" ]; then
    echo "Initializing a new generic PHP project (Minimal + Monolog)..."
    
    # 1. Créer le fichier composer.json complet, y compris l'autoloading et les dépendances
    echo "Creating composer.json with required dependencies..."
    cat > composer.json <<EOL
{
    "name": "$PACKAGE_NAME",
    "type": "project",
    "description": "PHP Starter project generated via bash script.",
    "require": {
        "php": ">=8.0",
        "monolog/monolog": "$MONOLOG_VERSION"
    },
    "autoload": {
        "psr-4": {
            "$DEFAULT_NAMESPACE\\\\": "src/"
        }
    },
    "license": "proprietary"
}
EOL

    # 2. Installer les dépendances (créer vendor/ et autoload.php)
    echo "Installing dependencies (monolog/monolog)..."
    composer install --no-interaction
    
    # 3. Créer la structure de dossiers standard
    mkdir -p src public tests
    echo "Created standard directories: src/, public/, tests/"
    
    # 4. Créer le fichier de classe (src/MyClass.php) pour tester l'autoloading PSR-4
    echo "Creating starter file (src/MyClass.php)..."
    cat > src/MyClass.php <<EOL
<?php

namespace $DEFAULT_NAMESPACE;

class MyClass
{
    public function getMessage(): string
    {
        return "Hello from MyClass in the $DEFAULT_NAMESPACE namespace!";
    }
}
EOL

    # 5. Créer le point d'entrée public/index.php
    echo "Creating starter file (public/index.php)..."
    cat > public/index.php <<EOL
<?php
// Charger les dépendances, l'autoloader PSR-4, etc.
require dirname(__DIR__) . "/vendor/autoload.php";

use Monolog\Logger;
use Monolog\Handler\StreamHandler;
use $DEFAULT_NAMESPACE\\MyClass;

\$log = new Logger("APP_STARTER");
// Enregistrer les logs dans un fichier à la racine du projet
\$log->pushHandler(new StreamHandler(dirname(__DIR__) . "/app.log", Logger::WARNING));

// Tester l'autoloading de la classe personnalisée et loguer le message
\$myClass = new MyClass();
\$log->info(\$myClass->getMessage());

\$log->warning("Le projet PHP starter a démarré avec succès.");

echo "<!DOCTYPE html><html><head><title>PHP Starter</title></head><body>";
echo "<h1>PHP Starter Project</h1>";
echo "<p>Success! Composer is working and Monolog is logging messages to <code>app.log</code>.</p>";
echo "<p>Output from custom class: <strong>" . \$myClass->getMessage() . "</strong></p>";
echo "<p>Start coding in the <code>src/</code> directory.</p>";
echo "</body></html>";
EOL
        
else
    echo "composer.json found. Skipping project initialization."
    
    # Si le fichier existe, on installe juste les dépendances
    if [ -f "composer.lock" ]; then
        echo "Installing dependencies..."
        composer install --no-interaction
    else
        echo "No composer.lock found. Skipping dependency installation."
    fi
fi

echo "---"
echo "PHP Starter Project setup complete in $PROJECT_DIR."
echo "Next step: Run 'php -S 127.0.0.1:8000 -t public' and open http://localhost:8000 in your browser."
exit 0