#!/bin/bash

# Script de mise à jour sécurisé pour le serveur
# Évite les conflits Git lors des pulls

echo "🔄 Mise à jour sécurisée du serveur"
echo "===================================="

# Vérifier s'il y a des modifications locales
if [ -n "$(git status --porcelain)" ]; then
    echo "⚠️  Modifications locales détectées"
    echo "💾 Sauvegarde des modifications..."
    git add .
    git commit -m "Sauvegarde automatique avant pull - $(date)"
    echo "✅ Modifications sauvegardées"
else
    echo "✅ Aucune modification locale"
fi

# Récupérer les dernières modifications
echo "📥 Récupération des modifications distantes..."
git fetch origin

# Vérifier s'il y a des conflits potentiels
if git merge-tree $(git merge-base HEAD origin/main) HEAD origin/main | grep -q "<<<<<<<"; then
    echo "⚠️  Conflits détectés !"
    echo "🔄 Réinitialisation forcée..."
    git reset --hard origin/main
    echo "✅ Conflits résolus"
else
    echo "✅ Aucun conflit détecté"
    git pull origin main
fi

# Mettre à jour les permissions des scripts
echo "🔧 Mise à jour des permissions..."
chmod +x *.sh

echo "✅ Mise à jour terminée avec succès !"
echo ""
echo "📋 État actuel :"
git log --oneline -3 