#!/bin/sh

# Actualizar los repositorios
sudo apt-get update

# Instalar Vagrant y VirtualBox
sudo apt-get install vagrant virtualbox -y

# Crear la carpeta para la máquina virtual
mkdir -p ~/Vagrant/Kali

# Iniciar el archivo Vagrantfile con la imagen de Kali
cd ~/Vagrant/Kali
vagrant init elrey741/kali-linux_amd64

# Levantar la máquina virtual
vagrant up

