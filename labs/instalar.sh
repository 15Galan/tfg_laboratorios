#!/bin/sh


# Variables
carpetas=$(ls -d */ | grep -v '^logs/$' | sed 's#/##')  # Carpetas del repositorio
log=logs/$(date +"%Y-%m-%d %H-%M").log                  # Archivos de registro
duplicada=false                                         # Centinela para imágenes duplicadas


# Crear la carpeta de registros
mkdir -p logs                                           # Si ya existe 'logs' no hace nada


# Construcción de las imágenes
for carpeta in $carpetas; do

    echo "$carpeta\n------------------------------------------------" >> $log

    echo "Imagen: $carpeta"


    # Comprobar que la carpeta tiene un Dockerfile
    if [ ! -f $carpeta/Dockerfile ]; then
        echo "    No tiene Dockerfile.\n"
        continue
    fi


    # Eliminar la versión anterior de la imagen
    if [ ! -z "$(docker images -q $carpeta)" ]; then
        duplicada=true
        docker rmi $carpeta >> $log 2>&1
    fi


    # Construir la imagen actual
    if [ ! $duplicada = true ]; then
        echo "    Construyendo..."
    else
        echo "    Actualizando..."
    fi

    docker build -t $carpeta $carpeta/ >> $log 2>&1


    # Almacenar la imagen en una lista si se creó correctamente
    if [ ! -z "$(docker images -q $carpeta)" ]; then
        if [ ! $duplicada = true ]; then
            echo "    Creada.\n"
        else
            echo "    Actualizada.\n"
        fi

        images="$images $carpeta"
    fi

    echo "\n" >> $log

    duplicada=false
done


# Mostrar todas las nuevas imágenes generadas
echo "Resumen:"

for image in $images; do
    echo "* $image"
done

