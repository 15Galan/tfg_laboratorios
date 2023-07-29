# Introducción

## Qué es un hash

Un hash es una función matemática que convierte una cadena de caracteres en otra cadena de caracteres de longitud fija. Esta función es unidireccional, es decir, **no se puede obtener la cadena original a partir de la cadena resultante**; precisamente esta característica es la clave del uso de los hashes en ciberseguridad.

Generalmente, los hashes se utilizan para verificar la inegridad de un fichero y para almacenar contraseñas:

- **Verificación de integridad**: se calcula el hash de un fichero y se compara con el hash original. Si son iguales, el fichero no ha sido modificado; si son diferentes, el fichero ha sido modificado, porque debería tener el mismo hash que el original.
- **Almacenamiento de contraseñas**: en lugar de almacenar las contraseñas en texto plano, se almacena el hash de la contraseña. Cuando un usuario se autentica, se calcula el hash de la contraseña introducida y se compara con el hash almacenado. Si son iguales, entonces es en efecto, la misma contraseña.

Los hashes se basan en funciones criptográficas, que son funciones matemáticas que cumplen con las siguientes características:

- **Unidireccionalidad**: no se puede obtener la cadena original a partir de la cadena resultante.
- **Determinismo**: si se aplica la función a una cadena, siempre se obtendrá el mismo resultado.
- **Resistencia a la preimagen**: es muy difícil encontrar una cadena que al aplicarle la función criptográfica, se obtenga un resultado concreto.
- **Resistencia a la colisión**: es muy difícil encontrar dos cadenas que al aplicarles la función criptográfica, se obtenga el mismo resultado.

### Algoritmos más comunes

Un hash viene determinado por el algoritmo que se utiliza para calcularlo.

- **MD5**: algoritmo de 128 bits que genera un hash de 32 caracteres hexadecimales.  
Este algoritmo **ya no es seguro** y no debería utilizarse.
- **SHA-1**: algoritmo de 160 bits que genera un hash de 40 caracteres hexadecimales.  
Este algoritmo **y ano es seguro** y no debería utilizarse.
- **SHA-256**: algoritmo de 256 bits que genera un hash de 64 caracteres hexadecimales.

Ejemplo de la cadena `srgalan` representada en los algoritmos anteriores:

```text
MD5    : 1d616f28163414582ba7e2eb400485b9
SHA1   : 5b809ca358389dec586f8d88c544c0fc028dc7f4
SHA256 : e772e0266541435a1b52df6bb498cb62e6749c95e59b580d71c9fb16b4125af9
```

## Qué es un *salt*

Un *salt* es un valor aleatorio que se añade previamente a un elemento antes de calcular su hash; este se almacena junto al hash, y se utiliza para evitar ataques de diccionario y de fuerza bruta, ya que el resultado será diferente al que se obtendría si se calculase el hash solo del valor original.

Por ejemplo, si se calcula el hash de la cadena `srgalan` con el algoritmo MD5, se obtiene el siguiente resultado:

```text
MD5 : 1d616f28163414582ba7e2eb400485b9
```

Si se añade un *salt* aleatorio, por ejemplo `1234`, y se calcula el hash de la cadena `srgalan1234`, se obtiene el siguiente resultado:

```text
MD5 : cfd600b24575feae906e65f81a4fb957
```

## Herramientas comunes

### Generación de hashes

Calcula el hash MD5, SHA1 y SHA256 de un fichero, respectivamente.

```shell
md5sum <fichero>
sha1sum <fichero>
sha256sum <fichero>
```

#### CUPP

Herramienta que permite generar diccionarios de contraseñas personalizados a partir de información sobre la víctima, como su nombre, apellidos, fecha de nacimiento, etc.

Generalmente, esta herramienta se isntala desde [su repositorio de GitHub](https://github.com/Mebus/cupp), pero desde algunas versiones, Kali Linux ya incluye esta herramienta.

```shell
cupp.py -i
```

Esta herramienta generará una serie de preguntas al atacante sobre la víctima, información que debería haberse obtenido previamente mediante OSINT, y a partir de esa información generará una lista de posibles contraseñas.

### Cracking de hasshes

#### hashcat

Herramienta especializada en el cracking de contraseñas utilizando ataques de fuerza bruta, ataques de diccionario y ataques de tablas arcoíris (rainbow tables). Está diseñada para aprovechar la potencia de las GPU modernas (tarjetas gráficas) para realizar operaciones de cracking muy rápidas y eficientes.

Además, Hashcat también puede utilizar la CPU para ataques, pero la potencia y velocidad que proporciona una GPU son mucho mayores.

```shell
hashcat -m <algoritmo> <hash> <diccionario>
```

- Soporta una gran cantidad de algoritmos de hash: MD5, SHA1, SHA256, SHA512, etc.
- Admite múltiples ataques: fuerza bruta, diccionario, híbridos y de combinación de palabras.
- Permite la combinación de reglas personalizadas para aumentar la eficaia de los ataques de diccionario.
- Resulta muy eficiente al utilizar la potencia de las GPUs, lo que lo hace especialmente adecuado para operaciones de *cracking* de alto rendimiento.

#### John the Ripper

Herramienta de cracking de contraseñas que existe desde hace mucho tiempo y ha sido ampliamente utilizada en la comunidad de seguridad informática; a diferencia de Hashcat, John the Ripper se centra en el cracking utilizando la CPU, aunque también tiene soporte para el uso de GPU en algunos casos.

```shell
john --format=<algoritmo> <hash> <diccionario>
```

- Al igual que Hashcat, admite una amplia variedad de algoritmos de hash.
- Utiliza métodos como fuerza bruta, ataques de diccionario y ataques de fuerza bruta acelerados por tablas (incremental).
- Puede usar reglas personalizadas para mejorar la eficacia de los ataques de diccionario.
- Además de las contraseñas almacenadas en formato hash, también puede trabajar con formatos de archivo adicionales, como SAM (Windows) y htpasswd (Apache).
