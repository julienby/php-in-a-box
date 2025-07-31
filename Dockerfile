# Utilisez une image de base PHP avec Apache
FROM php:apache

# Installez les dépendances et extensions nécessaires
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libldap2-dev \
    sqlite3 \
    libsqlite3-dev \
    git \
    unzip \
    && docker-php-ext-configure ldap \
    && docker-php-ext-install \
        curl \
        ldap \
        pdo \
        pdo_sqlite

# Installation de Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Configurations Apache
RUN a2enmod rewrite \
    && echo "ServerName localhost" >> /etc/apache2/apache2.conf \
    && sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

# Copiez la configuration PHP personnalisée
COPY php.ini /usr/local/etc/php/conf.d/custom.ini

# Copiez les fichiers de l'application
COPY ./src /var/www/html

# Copiez composer.json et composer.lock s'ils existent
COPY composer.json* /var/www/html/

# Installation des dépendances Composer (si composer.json existe)
RUN if [ -f /var/www/html/composer.json ]; then \
        cd /var/www/html && composer install --no-dev --optimize-autoloader; \
    fi

# Définir les permissions appropriées
RUN chown -R www-data:www-data /var/www/html

# Expose le port 80
EXPOSE 80
