#!/bin/bash


VF_DIR="$HOME/Vagrant/Kali"     # Ubicación por defecto


# Actualiza la ubicación por defecto para el Vagrantfile.
# Argumentos:
#   $1: Nueva ruta del Vagrantfile
function define_directory {
    # Se recibe un argumento y es válido
    if [[ $# -eq 1 && -n "$1" ]]; then
        VF_DIR="$1"
    fi

    echo "Ubicación del Vagrantfile: $VF_DIR"
}

# Instala las dependencias necesarias para la máquina
# virtual, que en este caso son: Vagrant y VirtualBox.
function install_dependencies {
    echo "Instalando dependencias..."

    sudo apt-get update -qq                                         # Actualizar repositorios
    sudo apt-get install -y vagrant virtualbox > /dev/null 2>&1     # Instalar paquetes

    # Comprobar si se han instalado correctamente
    if [[ $? -eq 0 ]]; then
        echo "Paquetes instalados correctamente."
    else
        echo "Error al instalar los paquetes."
        exit 1
    fi
}

# Crea el directorio para el Vagrantfile.
function build_directory {
    # Directorio para los archivos de Vagrant
    if [[ -d $VF_DIR && -f $VF_DIR/Vagrantfile ]]; then
        echo "El directorio seleccionado no está vacío."
        read -p "¿Sobreescribirlo? [s/n]: " answer

        # Comprobar si debe reemplazarse
        if [[ "$answer" != "${answer#[Ss]}" ]]; then
            echo "Reiniciciando el directorio '$VF_DIR'..."
            rm -rf $VF_DIR
        else
            echo "No se puede continuar."
            exit 1
        fi
    else
        echo "Creando el directorio '$VF_DIR'..."
    fi

    mkdir -p $VF_DIR

    # Directorio para la carpeta compartida
    # if [ -d $VF_DIR/shared ]; then
    #     echo "El directorio '$VF_DIR/shared' ya existe."
    # else
    #     echo "Creando el directorio '$VF_DIR/shared'..."
    #     mkdir -p $VF_DIR/shared
    # fi

    # Comprobar si se han creado correctamente
    if [[ $? -eq 0 ]]; then
        echo "Directorio creado correctamente."
    else
        echo "Error al crear el directorio."
        exit 1
    fi
}

# Crea la máquina virtual de Kali Linux usando Vagrant.
function build_kali {
    cd $VF_DIR

    echo "Creando la máquina virtual de Kali Linux..."
    vagrant init elrey741/kali-linux_amd64  > /dev/null     # Inicializar Vagrant
    vagrant up                                              # Inicializar la MV
}


# Inicio del script
install_dependencies    # Instalar las dependencias
define_directory $1     # Actualizar la ubicación de la MV
build_directory         # Crear el directorio
build_kali              # Crear la MV de Kali Linux

echo "Fin de la instalación."
