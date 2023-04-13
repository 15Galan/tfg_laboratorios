#!/bin/sh


# Variables
carpetas=$(ls -d */ | grep -v '^logs/$' | sed 's#/##')  # Carpetas del repositorio
log=logs/$(date +"%Y-%m-%d %H-%M").log                  # Archivos de registro
mkdir -p logs                                           # Crear la carpeta de registros


# Construcción de las imágenes
for carpeta in $carpetas; do

    echo "$carpeta\n------------------------------------------------" >> $log

    echo "Imagen: $carpeta"


    # Eliminar la versión anterior de la imagen
    if [ ! -z "$(docker images -q $carpeta)" ]; then
        echo "    Duplicada."
        echo "    Eliminando..."
        docker rmi $carpeta >> $log 2>&1
    fi


    # Construir la imagen actual
    echo "    Construyendo..."
    docker build -t $carpeta $carpeta/ >> $log 2>&1


    # Almacenar la imagen en una lista si se creó correctamente
    if [ ! -z "$(docker images -q $carpeta)" ]; then
        echo "    Creada."
        images="$images $carpeta"
    fi

    echo "\n" >> $log
done


# Mostrar todas las imágenes que fueron creadas
echo "\nResumen:"

for image in $images; do
    echo "* $image"
done

