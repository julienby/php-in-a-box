#!/bin/bash

# Wrapper pour détecter automatiquement la commande docker compose
# Compatible avec les anciennes et nouvelles versions de Docker

# Fonction pour détecter la commande docker compose
detect_docker_compose() {
    if command -v docker &> /dev/null; then
        # Test si docker compose fonctionne (nouvelle syntaxe)
        if docker compose version &> /dev/null; then
            echo "docker compose"
            return 0
        fi
    fi
    
    # Test de l'ancienne syntaxe docker-compose
    if command -v docker-compose &> /dev/null; then
        echo "docker-compose"
        return 0
    fi
    
    # Aucune commande trouvée
    echo "none"
    return 1
}

# Détecter la commande à utiliser
DOCKER_COMPOSE_CMD=$(detect_docker_compose)

if [ "$DOCKER_COMPOSE_CMD" = "none" ]; then
    echo "❌ Erreur: Aucune commande docker compose trouvée"
    echo "   Installez Docker et Docker Compose"
    exit 1
fi

# Exécuter la commande avec tous les arguments passés
$DOCKER_COMPOSE_CMD "$@" 