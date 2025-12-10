#!/usr/bin/env bash
set -euo pipefail

echo "=== Java: Build projet ==="
if [ -f "pom.xml" ]; then
    mvn clean install
elif [ -f "build.gradle" ]; then
    ./gradlew build
else
    echo "❌ Aucun fichier de build détecté (pom.xml ou build.gradle)"
    exit 1
fi
echo "✅ Build terminé avec succès"