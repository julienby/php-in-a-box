#!/bin/bash

# Charger les variables d'environnement
if [ -f ".env" ]; then
    export $(cat .env | grep -v '^#' | xargs)
    echo "✅ Variables d'environnement chargées depuis .env"
else
    echo "⚠️  Fichier .env non trouvé, utilisation des valeurs par défaut"
fi

# Créer le dossier src s'il n'existe pas
if [ ! -d "src" ]; then
    mkdir src
    echo "📁 Dossier src créé"
fi

echo "🔄 Arrêt et suppression des conteneurs..."
./docker-compose-wrapper.sh down --remove-orphans

echo "📦 Mise à jour des images..."
./docker-compose-wrapper.sh pull

echo "🚀 Démarrage de l'environnement..."
./docker-compose-wrapper.sh up -d --build --force-recreate

# Afficher les informations du projet
echo ""
echo "✅ Environnement démarré avec succès !"
echo "📋 Projet: ${PROJECT_NAME:-php-in-a-box}"
echo "🌐 URL: http://localhost:${EXPOSE_PORT:-7080}"
echo "🐳 Image: ${DOCKER_IMAGE_NAME:-php-in-a-box-image}"
echo "📦 Conteneur: ${DOCKER_CONTAINER_NAME:-php-in-a-box-container}"
