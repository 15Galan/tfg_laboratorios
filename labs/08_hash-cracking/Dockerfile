# Imagen padre
FROM debian:11

# Paquetes básicos
RUN apt update && apt upgrade -y
RUN apt install vim nano ssh -y

# Paquetes específicos para el laboratorio
RUN apt install software-properties-common dirmngr gnupg2 mariadb-server -y

# Paquetes específicos de ciberseguridad
RUN apt install hashcat john hashid -y

# Conexión SSH
RUN mkdir -p /run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Ficheros
RUN mkdir /root/resources
COPY resources /root/resources

# Servicio y operaciones de la imagen
CMD service mariadb start \
    && mariadb < /root/resources/md5.sql \
    && mariadb < /root/resources/sha256.sql \
    && mariadb < /root/resources/sha256-2.sql \
    && rm -rf /root/resources \
    && /usr/sbin/sshd -D
