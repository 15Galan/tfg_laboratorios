# Ataque de Fuerza Bruta

Un ataque de fuerza bruta es un método de prueba y error que se utiliza para descifrar contraseñas, nombres de usuario o claves de cifrado, utilizando varias combinaciones de contraseñas hasta que se encuentra la correcta. El uso de este tipo de ataque puede llevar desde unos pocos segundos hasta años, según la longitud y la complejidad de la contraseña.

Durante su ejecución, el atacante usa técnicas para probar combinaciones de contraseñas para descubrir las credenciales de una víctima potencial para obtener acceso a una cuenta o sistema. Hay muchos tipos diferentes de ataques de fuerza bruta, cada uno con sus propias características y métodos, pero por mencionar los más comunes:

- **Ataque de diccionario**: el atacante usa una lista de palabras comunes y las combina con diferentes combinaciones de caracteres hasta encontrar la contraseña correcta.
- **Ataques de rociado de contraseñas**: se enfocan en probar algunas contraseñas comunes en varias cuentas diferentes, en lugar de probar muchas contraseñas diferentes en una sola cuenta.
- **Ataque de fuerza bruta inversa**: invierte el orden de las operaciones, comenzando con una contraseña común o conocida, y luego usando la fuerza bruta para encontrar el nombre de usuario.

> **Importante**  
> Aunque este es un **antiguo método de ataque**, **sigue siendo efectivo y es muy popular entre los piratas informáticos**; es importante enfatizar que los ataques de fuerza bruta en ausencia de predicción débil o relativamente fácil, son más exitosos. 


## Herramientas comunes

Existen muchas herramientas para realizar ataques de fuerza bruta, algunas de las más populares son:

- **John the Ripper**: herramienta de código abierto escrita en C que se utiliza para descifrar contraseñas mediante combinaciones de fuerza bruta como ataques de diccionario.
- **Hydra**: herramienta de código abierto que se utiliza para realizar ataques de fuerza bruta en varios protocolos, aplicaciones y servicios; puede realizar ataques de fuerza bruta en más de 50 protocolos, incluidos HTTP, HTTPS, FTP, SMTP, MySQL, MS-SQL, SSH, Telnet, etc.
- **Aircrack-ng**: herramienta de código abierto que se utiliza para descifrar contraseñas de redes inalámbricas; puede descifrar contraseñas WEP y WPA/WPA2 mediante combinaciones de fuerza bruta y ataques de diccionario.


### Archivo *rockyou.txt*

El archivo `rockyou.txt` es un archivo de texto que contiene una lista de contraseñas comunes y es utilizado por muchas herramientas de fuerza bruta para realizar ataques de diccionario. Consiste en una enorme recopilación de contraseñas filtradas con aproximadamente **8.400 millones entradas únicas**, todas ellas en **texto plano** y con una longitud de entre **6 - 20 caracteres**, ocupando un total de unos **100 GB** de espacio en disco.

> **Importante**  
> El archivo `rockyou.txt` es uno de los archivos de diccionario más grandes disponibles; sin embargo, no es el único, ya que existen muchos otros archivos que contienen contraseñas comunes y se pueden usar para realizar ataques de fuerza bruta.
>
> Un ejemplo de fichero alternativo es `kaonashi.txt`, que formó parte de una charla de investigación realizada por Pablo Caro Martín y Jaime Sánchez para la RootedCON de 2019.



# Laboratorio

Este laboratorio contiene las siguientes características:

- Usuario con privilegios de administrador.
- Usuario sin privilegios, normal.
- Servicio de SSH.
- La aplicación `nmap`.
- La aplicación `hydra`.
- Una versión del reducida de `rockyou.txt` (top 15.000 entradas).

**Puedes conectarte usando las credenciales del usuario normal: `user:user`.**

Una vez dentro, podrás usar `hydra` para obtener las credenciales del administrador, aunque primero sería necesario conocer su usuario; también puedes ejecutar el programa para obtener tu propia contraseña (la del usuario `user`).



# Referencias

- [Versión de rockyou.txt del laboratorio](https://gist.github.com/roycewilliams/4003707694aeb44c654bf27a19249932)
- [Adiós rockyou.txt - Bienvenido kaonashi.txt](https://sniferl4bs.com/2020/02/adios-rockyou.txt-bienvenido-kaonashi.txt)
- [Repositorio de GitHub de Kaonashi](https://github.com/kaonashi-passwords/Kaonashi)
