# PHP-in-a-Box 🚀

Environnement PHP Docker complet pour le développement de projets.

## ✨ Fonctionnalités

- **PHP 8.x** avec Apache
- **Composer** pour la gestion des dépendances
- **Extensions PHP** : curl, ldap, pdo, pdo_sqlite
- **Base de données SQLite** intégrée
- **Configuration PHP** personnalisée
- **Hot-reload** avec volumes Docker

## 🚀 Démarrage rapide

1. **Cloner le projet** :
   ```bash
   git clone <votre-repo>
   cd php-in-a-box
   ```

2. **Lancer l'environnement** :
   ```bash
   ./update.sh
   ```

3. **Accéder à l'application** :
   Ouvrez votre navigateur sur `http://localhost:7080`

## 📁 Structure du projet

```
php-in-a-box/
├── src/                    # Code source de votre application
│   └── index.php          # Fichier d'exemple
├── docker-compose.yml     # Configuration Docker Compose
├── Dockerfile             # Image Docker personnalisée
├── php.ini               # Configuration PHP
├── composer.json         # Dépendances PHP
├── .dockerignore         # Optimisation des builds
├── .gitignore           # Fichiers à ignorer
└── update.sh            # Script de mise à jour
```

## 🔧 Configuration

### PHP
- Fichier de configuration : `php.ini`
- Extensions disponibles : curl, ldap, pdo, pdo_sqlite
- Limites : 256M mémoire, 300s timeout

### Composer
- Gestion automatique des dépendances
- Autoloader PSR-4 configuré
- Scripts personnalisés disponibles

### Base de données
- SQLite intégré
- PDO configuré
- Base de données en mémoire pour les tests

## 📦 Ajouter des dépendances

```bash
# Dans le conteneur
docker-compose exec php-apache composer require monolog/monolog

# Ou localement (si Composer installé)
composer require monolog/monolog
```

## 🛠️ Commandes utiles

```bash
# Redémarrer l'environnement
./update.sh

# Accéder au conteneur
docker-compose exec php-apache bash

# Voir les logs
docker-compose logs php-apache

# Arrêter l'environnement
docker-compose down
```

## 🧪 Tests

L'environnement inclut PHPUnit pour les tests :

```bash
# Dans le conteneur
docker-compose exec php-apache vendor/bin/phpunit

# Ou avec Composer
docker-compose exec php-apache composer test
```

## 📝 Notes

- Le port par défaut est **7080**
- Les fichiers dans `src/` sont automatiquement synchronisés
- Les modifications de `php.ini` nécessitent un rebuild
- Composer installe automatiquement les dépendances au build

## 🤝 Contribution

1. Fork le projet
2. Créer une branche feature
3. Commiter les changements
4. Pousser vers la branche
5. Ouvrir une Pull Request
