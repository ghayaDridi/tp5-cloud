FROM php:8.2-apache

# Copier tous les fichiers PHP dans le répertoire web d'Apache
COPY . /var/www/html/

# Render utilise le port 10000 par défaut
EXPOSE 10000

# Configurer Apache pour écouter sur le port 10000
RUN sed -i 's/Listen 80/Listen 10000/' /etc/apache2/ports.conf && \
    sed -i 's/:80/:10000/' /etc/apache2/sites-available/000-default.conf

# Démarrer Apache
CMD ["apache2-foreground"]