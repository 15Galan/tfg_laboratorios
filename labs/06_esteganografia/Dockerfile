# Imagen padre
FROM debian:11

# Paquetes básicos
RUN apt update && apt upgrade -y
RUN apt install sudo bash vim nano ssh -y

# Paquetes específicos de ciberseguridad
RUN apt install steghide exiftool -y

# Creación de usuarios
RUN mkdir -p /run/sshd
RUN adduser user --disabled-password
RUN echo 'user:user' | chpasswd
RUN echo 'root:platinum' | chpasswd

# Configuración de SSH
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
RUN ssh-keygen -A
RUN mkdir -p /home/user/.ssh
RUN touch /home/user/.ssh/authorized_keys
RUN chown -R user:user /home/user/.ssh
RUN chmod 700 /home/user/.ssh
RUN chmod 600 /home/user/.ssh/authorized_keys

# Añadir recursos
RUN mkdir /home/user/Pictures
COPY resources/ /home/user/Pictures/
RUN mv /home/user/Pictures/secret.zip /etc/secret.zip
RUN chmod 766 /etc/secret.zip

# Debilitar los permisos de '/etc/shadow'
RUN chmod 644 /etc/shadow

# Servicio necesario
CMD ["/usr/sbin/sshd", "-D"]
