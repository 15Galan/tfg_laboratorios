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

# Descargar el ransomware
WORKDIR /home/root
RUN git clone https://github.com/15Galan/42malaga_bootcamp-ciberseguridad.git

# Preparar el entorno
RUN mkdir stockholm
RUN cp -r 42malaga_bootcamp-ciberseguridad/stockholm .
RUN pip install argparse cryptography pathlib
RUN rm -rf 42malaga_bootcamp-ciberseguridad
RUN mkdir /home/root/infection
WORKDIR /home/root/infection

# Crear archivos de prueba
RUN touch texto.txt
RUN wget https://dl-cdn.alpinelinux.org/alpine/v3.17/releases/aarch64/alpine-standard-3.17.3-aarch64.iso -O alpine-standard.iso

# Volver al entorno
WORKDIR /home/root

# Comando del contendor
CMD ["/usr/sbin/sshd", "-D"]
