# Imagen padre
FROM debian:11

# Paquetes básicos
RUN apt update && apt upgrade -y
RUN apt install sudo bash vim nano ssh -y

# Paquetes específicos de ciberseguridad
RUN apt install hashid hashcat -y

# Modificación del algoritmo de hashes
COPY resources/common-password /etc/pam.d/common-password
RUN chmod 744 /etc/pam.d/common-password

# Creación de usuarios
RUN mkdir -p /run/sshd
RUN adduser user --disabled-password
RUN echo 'user:user' | chpasswd
RUN echo 'root:password123' | chpasswd

# Configuración de SSH
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
RUN ssh-keygen -A
RUN mkdir -p /home/user/.ssh
RUN touch /home/user/.ssh/authorized_keys
RUN chown -R user:user /home/user/.ssh
RUN chmod 700 /home/user/.ssh
RUN chmod 600 /home/user/.ssh/authorized_keys

# Inclusión de 'rockyou'
COPY resources/rockyou-top15k.txt /home/user/rockyou-top15k.txt

# Debilitar los permisos de '/etc/shadow'
RUN chmod 644 /etc/shadow

# Servicio necesario
CMD ["/usr/sbin/sshd", "-D"]
