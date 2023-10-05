## -*- dockerfile-image-name: "las-webproject" -*-

FROM php:8.0-apache

# Abilitare il modulo SSL e altre dipendenze necessarie
RUN a2enmod ssl rewrite && a2ensite default-ssl

# Copia i certificati, configurazioni e codice PHP
COPY certs/ /etc/apache2/ssl/
COPY conf/  /etc/apache2/sites-available/
COPY src/   /var/www/html/

EXPOSE 80 443

CMD ["apache2-foreground"]
