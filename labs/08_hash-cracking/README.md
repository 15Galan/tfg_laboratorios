# Introducción

## Qué es un hash

Un hash es una función matemática que convierte una cadena de caracteres en otra cadena de caracteres de longitud fija. Esta función es unidireccional, es decir, **no se puede obtener la cadena original a partir de la cadena resultante**; precisamente esta característica es la clave del uso de los hashes en ciberseguridad.

Generalmente, los hashes se utilizan para verificar la integridad de un fichero y para almacenar contraseñas:

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
Este algoritmo **ya no es seguro** y no debería utilizarse.
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

### Cracking de hashes

#### hashid

Herramienta que permite identificar el algoritmo de un hash, de forma aproximada.

```shell
hashid <hash>
```

Como se mencionó anteriormente, un hash no se puede revertir, por lo que la única forma de saber el origen de un hash es precisamente, encontrando el origen y comprobando que coincide con el hash; pero antes de todo eso, resulta trivial conocer qué tipo de hash se está tratando. 

Por ejemplo, para el hash MD5 de `srgalan` se obtiene el siguiente resultado:

```text
Analyzing '1d616f28163414582ba7e2eb400485b9'
[+] MD2 
[+] MD5 
[+] MD4 
[+] Double MD5 
[+] LM 
[+] RIPEMD-128 
[+] Haval-128 
[+] Tiger-128 
[+] Skein-256(128) 
[+] Skein-512(128) 
[+] Lotus Notes/Domino 5 
[+] Skype 
[+] Snefru-128 
[+] NTLM 
[+] Domain Cached Credentials 
[+] Domain Cached Credentials 2 
[+] DNSSEC(NSEC3) 
[+] RAdmin v2.x 
```

Observa que se muestran muchas posibilidades, lo que coincide con la naturaleza básica de los hashes definidas al inicio, lo que hace prácticamente imposible identificar el algoritmo exacto; sin embargo, puede aproximarse en función de las características del resultado.

Un ejemplo en este caso es la longitud del hash, observa que no aparecen las opciones para SHA1 ni SHA256, ya que sus longitudes son de 40 y 64 caracteres, respectivamente, mientras que el hash introducido mide 32 caracteres.

> **Nota**  
> Este programa adquiere aún más importancia cuando eres consciente, no solo de la inmensa cantidad de algoritmos hash posible, sino de la cantidad de combinaciones que puedes encontrarte.
>
> **Nada ni nadie te impide aplicar un algoritmo hash, al resultado de otro algoritmo hash, ni hacer tantas combinaciones como quieras**.

#### hashcat

Herramienta especializada en el cracking de contraseñas utilizando ataques de fuerza bruta, ataques de diccionario y ataques de tablas arcoíris (rainbow tables). Está diseñada para aprovechar la potencia de las GPU modernas (tarjetas gráficas) para realizar operaciones de cracking muy rápidas y eficientes.

Además, Hashcat también puede utilizar la CPU para ataques, pero la potencia y velocidad que proporciona una GPU son mucho mayores.

```shell
hashcat -m <algoritmo> <hash> <diccionario>
```

- Soporta una gran cantidad de algoritmos de hash: MD5, SHA1, SHA256, SHA512, etc.
- Admite múltiples ataques: fuerza bruta, diccionario, híbridos y de combinación de palabras.
- Permite la combinación de reglas personalizadas para aumentar la eficacia de los ataques de diccionario.
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


# Laboratorio

> **Credenciales**  
> - `root:root`.

Este entorno contiene distintas bases de datos MariaDB locales con usuarios y contraseñas que han sido almacenadas usando distintos algoritmos de hashes, y también contiene todos los programas descritos en la sección.

Puedes tratar de obtener las contraseñas de los usuarios utilizando las herramientas mencionadas anteriormente.

## Comandos de ayuda para SQL

El manejo de bases de datos no es el objetivo de este laboratorio, por lo que no se pretende en ningún momento que el usuario tenga que conocer el lenguaje SQL para poder experimentar con el entorno; por tanto, se muestran algunos comandos útiles a continuación, con una breve descripción de su funcionamiento.

Iniciar una terminal en el servidor de bases de datos de MariaDB:

```shell
mariadb
```

- Lo necesitarás para poder ver las bases de datos disponibles y poder ejecutar los siguientes comandos SQL para navegar por las bases de datos.

Cerrar la sesión en el servidor de bases de datos:

```shell
exit
```

Mostrar las bases de datos disponibles en el servidor:

```sql
SHOW DATABASES;
```

> **Nota**  
> Las bases de datos por defecto son `information_schema`, `mysql`, `performance_schema`, que contienen información sobre el propio servidor.

Seleccionar una base de datos para trabajar:

```sql
USE {base de datos};
```

- Si no se está dentro de una base de datos, no se podrá ejecutar comandos SQL para consultar sus datos.

> **Nota**  
> El prompt del servidor cambiará para indicar la base de datos seleccionada; algo parecido a lo que ocurre con el prompt de una terminal, que aporta información sobre el directorio actual.

Mostrar las tablas que componen la base de datos seleccionada.

```sql
SHOW TABLES;
```

Mostrar el contenido de todos los campos de una tabla.

```sql
SELECT * FROM {tabla};
```

- El campo `*` significa *todos los campos*.
