<!-- Criptografía -->

## Introducción

La **criptografía** es *el arte de codificar mensajes* de forma que solo las partes autorizadas puedan comprender su contenido, utilizando técnicas y algoritmos que garantizan la confidencialidad, integridad y autenticidad de los datos.

> Este es un **campo esencial** en la seguridad de la información y las comunicaciones.

La importancia de la criptografía radica en su capacidad para *proteger la información tanto en reposo como en tránsito*; lo que incluye la protección de datos almacenados en dispositivos y sistemas de información, así como la seguridad de las comunicaciones que se transmiten a través de redes.

> **Nota**  
> La criptografía **garantiza** que incluso si un atacante intercepta los datos, no podrá leer ni modificar el contenido sin la clave adecuada.


## Conceptos básicos

### Cifrado

> El cifrado es uno de los aspectos fundamentales de la criptografía.

Se trata del **proceso de transformar un mensaje legible en una forma ininteligible** utilizando un algoritmo y una clave; esta es un componente crucial, ya que determina cómo se realiza la transformación y, lo que es igualmente importante, cómo se revierte este proceso (descifrado).

> **Nota**  
> Algunos cifrados, como los cifrados basados en *sustitución simple*, no utilizan claves en el sentido tradicional de una clave secreta para el cifrado y el descifrado.
>
> Sin embargo, *estos tipos de cifrados tienden a ser menos seguros* y más fáciles de romper en comparación con los cifrados modernos que utilizan claves criptográficas robustas.


#### Tipos de cifrado

Los algoritmos de cifrado se pueden clasificar en 2 categorías principales: **cifrado simétrico** y **cifrado asimétrico**.

No obstante, también existen otras características que se pueden utilizar para clasificar los algoritmos de cifrado, como el tamaño de la clave, el tipo de operaciones que se realizan o el número de claves utilizadas.


##### Cifrado simétrico

> También se le conoce como *cifrado de clave privada*.

Se trata de un cifrado que **utiliza la misma clave tanto para cifrar como para descifrar el mensaje**. Este enfoque eficiente es útil para la transmisión segura de datos entre partes que ya comparten una clave secreta.

> **Nota**  
> Este tipo de cifrado es más rápido que el *cifrado asimétrico*, pero requiere que las partes compartan previamente una clave secreta.

Se muestran a continuación algunos ejemplos de cifrados simétricos:

| Algoritmo |                   Siglas                   | Longitud de clave (bits) | Descripción                                                                                   |
|:---------:|:------------------------------------------:|:------------------------:|:--------------------------------------------------------------------------------------------- |
|    AES    | _**A**dvanced **E**ncryption **S**tandard_ |      128, 192, 256       | Ampliamente utilizado en la actualidad.                                                       |
|    DES    |   _**D**ata **E**ncryption **S**tandard_   |            56            | Todavía se utiliza en algunas aplicaciones, pero es considerado antiguo.                      |
|   3DES    |                *Triple DES*                |           168            | Una versión más segura del algoritmo DES, aplicando DES tres veces para cada bloque de datos. |
|    RC4    |       _**R**ivest **C**ipher **4**_        |   40, 56, 64, 80, 128    | Todavía se utiliza en algunas aplicaciones, pero es considerado antiguo.                      |

> **Nota**  
> El cifrado AES tiene varios modos de operación, como *ECB*, *CBC*, *CFB*, *OFB* y *CTR*.
>
> Estos modos definen cómo se cifran los datos y cómo se manejan los errores de transmisión, por lo que es importante elegir el modo adecuado para cada caso de uso y además, tenerlos en cuenta a la hora de descifrar los datos.


##### Cifrado asimétrico

> También se le conoce como *cifrado de clave pública*.

Se trata de un cifrado que **emplea un par de claves relacionadas: una clave pública para cifrar y una clave privada para descifrar**. Este enfoque permite una comunicación segura incluso en escenarios donde las partes no comparten previamente una clave secreta.

- La clave pública se comparte ampliamente: cualquier persona puede cifrar un mensaje para el destinatario.
- La clave privada se mantiene en secreto: solo el destinatario puede descifrar el mensaje.

> **Nota**  
> Este tipo de cifrado es más lento que el *cifrado simétrico*, pero no requiere que las partes compartan previamente una clave secreta.

Se muestran a continuación algunos ejemplos de cifrados asimétricos:

