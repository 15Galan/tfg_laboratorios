# Imagen base
FROM alpine:3

# Paquetes necesarios
RUN apk upgrade
RUN apk add git wget openssh python3 py-pip bash

# Conexión SSH
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
RUN ssh-keygen -A
RUN echo 'root:root' | chpasswd
RUN mkdir /root/.ssh
RUN touch /root/.ssh/authorized_keys
RUN chmod 700 /root/.ssh
RUN chmod 600 /root/.ssh/authorized_keys

# Descargar el proyecto
COPY resources/ip-osint /root/h4_osint
WORKDIR /root/h4_osint
RUN chmod +x main.py
RUN pip install datetime requests shodan
WORKDIR /root

# Comando del contendor
CMD ["/usr/sbin/sshd", "-D"]
