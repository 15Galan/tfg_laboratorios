# Bypass

El término "bypass" se refiere a aquellas **técnicas utilizadas para evitar o superar los controles de seguridad** establecidos en un sistema o dispositivo; en otras palabras, un "bypass" es una forma de evitar o pasar por alto las medidas de seguridad diseñadas para proteger un sistema o dispositivo.

Existen diferentes tipos, que varían según el tipo de seguridad que se esté intentando superar. Algunos ejemplos de técnicas de bypass incluyen:

- **Bypass de autenticación**. Un ejemplo común de bypass de autenticación es el uso de contraseñas débiles o robadas para acceder a una cuenta protegida por contraseña.
- **Bypass de firewalls**. Los firewalls son dispositivos que se utilizan para bloquear el tráfico no autorizado hacia una red, por lo que el bypass de firewall puede permitir a un atacante acceder a una red protegida.
- **Bypass de IDS (sistemas de detección de intrusiones)**. Los IDS se utilizan para detectar y alertar sobre intentos de acceso no autorizado a un sistema, por lo que el bypass de IDS puede permitir a un atacante acceder a un sistema sin ser detectado.

Se debe tener en cuenta que el bypass es una técnica utilizada tanto por atacantes malintencionados como por profesionales de la seguridad para evaluar la efectividad de los sistemas de seguridad; por tanto, es importante entender cómo funcionan estas técnicas y cómo prevenirlas para proteger eficazmente los sistemas y dispositivos de posibles ataques.


# Vulnerabilidad *git-shell Bypass* (CVE-2017-8386)

Para ejemplificar un bypass de autenticación, vamos a utilizar la vulnerabilidad `CVE-2017-8386` conocida como *git-shell bypass*, donde un usuario puede ejecutar comandos de forma remota en un servidor de Git y obtener información del mismo (o peor).


## Principio

El **git-shell** es una parte importante del servicio Git y soporta 3 protocolos para la entrega de elementos:

- HTTPS
- SSH
- GIT

> **Importante**  
> El protocolo SSH se considera la forma más segura y conveniente.

Al clonar un repositorio de GitHub usando la opción *clonar usando SSH* se obtendrá una dirección de la forma:

$$
\texttt{git@github.com:usuario/repositorio.git}
$$

Esta URL le está diciendo a Git varias cosas:

- El nombre de usuario SSH es *git*.
- La dirección del servidor es *github.com*.
- El puerto al que conectarse es el 22 (por defecto para SSH, ya que no se indica).
- El repositorio está localizado en la carpeta `usuario/repositorio.git`.

Sabiendo eso, **Git se conecta a *github.com* a través del protocolo SSH y extrae el contenido del directorio correspondiente**.

> **Conclusión**  
> Una operación basada en SSH como `git clone` es, esencialmente, un **proceso de conexión al servidor GitHub a través del protocolo SSH, seguido de una descarga del directorio especificado**.

> Según lo anterior, **¿es posible iniciar sesión en el servidor GitHub?**  
> Obviamente no, pero puedes intentarlo y ver el mensaje que aparece. Lo que sucede realmente es que un usuario puede conectarse y autenticarse mediante SSH, pero se cerrará la conexión inmediatamente.
>
> Por tanto, el proceso `git pull` basado en SSH es seguro para los servidores Git.


### ¿Cómo deshabilitar que los usuarios de Git ejecuten el Shell del sistema?

El proceso de permitir a los usuarios autenticarse vía SSH, pero sin darles una Shell, se puede conseguir de 2 formas:

1. **Asignar una git-shell al crear un usuario**  
Establecer el Shell a git-shell al crear el usuario del sistema Git en lugar de darle al usuario un shell bash o sh normal. Un git-shell es un entorno sandbox donde *sólo se permite ejecutar comandos contenidos dentro del sandbox*.

