#!/bin/bash

# Script de configuration pour PHP-in-a-Box
# Permet de personnaliser le nom du projet et les paramètres

echo "🚀 Configuration de PHP-in-a-Box"
echo "================================"

# Vérifier si .env existe, sinon le créer
if [ ! -f ".env" ]; then
    echo "📝 Création du fichier .env..."
    cp .env.example .env
    echo "✅ Fichier .env créé à partir de .env.example"
else
    echo "✅ Fichier .env existe déjà"
fi

# Demander le nom du projet
read -p "📋 Nom du projet (défaut: php-in-a-box): " project_name
project_name=${project_name:-php-in-a-box}

# Demander le port
read -p "🌐 Port d'exposition (défaut: 7080): " expose_port
expose_port=${expose_port:-7080}

# Mettre à jour le fichier .env
echo "🔄 Mise à jour du fichier .env..."
sed -i "s/PROJECT_NAME=.*/PROJECT_NAME=$project_name/" .env
sed -i "s/EXPOSE_PORT=.*/EXPOSE_PORT=$expose_port/" .env

echo "✅ Configuration terminée !"
echo ""
echo "📋 Paramètres configurés :"
echo "   - Nom du projet: $project_name"
echo "   - Port: $expose_port"
echo "   - Image Docker: ${project_name}-image"
echo "   - Conteneur: ${project_name}-container"
echo ""
echo "🚀 Pour démarrer l'environnement :"
echo "   ./update.sh"
echo ""
echo "🌐 Votre application sera accessible sur :"
echo "   http://localhost:$expose_port" 