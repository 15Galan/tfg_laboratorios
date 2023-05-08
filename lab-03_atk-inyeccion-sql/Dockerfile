# Imagen base
FROM sagikazarmark/dvwa:latest

# Cambio en la configuración por defecto de DVWA (dificultad imposible -> baja)
RUN sed -i 's/^$_DVWA\[ '\''default_security_level'\'' \] = '\''impossible'\'';$/$_DVWA[ '\''default_security_level'\'' ] = '\''low'\'';/' /var/www/html/config/config.inc.php
