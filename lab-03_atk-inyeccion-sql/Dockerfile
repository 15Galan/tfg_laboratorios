FROM ubuntu:20.04

# RUN apt-get update -y
RUN apt-get install apache2 php libapache2-mod-php php-mysql git -y
RUN git clone https://github.com/ethicalhack3r/DVWA.git /var/www/html/dvwa

RUN cp /var/www/html/dvwa/config/config.inc.php.dist /var/www/html/dvwa/config/config.inc.php
RUN sed -i 's/^\(.*security.*=.*\)impossible\(.*\)$/\\1low\\2/' /var/www/html/dvwa/config/config.inc.php

RUN chown -R www-data:www-data /var/www/html/dvwa
RUN chmod -R 755 /var/www/html/dvwa
RUN chmod -R 777 /var/www/html/dvwa/hackable/uploads/

# COPY start.sh /start.sh
# RUN chmod 777 /start.sh

EXPOSE 80

CMD ["./start.sh"]