| Algoritmo |                  Siglas                   | Longitud de clave (bits) | Descripción                                                              |
|:---------:|:-----------------------------------------:|:------------------------:|:------------------------------------------------------------------------ |
|    RSA    |    _**R**ivest-**S**hamir-**A**dleman_    |     1024, 2048, 4096     | Ampliamente utilizado en la actualidad.                                  |
|    DSA    | _**D**igital **S**ignature **A**lgorithm_ |     1024, 2048, 3072     | Todavía se utiliza en algunas aplicaciones, pero es considerado antiguo. |
|    ECC    | _**E**lliptic **C**urve **C**ryptography_ |    160, 224, 256, 384    | Ampliamente utilizado en la actualidad.                                  |
|  ElGamal  |                     -                     |     1024, 2048, 3072     | Todavía se utiliza en algunas aplicaciones, pero es considerado antiguo. |


##### Cifrado híbrido

Este enfoque combina las fortalezas del cifrado simétrico y el cifrado asimétrico.

Aquí el mensaje se cifra con una clave simétrica aleatoria y la clave simétrica se cifra con la clave pública del destinatario; de esta forma, el destinatario puede descifrar la clave simétrica con su clave privada y luego descifrar el mensaje con la clave simétrica.

> **Nota**  
> Este enfoque también se puede utilizar para cifrar mensajes entre varias partes. En este caso, la clave simétrica se cifra con la clave pública de cada destinatario.


### Firma digital

> Componente fundamental de la criptografía de clave pública.

Se trata de una técnica que utiliza claves asimétricas para garantizar la integridad de un mensaje y verificar la identidad del emisor. La firma digital se crea aplicando una función criptográfica al mensaje y la clave privada del remitente.

Los destinatarios pueden verificar la firma utilizando la clave pública del remitente, asegurando que el mensaje no haya sido alterado y provenga de la fuente esperada. Las firmas digitales son esenciales para asegurar la autenticidad de las comunicaciones en entornos digitales.

> **Nota**  
> Las firmas digitales no proporcionan confidencialidad, ya que el mensaje se puede leer sin descifrarlo.


## Herramientas

### OpenSSL

Librería de código abierto que implementa los protocolos **SSL** y **TLS**, así como una herramienta de línea de comandos para trabajar con estos protocolos.

OpenSSL es ampliamente utilizado en una variedad de aplicaciones y servicios que requieren comunicaciones seguras a través de redes, como sitios web, servidores de correo electrónico, etc.

No obstante, aunque está orientado a la seguridad de las comunicaciones, OpenSSL también se puede utilizar para cifrar y descifrar archivos de forma local.

**Generación de claves**

```bash
openssl genrsa -out clave_pri.pem 2048
openssl rsa -in clave_pri.pem -pubout -out clave_pub.pem
```

- `genrsa`: genera un par de claves RSA.
- `rsa`: convierte un par de claves RSA en diferentes formatos (PEM, DER, etc.).
- `-in`: especifica el archivo de entrada.
- `-pubout`: especifica que la clave pública se exportará en lugar de la clave privada.
- `-out`: especifica el archivo de salida.

**Cifrado y descifrado de archivos**

```bash
openssl rsautl -encrypt -inkey clave_pub.pem -pubin -in mensaje.txt -out cifrado.txt
openssl rsautl -decrypt -inkey clave_pri.pem -in cifrado.txt -out descifrado.txt
```

- `rsautl`: realiza operaciones RSA en archivos.
- `-encrypt`: especifica que se realizará un cifrado.
- `-inkey`: especifica el archivo de clave pública.
- `-pubin`: especifica que la clave pública se importará en lugar de la clave privada.
- `-in`: especifica el archivo de entrada.
- `-out`: especifica el archivo de salida.


### GPG

Implementación de código abierto del estándar **OpenPGP**, que define formatos de mensajes cifrados y firmados digitalmente.


**Generación de claves**

```bash
gpg --full-generate-key
```

- `--full-generate-key`: genera un par de claves RSA.

**Cifrado y descifrado de archivos**

```bash
gpg --encrypt --recipient "Nombre y Apellidos" mensaje.txt
gpg --decrypt mensaje.txt.gpg
```

- `--encrypt`: realizar un cifrado usando el algoritmo de cifrado predeterminado.
- `--recipient`: nombre del destinatario del mensaje.
- `--decrypt`: descifrar un mensaje cifrado.

**Firma digital**

```bash
gpg --sign mensaje.txt
gpg --verify mensaje.txt.gpg
```

- `--sign`: firmar un objeto.
- `--verify`: verificar la firma de un objeto.


# Referencias

- [Cryptography](https://es.wikipedia.org/wiki/Criptograf%C3%ADa)
- [Criptografía asimétrica](https://es.wikipedia.org/wiki/Criptograf%C3%ADa_asim%C3%A9trica)
- [OpenSSL](https://www.openssl.org/)
- [GPG](https://gnupg.org/)
