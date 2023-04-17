FROM php:7.4-apache

# Actualizamos los paquetes del sistema y instalamos las dependencias necesarias
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git

# Clonamos el repositorio de la página vulnerable desde GitHub
RUN git clone https://github.com/sqlmapproject/sqlmap.git /tmp/sqlmap
RUN git clone https://github.com/ethicalhack3r/DVWA.git /var/www/html/dvwa

RUN cp /var/www/html/dvwa/config/config.inc.php.dist /var/www/html/dvwa/config/config.inc.php && \
    sed -i 's/^\(.*security.*=.*\)impossible\(.*\)$/\\1low\\2/' /var/www/html/dvwa/config/config.inc.php

RUN chown -R www-data:www-data /var/www/html/dvwa && \
    chmod -R 755 /var/www/html/dvwa && \
    chmod -R 777 /var/www/html/dvwa/hackable/uploads/

# Copiamos los archivos de la página vulnerable al directorio de la página web
# COPY vulnerable_page /var/www/html/