2. **Sobreescribir/secuestrar comandos**  
Establecer el comando delante de cada *ssh-key* en el archivo *authorized_keys*, sobreescribiendo o secuestrando el comando original. Este método no sólo se utiliza en los servidores Git, sino también en muchas distribuciones de Linux.

Así es cómo un proveedor de Git (como GitHub) implementa el proceso de comunicación anterior de forma segura.


### Vulnerabilidad

**git-shell es un shell que puede restringir a los usuarios la ejecución de comandos.**

Si creamos un nuevo directorio en el directorio `home` del usuario de Git llamado `git-shell-commands`, y luego ponemos los comandos que permitimos ejecutar a los usuarios en ese directorio, esto crea un buen sandbox; en git-shell, sólo los comandos en el directorio `/home/git/git-shell-commands` pueden ser ejecutados.

Si el sistema no tiene un directorio `git-shell-commands`, entonces por defecto git-shell sólo permitirá ejecutar los siguientes 3 comandos -lista blanca-:

- `git-receive-pack <argumento>`
- `git-upload-pack <argumento>`.
- `git-upload-archive <argumento>`.

Sin embargo, el autor de `CVE-2017-8386` descubrió que al ejecutar `git-upload-archive --help` (o `git-receive-pack --help`) el comando te llevaba a una página de manual interactiva, que a su vez invocaba al comando `less` y terminaba con un documento de ayuda que se podía paginar arriba y abajo. Esto estaría bien, pero una de las características del comando `less` es que soporta varios métodos interactivos.

> **Ejemplo**  
> Pulsando <kbd>Shift + e</kbd> en la página de `less`, se abre la función *Examinar* que permite leer cualquier archivo, y tecleando `!id` se puede ejecutar el comando `id`.
>
> Esto puede probarse en cualquier ordenador Linux ejecutando `less /etc/passwd` para llegar a la página `less`, y escribiendo `!id` en el método de entrada en inglés para ejecutar el comando `id`.

Así, usando esta característica, podemos saltarnos el sandbox de git-shell para leer cualquier archivo, ¡o ejecutar cualquier comando!


#### Explotación vía SSH

Como intentamos antes, conectarse directamente usando `ssh git@gitserver` sólo obtiene el git-shell (o devuelve un texto recordatorio), así que usamos el exploit sandbox bypass mencionado en la sección anterior para ejecutar el comando:

```shell
ssh -i id_rsa -t git@gitserver -p 3322 "git-upload-archive '--help'"
```

Ve a la página de ayuda, luego simplemente pulsa <kbd>Shift + e</kbd> o `!id`.


# Laboratorio

> **Credenciales**  
> - Clave SSH privada descrita más abajo.

Este laboratorio simula un servidor de Git con la vulnerabilidad **CVE-2017-8386**.

Para usarlo, necesitarás la siguiente clave privada de ejemplo para la conexión SSH:

