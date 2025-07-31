#!/bin/bash

# Script d'information pour PHP-in-a-Box
# Affiche les paramètres de configuration du projet

echo "📋 Informations du projet PHP-in-a-Box"
echo "======================================"

# Charger les variables d'environnement
if [ -f ".env" ]; then
    export $(cat .env | grep -v '^#' | xargs)
    echo "✅ Configuration chargée depuis .env"
else
    echo "⚠️  Fichier .env non trouvé, utilisation des valeurs par défaut"
fi

echo ""
echo "🔧 Configuration actuelle :"
echo "   📋 Nom du projet: ${PROJECT_NAME:-php-in-a-box}"
echo "   🌐 Port d'exposition: ${EXPOSE_PORT:-7080}"
echo "   🐳 Nom de l'image: ${DOCKER_IMAGE_NAME:-php-in-a-box-image}"
echo "   📦 Nom du conteneur: ${DOCKER_CONTAINER_NAME:-php-in-a-box-container}"
echo "   💾 Mémoire PHP: ${PHP_MEMORY_LIMIT:-256M}"
echo "   ⏱️  Timeout PHP: ${PHP_MAX_EXECUTION_TIME:-300}s"
echo ""

# Vérifier l'état des conteneurs
echo "🐳 État des conteneurs Docker :"
if command -v docker &> /dev/null; then
    ./docker-compose-wrapper.sh ps
else
    echo "⚠️  docker non trouvé"
fi

echo ""
echo "🌐 URL d'accès :"
echo "   http://localhost:${EXPOSE_PORT:-7080}"

echo ""
echo "📁 Structure du projet :"
echo "   📂 src/ - Code source de votre application"
echo "   📄 .env - Configuration du projet (créé par setup.sh)"
echo "   📄 docker-compose.yml - Configuration Docker"
echo "   📄 Dockerfile - Image Docker personnalisée"

echo ""
echo "🛠️  Commandes utiles :"
echo "   ./setup.sh    - Configurer le projet"
echo "   ./update.sh   - Démarrer/redémarrer l'environnement"
echo "   ./info.sh     - Afficher ces informations"
echo "   docker-compose logs php-apache - Voir les logs" 