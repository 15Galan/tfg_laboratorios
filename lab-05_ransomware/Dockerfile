# Imagen base
FROM alpine:3

# Paquetes necesarios
RUN apk upgrade
RUN apk add git wget openssh python3 bash

# Descargar el ransomware
WORKDIR /home/root
RUN git clone https://github.com/15Galan/42malaga_bootcamp-ciberseguridad.git

# Preparar el entorno
RUN mkdir stockholm
RUN cp -r 42malaga_bootcamp-ciberseguridad/stockholm stockholm
RUN rm -rf 42malaga_bootcamp-ciberseguridad
RUN mkdir /home/root/infection
WORKDIR /home/root/infection

# Crear archivos de prueba
RUN touch texto.txt
RUN wget https://dl-cdn.alpinelinux.org/alpine/v3.17/releases/aarch64/alpine-standard-3.17.3-aarch64.iso -O alpine-standard.iso

CMD ["tail", "-f", "/dev/null"]
