#!/bin/bash

# Un script que hace una copia de seguridad de un directorio en otro directorio.
# Opcionalmente, el script puede encriptar y/o comprimir la copia de seguridad.
# El script es automático y no requiere interacción del usuario.


set -euo pipefail   # Detener el script inmediatamente en caso de error


# Directorios
SRC_DIR="$HOME/Descargas"   # Carpeta origen
DST_DIR="./Backups"         # Carpeta destino (copia de seguridad)

# Funcionamiento
COMPRESS=true       # Opción de compresión
ENCRYPT=true        # Opción de encriptación
ALGO="xz"           # Algoritmo de compresión

# Registros
LOG_FILE="$DST_DIR/log.txt"     # Archivo de registro
LOG_LEVEL=1                     # 0: Solo errores; 1: Todo


# Registrar el resultado del script.
#
# Argumentos:
#   $1: Nombre del fichero
#   $2: Estado
log_status() {
    local name=$1
    local status=$2
    local statusStr=$(if [[ $status -eq 0 ]]; then echo "success"; else echo "fail"; fi)

    echo "$name, Resultado => $statusStr (COMPRESS: $COMPRESS; ENCRYPT: $ENCRYPT)" >> $LOG_FILE
}


# Fución principal
main() {
    echo "Haciendo backup de $SRC_DIR"
    echo

    local now=$(date '+%d-%m-%Y')
    local folder=$(basename $SRC_DIR)   # Conseguir el directorio/fichero más lejano a la raíz
    local name="$folder-$now"
    local status=true

    # Comprobar que sea legible y una carpeta
    if [[ -r $SRC_DIR ]] && [[ -d $SRC_DIR ]]; then
        mkdir -p $DST_DIR
        
        # Comprimir
        if $COMPRESS; then

            # Encriptar
            if $ENCRYPT; then
                tar -caf - $SRC_DIR | gpg --no-symkey-cache -c > $DST_DIR/$name.tar.$ALGO.gpg
            else
                tar -caf "$DST_DIR/$name.tar.$ALGO" -C $SRC_DIR .
            fi
        else
            mkdir -p "$DST_DIR/$name"           # Crear directorio y "parents"
            cp -R $SRC_DIR/* $DST_DIR/$name
        fi

        status=$?
    else
        status=false
    fi

    # Generar el reporte
    if [[ $LOG_LEVEL -eq 1 || $status -eq 1 ]]; then
        log_status $name $status
    fi
}

main