```text
-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAsf0lBQtId6OH7p9otwIPzpiR3mUqfOc2MLilmj83CsvH1L/0
eXK7DwU8OoW1abqE7iEFYY3cxg897HldBXAN3nqkCk4sq/HgPho4a2hnR3WuMgbV
LI2AxT89DoT/tYdumq9yJs49BYjMtKo7pBhdID+Y+xHXabmemARZZ7raUfn6sebT
3Sn5WURQ+fdCCRhRzt96M45J8UuqSGgboosUOB/qF/8SzGRjL8qgHk1gy2rPSReK
S5VGdX0FMn8gDZrOjshQp8yAG4kA3pBQ0RDPLRDPHyxWF6zt07ftNXV8S4YQErnz
dH4yPnsAngv0ibgasQQxtTOxYAefwSBzd8+mmwIDAQABAoIBAHUAbHpxXVTQGgZB
oetTnqJ3ZsQkCpcKwnOqnanUzlD5fkYbXREM22xXS61IweVbqBCFgm0LfUpxMIqn
iP+PFn7ebcEcfH8XRApu4BGzEtlFwZm/Jhjgd/qxxGgsA5AIFCv5EvfxcOmXcMF+
ejA3l9ggFmdM5ibozxktGrx2dxeVO8VQPpFRoZIXqk6G0RNrAjCYG0NSqLfSkf2n
J8m3JYhvUxfDy1TI2btTXVPz1B28M+3YQD4JraVioYkOGIfflWjlfjctW6HAGdhU
Kf0DMHvcRd+tLsUOOapoY22saw2XZb+aebc07jUilW3posgRJC7M/IDHkjXNKyDP
laOhgskCgYEA5kQDo+1WIbNU7FQ0AF6dOrj65GruRujXQzTbB6Pi64wWM9bAxcc3
C+rR033vX7/nrBRFTWTeve1DO/1t1Ozen86OciOma7QgRERfA7v8Ck31BevJJr/t
y5a0QfpQkrBP1iUrI2Ew3XJtcLSQr9JPo0O95UFZtcVlLkXX/SLjO2cCgYEAxeF4
jzZU51r1tRrj+6uV6PtLHsfe7z+OTmQIXDrk8O4KM7bIWgfI4iJErzpfav4j4/ZT
NwK8w0JrgXAo8LjT00jDQqVVQz2PI2O7PNpXKk/oGHKNvzdX41Xb1rFOwPwWHLKj
gIEHVaDsz5Gi3R7H20+szq9tskqvResyLQtMLq0CgYBdgHjJ8/HptVxiqr6C9+h4
k+ytHA6tlJb0n13heFcIttW9LxMQPJjJqgySCK1PACoe4gxSJQedr96BWaNjttuf
oMyO5JMLYRVJI0pBxe/Ob2Fzig8gQQdaiFOiBvb42cdReb5Om4SwJ2rxPSEThB76
eON/WE4JVaKEa7ANBkGnOQKBgGovc+Jl5WnBBdkJdQ24Jdm//6+k0ZzRHiwywcm8
UN543kCh9SFazBGNEg515H4lolzR8hWzAlhFbCspZM7IX+MhSKaa0gYjIox7GB6v
i9bIymNUFXxm1mLH0BCFVR16KON9eP+cPbNVh75bCGpf+h9VwgWnXdYu/Z8nduV1
CoyBAoGAZfnpQCwL77cITg+J1N09nE3KQV+H8qfy4yTHxb/TOCCeCf676w3aQT80
IrlLa+fQL54shqlqAonSV85PCN2XdnpaOcHR8TcK0Uln8jqhlUaA13fW93Yzy5Cw
Om6aW16UqUrFL5TVgFHQvc4WSphPZyboClavgNshfTfS4i00iqE=
-----END RSA PRIVATE KEY-----
```

Guárdala en un fichero y asegúrate de que tiene los permisos adecuados o la conexión fallará debido a que *la clave privada es demasiado abierta*:

```shell
chmod 600 <clave privada>
```

Una vez hayas completado esos preparativos, podrás llevar a cabo la explotación mencionada anteriormente y explorar las posibilidades que te da ese bypass.

## Curiosidad

> **¿Por qué el usuario *www-data*?**  
> Tanto el usuario *git* como el usuario *www-data* se identifican con el número **33**.  
> Eso quiere decir que, en realidad, **los usuarios *git* y *www-data* son el mismo usuario**.
>
> Esto puede observarse en el fichero `/etc/passwd`:
>
> ```text
> root:x:0:0:root:/root:/bin/bash
> daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
> (…)
> www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
> (…)
> sshd:x:101:65534::/run/sshd:/usr/sbin/nologin
> git:x:33:33:git:/home/git:/bin/bash
> ```


# Referencias

- [Git](https://es.wikipedia.org/wiki/Git)
- [CVE-2017-8386](https://insinuator.net/2017/05/git-shell-bypass-by-abusing-less-cve-2017-8386) - Git Shell Bypass by abusing "less"
