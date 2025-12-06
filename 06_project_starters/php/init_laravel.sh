#!/usr/bin/env bash
# Initialize a PHP project with Composer for Laravel    
set -e

# --- Configuration ---
# Set the default project directory to the first argument or print usage if missing.
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

# Check if composer.json already exists (Laravel uses 'laravel/laravel' as the template)
if [ ! -f "composer.json" ]; then
    echo "Initializing a new Laravel project..."
    # The standard command to create a new Laravel project in the current directory ('.')
    composer create-project --prefer-dist laravel/laravel . --no-interaction
else
    echo "composer.json found. Skipping project initialization."
fi

# --- Dependency Installation ---

# Install dependencies if composer.lock exists (often skipped right after create-project)
if [ -f "composer.lock" ]; then
    echo "Installing dependencies..."
    # 'composer install' is run here, though 'create-project' usually handles it.
    composer install --no-interaction
else
    echo "No composer.lock found. Skipping dependency installation."
fi

# --- Final Steps ---

echo "Laravel project setup complete in $PROJECT_DIR."
exit 0