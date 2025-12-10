#!/usr/bin/env bash
set -euo pipefail

echo "=== Java: Lancer tests unitaires ==="
if [ -f "pom.xml" ]; then
    mvn test
elif [ -f "build.gradle" ]; then
    ./gradlew test
else
    echo "❌ Aucun fichier de build détecté"
    exit 1
fi
echo "✅ Tests unitaires terminés avec succès"