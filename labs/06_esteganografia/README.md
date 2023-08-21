<!-- Esteganografía -->

# Introducción

La esteganografía es **el arte de ocultar información** dentro de otra información.

Esto puede parecer similar a la criptografía, pero no lo es: la **criptografía** se encarga de ocultar el **significado** de un mensaje, mientras que la **esteganografía** se encarga de ocultar la **existencia** de un mensaje.

Esto puede resultar útil en ciertas situaciones, como por ejemplo, cuando se quiere enviar un mensaje de forma secreta, pero no se quiere que nadie sepa que se está enviando un mensaje.

Las técnicas de esteganografía se pueden clasificar en 2 grandes grupos:

- **Digital**: se basa en el uso de herramientas informáticas para ocultar información dentro de ficheros digitales. Por ejemplo, ocultar un mensaje dentro de una imagen.
- **Analógica**: se basa en el uso de técnicas manuales para ocultar información dentro de objetos físicos. Por ejemplo, ocultar un mensaje dentro de un libro.

> **Nota**  
> Aquí se tratará la esteganografía digital, porque la información proporcionada se dirige al pentesting; sin embargo, también es importante conocer la esteganografía natural, ya que las auditorías de seguridad no solo tienen lugar en entornos digitales (redes, ordenadores, dispositivos...), sino que también pueden tener lugar en entornos físicos (oficinas, edificios, etc.).


## Multimedia en Internet

Cabe destacar que precisamente por la cantidad de información disponible en los metadatos de una imagen, vídeo o incluso audio, la mayoría de empresas y servicios que requieren publicar contenido en Internet (ya sea mediante redes sociales o sus páginas webs), suelen **eliminar los metadatos** de los ficheros multimedia que se suben a sus plataformas.

- **Privacidad**: los metadatos pueden contener información sensible sobre el autor de la imagen; por ejemplo, la ubicación donde se tomó una foto.
- **Seguridad**: los metadatos pueden contener información sensible sobre el dispositivo con el que se tomó la foto; por ejemplo, el dispositivo que realizó una foto.

> **Nota**  
> Por tanto, es recomendable -y una práctica habitual- eliminar los metadatos de los ficheros multimedia que se suben a Internet, ya que podrían ser una fuente de información para un atacante en su fase de reconocimiento.


# Herramientas

Existen diversas herramientas para leer y escribir sobre los metadatos de los ficheros, así como para ocultar información dentro de ficheros de imagen, audio y vídeo.

Los metadatos son información adicional que se almacena dentro de los ficheros, como por ejemplo, la fecha de creación, el autor, etc; estos metadatos no forman parte del contenido que ofrece el fichero (texto, imagen...), pero forman parte de la estructura del fichero en sí mismo.

> **Nota**  
> También suele ser habitual que la información oculta esté cifada, añadiendo una capa más de protección en caso de que alguien encuentre dicha información.
>
> Una práctica sencilla y común, es codificar información como texto usando `base64`, por lo que es recomendable saber cómo usar ese comando.

## `base64`

Este comando permite codificar y decodificar objetos (texto, ficheros...) en formato `base64`; este formato es un estándar para codificar información binaria en texto ASCII de forma que se pueda transmitir por canales que solo admitan texto.

Para codificar / decodificar un texto en formato `base64`:

```bash
echo {texto} | base64
echo {texto} | base64 -d
```

- `-d`: se usará el comando para decodificar el texto.

Para codificar / decodificar un fichero en formato `base64`:

```bash
base64 {fichero}
base64 -d {fichero}
```

- `-d`: se usará el comando para decodificar el fichero.


## `exiftool`

Esta herramienta permite a los usuarios leer y escribir sobre los metadatos EXIF, IPTC y XMP de los ficheros.

Los metadata EXIF son metadatos que se utilizan para almacenar información sobre imágenes, como la fecha de creación, el autor, el dispositivo con el que se tomó la foto, etc; IPTC es un estándar para el intercambio de información sobre imágenes, y XMP es un formato de metadatos basado en XML.

Esto quiere decir que si se oculta información dentro de los metadatos de una imagen, esta información se puede leer si el dispositivo que se utiliza para leer la imagen es compatible con los metadatos EXIF, IPTC y XMP.

> **Nota**  
> Esta herramienta es commúnmente utilizada debido a su facilidad de uso y a que es compatible con una gran cantidad de formatos de ficheros.

Para leer los metadatos de un fichero:

```bash
exiftool {fichero}
```

Para escribir los metadatos de un fichero:

```bash
exiftool -{metadato}="{valor}" {fichero}
```

Ejemplo:

```bash
exiftool -Author="John Doe" imagen.jpg
```

- Escribir el metadato `Author` con el valor `John Doe` en el fichero `imagen.jpg`.


## `steghide`

Esta herramienta permite a los usuarios ocultar información dentro de ficheros de imagen, audio y vídeo.

Se puede ocultar información dentro de una imagen con el siguiente comando:

```bash
steghide embed -cf {imagen} -ef {archivo} -p {contraseña}
```

- `imagen` es la imagen en la que se va a ocultar la información.
- `archivo` es el archivo que se va a ocultar dentro de la imagen.
- `contraseña` es la contraseña que se va a utilizar para cifrar el archivo.

Por ejemplo, para ocultar el archivo `mensaje.txt` dentro de la imagen `imagen.jpg` con la contraseña `1234`, ejecutamos el siguiente comando:

```bash
steghide embed -cf imagen.jpg -ef mensaje.txt -p 1234
```

### Extraer información

Para extraer la información oculta dentro de una imagen, ejecutamos el siguiente comando:

```bash
steghide extract -sf {imagen} -p {contraseña}
```

- `<imagen>` es la imagen de la que se va a extraer la información.
- `<contraseña>` es la contraseña que se va a utilizar para descifrar el archivo.

Por ejemplo, para extraer la información oculta dentro de la imagen `imagen.jpg` con la contraseña `1234`, ejecutamos el siguiente comando:

```bash
steghide extract -sf imagen.jpg -p 1234
```


# Laboratorio

Este entorno contiene una serie de imágenes con información oculta, donde puedes usar las herramientas anteriormente mencionadas tanto para experimentar por tu cuenta como para utilizar los recursos propuestos.

- Credenciales: `user:user`

El entorno simula que toda la información de los recursos está relacionada, por lo que es posible que para obtener la información oculta de un recurso, primero tengas que obtener la información oculta de otro recurso.

> **Nota**  
> La información conduce a la contraseña del usuario `root`.
