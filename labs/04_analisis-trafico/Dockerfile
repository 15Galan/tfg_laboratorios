FROM linuxserver/wireshark:latest

# Paquetes necesarios
RUN apk upgrade
RUN apk add git openssh

# Conexión SSH
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
RUN ssh-keygen -A
RUN echo 'root:root' | chpasswd
RUN mkdir /root/.ssh
RUN touch /root/.ssh/authorized_keys
RUN chmod 700 /root/.ssh
RUN chmod 600 /root/.ssh/authorized_keys

# Descargar las capturas de Wireshark
RUN mkdir /config/capturas
COPY resources /config/capturas

# Comando del contendor
CMD ["/usr/sbin/sshd", "-D"]
