# Imagen padre
FROM debian:12

# Paquetes necesarios
RUN apt update && apt upgrade -y
RUN apt install openssh-server git gcc passwd -y
RUN apt install vim nano -y
RUN apt install curl wget net-tools iproute2 -y
RUN apt install man-db less file tree -y

# Conexión SSH
RUN mkdir /run/sshd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
RUN ssh-keygen -A

# Creación de grupos
RUN groupadd simpsons

# Creación de usuarios
RUN useradd -m -s /bin/bash user && echo 'user:user' | chpasswd
RUN echo 'root:root' | chpasswd

RUN useradd -m -s /bin/bash homer && echo 'homer:homer' | chpasswd
RUN useradd -m -s /bin/bash marge && echo 'marge:marge' | chpasswd
RUN useradd -m -s /bin/bash bart && echo 'bart:bart' | chpasswd
RUN useradd -m -s /bin/bash lisa && echo 'lisa:lisa' | chpasswd

# Asignación de grupos
RUN usermod -aG simpsons homer
RUN usermod -aG simpsons marge
RUN usermod -aG simpsons bart
RUN usermod -aG simpsons lisa

# Configuración de claves SSH
RUN mkdir /home/user/.ssh
RUN touch /home/user/.ssh/authorized_keys
RUN chown -R user:user /home/user/.ssh
RUN chmod 700 /home/user/.ssh
RUN chmod 600 /home/user/.ssh/authorized_keys

# Servicio necesario
CMD ["/usr/sbin/sshd", "-D"]
