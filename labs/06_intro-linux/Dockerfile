# Imagen padre
FROM alpine:3.12

# Paquetes necesarios
RUN apk update && apk upgrade
RUN apk add openssh git gcc
RUN apk add vim nano
RUN apk add curl wget net-tools iproute2
RUN apk add mandoc man-pages mandoc-apropos less less-doc
RUN apk add file tree

# Conexión SSH
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
RUN ssh-keygen -A

# Creación de usuarios
RUN adduser -D user
RUN echo 'user:user' | chpasswd
RUN echo 'root:root' | chpasswd

# Configuración de claves SSH
RUN mkdir /home/user/.ssh
RUN touch /home/user/.ssh/authorized_keys
RUN chown -R user:user /home/user/.ssh
RUN chmod 700 /home/user/.ssh
RUN chmod 600 /home/user/.ssh/authorized_keys

# Servicio necesario
CMD ["/usr/sbin/sshd", "-D"]
