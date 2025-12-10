#!/usr/bin/env bash

# Initialize a PHP project with Composer for Prestashop (Targeting 8.x)
set -e

PROJECT_DIR=$1
PS_VERSION=${2:-"8.*"}   # Default version = 8.*

# function to print usage
print_usage() {
    echo "Usage: $0 <project_directory> [prestashop_version]"
    echo "Example: $0 myshop 8.1.*"
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
    echo "Initializing a new Prestashop project (version $PS_VERSION)..."
    composer create-project "prestashop/prestashop:$PS_VERSION" . --no-interaction
else
    echo "composer.json found. Skipping project initialization."
fi

# --- Dependency Installation ---

if [ -f "composer.lock" ]; then
    echo "Installing dependencies..."
    composer install --no-interaction
else
    echo "No composer.lock found. Skipping dependency installation."
fi

echo "Prestashop project setup complete in $PROJECT_DIR."
exit 0
