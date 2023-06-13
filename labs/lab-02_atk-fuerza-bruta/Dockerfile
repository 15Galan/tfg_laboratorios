# Imagen padre
FROM alpine:3

# Paquetes necesarios
RUN apk update && apk update
RUN apk add hydra openssh nmap

# Configuración del entorno
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
RUN ssh-keygen -A
RUN echo 'root:diamond' | chpasswd
RUN adduser -D user
RUN echo 'user:user' | chpasswd
RUN mkdir /home/user/.ssh
RUN touch /home/user/.ssh/authorized_keys
RUN chown -R user:user /home/user/.ssh
RUN chmod 700 /home/user/.ssh
RUN chmod 600 /home/user/.ssh/authorized_keys

# Archivos necesarios
RUN wget https://gist.githubusercontent.com/roycewilliams/4003707694aeb44c654bf27a19249932/raw/7afc95e02df629515960a3e45109e6f88db3a99e/rockyou-top15k.txt -O /home/user/rockyou.txt

#Servicio necesario
CMD ["/usr/sbin/sshd", "-D"]
