# Introducción a las Redes

Conocer los conceptos básicos de redes es fundamental para comprender el funcionamiento de Internet y de las redes en general, lo que al mismo tiempo se traslada a la ciberseguridad, ya que la mayoría de los ataques se realizan a través de Internet y no solo eso, algunas acciones como el análisis de vulnerabilidades o la recopilación de información se realizan a través de Internet.

Por otro lado, este conocimiento no solo sirve para acciones ofensivas de Red Team, sino que también es fundamental para acciones defensivas de Blue Team, ya que es necesario conocer cómo funcionan las redes para poder protegerlas y mejorarla contra ataques y vulnerabilidades.

> **Importante**  
> La terminología de las redes contienen mucha información tan importante como "larga", por lo que existen muchas siglas y abreviaturas para todos aquellos términos y conceptos.
>
> Esto puede resultar confuso al principio, pero es importante conocerlos y familiarizarse con ellos, ya que son la base de las redes y de la ciberseguridad.

## Protocolos

Los protocolos de red son conjuntos de reglas y normas que definen la comunicación y el intercambio de datos entre dispositivos en una red. Estos protocolos son esenciales para permitir que los diferentes dispositivos de una red se comuniquen de manera efectiva y sin problemas.

Existen numerosos protocolos de red utilizados en todo el mundo, pero hay algunos que son especialmente fundamentales y comunes.

### IP

> _**I**nternet **P**rotocol_.

Este es el protocolo principal utilizado en Internet para el enrutamiento y la entrega de datos entre dispositivos.

Cada dispositivo conectado a Internet tiene una dirección IP única que se utiliza para identificarlo y enrutar los datos correctamente; actualmente existen 2 versiones:

#### IPv4

- Dirección numérica de **32 bits**.
- Formato **decimal** con `.` (por ejemplo, *192.168.0.1*).
- Cada sección -**octeto**- de la dirección consta de **8 bits**, oscilando entre 0 y 255.
- Aproximadamente **4.300.000** direcciones únicas.
  
> **La cantidad de direcciones IPv4 disponibles se ha limitado**  
> Esto ha llevado al desarrollo de las direcciones IPv6, ya que el elevado crecimiento de Internet está consumiendo las direcciones IPv4 existentes.

#### IPv6

- Dirección numérica de **128 bits**
- Formato **hexadecimal** con `:` (por ejemplo, *2001:0db8:85a3:0000:0000:8a2e:0370:7334*).
- Cada **grupo** de la dirección consta de **4 dígitos hexadecimales**, oscilando entre 0 y 65535.
- Aproximadamente **3.4 · 10^(38)** direcciones únicas.

> **Simplificación de la dirección**  
> - Los `0` a la izquierda de un grupo pueden omitirse.
> - Los grupos de `0` consecutivos pueden representarse como `::`.

IPv6 ofrece una solución a la escasez de direcciones al tiempo que introduce mejoras en:
- Seguridad.
- Autoconfiguración.
- Otras características.

#### IPv4 vs IPv6

Cabe destacar las direcciones IPv4 e IPv6 no son directamente compatibles, por lo que existen diversos mecanismos y tecnologías de transición que permiten la comunicación entre ambos protocolos.

|              Características               |                Dirección IPv4                |                                     Dirección IPv6                                     |
|:------------------------------------------:|:--------------------------------------------:|:--------------------------------------------------------------------------------------:|
|           Longitud de dirección            |                   32 bits                    |                                        128 bits                                        |
|                  Formato                   |           Decimal separado por `.`           |                              Hexadecimal separado por `:`                              |
|              Rango de valores              |        `0.0.0.0`<br>`255.255.255.255`        | `0000:0000:0000:0000:0000:0000:0000:0000`<br>`ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff` |
| Cantidad (aprox.)<br>de direcciones únicas |                  4.3 · 10^8                  |                                     3.4 · 10^(38)                                      |
|                  Ejemplos                  | *192.168.0.1*<br>*172.17.0.2*<br>*127.0.0.1* |                   *2001:0db8:85a3:0000:0000:8a2e:0370:7334*<br>*::1*                   |


### TCP

> _**T**ransmission **C**ontrol **P**rotocol_.

El objetivo principal del TCP es asegurar que los datos sean entregados de manera confiable, en orden y sin errores a través de una red. Para lograr esto, TCP segmenta los datos en unidades más pequeñas llamadas "paquetes" antes de enviarlos y se encarga de que estos paquetes sean entregados correctamente al destino.

#### Características

1. **Conexión orientada**  
Se establece una conexión virtual entre el remitente y el receptor antes de iniciar la transferencia de datos; esto se logra a través de un proceso llamado "apretón de manos de tres vías" (*three-way handshake*). Durante este proceso, el remitente y el receptor intercambian una serie de mensajes para establecer parámetros de conexión y sincronizar las secuencias de datos.

2. **Confiable**  
Se garantiza la entrega confiable de los datos; esto se logra utilizando un mecanismo de confirmación de recepción (*acknowledgment*) donde el receptor envía un mensaje de confirmación al remitente para informar que los datos han sido recibidos correctamente. Si el remitente no recibe la confirmación dentro de un tiempo determinado, retransmite los datos.

3. **Control de flujo**  
Se implementa un control de flujo para evitar que el receptor se vea abrumado por una cantidad excesiva de datos. El receptor puede informar al remitente sobre su capacidad de recibir datos mediante el uso de ventanas de recepción, y el remitente ajusta la velocidad de envío de datos en consecuencia.

4. **Control de congestión**  
Se realiza un control de congestión para evitar la saturación de la red. Si esta se congestiona y los paquetes se pierden o hay un alto retardo, se reduce la velocidad de transmisión para evitarlo.

5. **Ordenamiento de datos**  
Se garantiza que los paquetes se entreguen en el orden correcto en el destino; cada paquete TCP contiene un número de secuencia que permite al receptor reconstruir los datos en el orden original.

![Imagen](https://www.cablefree.net/support/radio/software/images/f/fc/Image2001.gif)

El protocolo TCP ha sido ampliamente adoptado y se utiliza en numerosas aplicaciones y servicios que requieren una entrega confiable de datos, como navegación web, transferencia de archivos, correo electrónico y aplicaciones de mensajería. Su confiabilidad y su capacidad para recuperarse de la pérdida o la corrupción de datos lo convierten en una opción preferida para muchas aplicaciones que priorizan la integridad de los datos transmitidos.

### UDP

> _**U**ser **D**atagram **P**rotocol_.

A diferencia de TCP, UDP no proporciona una comunicación confiable y orientada a la conexión; en su lugar, UDP ofrece una transmisión de datos más rápida y eficiente, pero menos confiable.

#### Características

1. **Comunicación no confiable**
No se establece una conexión antes de enviar los datos, lo que significa que no hay confirmaciones de recepción ni retransmisiones automáticas en caso de pérdida de paquetes. Esto hace que si un paquete se pierde durante la transmisión, no se retransmite automáticamente, y la aplicación receptora no es consciente de la pérdida de paquetes.

2. **Transmisión de datos más rápida**  
Debido a su naturaleza no confiable, UDP tiene una sobrecarga más baja que TCP, lo que lo convierte en una opción más rápida para ciertas aplicaciones. Además, como se dijo anteriormente, no se requiere un apretón de manos de tres vías (*three-way handshake*) para establecer una conexión antes de enviar los datos, lo que reduce aún más la latencia.

3. **Segmentación de datos**  
Al igual que TCP, UDP también segmenta los datos en paquetes más pequeños para su transmisión a través de la red. Sin embargo, los paquetes UDP no tienen números de secuencia para mantener el orden de los datos: son independientes entre sí y pueden llegar en cualquier orden a su destino.

![Imagen](https://www.freecodecamp.org/news/content/images/2021/07/udp-and-tcp-comparison.jpg)

UDP es ampliamente utilizado por aplicaciones que requieren una entrega rápida de datos, como transmisiones de video en vivo, videojuegos en línea y llamadas VoIP (*Voice IP*). También se utiliza para servicios de transmisión de datos en tiempo real, como DNS (*Domain Name System*), DHCP (*Dynamic Host Configuration Protocol*) y TFTP (*Trivial File Transfer Protocol*).

> **Nota**  
> Cabe destacar que, debido a su naturaleza no confiable, si la integridad de los datos es crítica, se deben implementar mecanismos de verificación y manejo de errores en el nivel de la aplicación que utiliza UDP.

### ICMP

> _**I**nternet **C**ontrol **M**essage **P**rotocol_.

Se utiliza principalmente para informar y diagnosticar problemas en la comunicación de red. Aunque no está diseñado para transportar datos de usuario, desempeña un papel importante en la gestión y el control de la red.

#### Características

1. **Mensajes de control**  
Se utiliza para enviar mensajes de control y errores entre dispositivos en una red IP. Estos mensajes pueden proporcionar información sobre problemas de conectividad, errores de enrutamiento, tiempos de espera, redirecciones, etc.

2. **Pruebas y diagnóstico de red**  
ICMP es ampliamente utilizado para realizar pruebas y diagnósticos de red. Por ejemplo, el comando "ping" se basa en ICMP para enviar solicitudes de eco a un destino específico y recibir respuestas. Esto permite verificar la conectividad y la latencia de red entre dos dispositivos.

3. **Fragmentación de paquetes**  
Incluye mensajes relacionados con la fragmentación de paquetes IP. Si un paquete IP es demasiado grande para ser transmitido en una red en particular, se divide en fragmentos más pequeños. ICMP puede enviar mensajes para gestionar adecuadamente la fragmentación y reensamblaje de paquetes en la red cuando sea necesario.

Cabe destacar que, aunque ICMP es un protocolo valioso para el diagnóstico y la gestión de red, **también puede ser utilizado en ataques de denegación de servicio (DoS) o para recopilar información sensible de la red**; por lo tanto, es esencial implementar medidas de seguridad adecuadas para proteger las redes de posibles abusos de ICMP.

> **Nota**  
> Este es el protocolo que se usa cuando se ejecuta el comando `ping` para comprobar la conectividad con un host remoto.

### ARP

> _**A**ddress **R**esolution **P**rotocol_.

Protocolo de red utilizado para mapear direcciones IP a direcciones MAC en una red local. Su función principal es encontrar la dirección MAC asociada a una dirección IP específica dentro de una red Ethernet.

Cuando un dispositivo necesita enviar datos a otro dispositivo en la misma red local, primero debe determinar la dirección MAC del destino para poder enviar los datos correctamente, aquí es donde entra en juego el protocolo ARP.

![Imagen](https://static.wixstatic.com/media/6a4a49_a2483e8dd4004c12b1105b855054cddd~mv2.png/v1/fill/w_1000,h_736,al_c,q_90,usm_0.66_1.00_0.01/6a4a49_a2483e8dd4004c12b1105b855054cddd~mv2.png)

1. El dispositivo emisor envía una solicitud ARP (ARP request) a la red, preguntando quién tiene una determinada dirección IP. Esta solicitud se transmite a todas las máquinas en la red local (broadcast).
2. El dispositivo con la dirección IP solicitada responde con un mensaje ARP (ARP reply), proporcionando su dirección MAC.
3. Luego, el dispositivo emisor guarda esta información en su tabla ARP, que mantiene un registro de las asociaciones entre direcciones IP y direcciones MAC de los dispositivos en la red local.
4. Usando esa información, el dispositivo emisor puede enviar los datos al dispositivo destino utilizando la dirección MAC correspondiente.

La tabla ARP es importante porque permite evitar tener que enviar solicitudes ARP cada vez que se necesita enviar un paquete de datos a una dirección IP específica en la red local. La tabla ARP se almacena en la memoria caché del dispositivo y se actualiza periódicamente para garantizar que las asociaciones de direcciones IP y MAC estén actualizadas.

![Imagen](https://www.networkacademy.io/sites/default/files/inline-images/garp.gif)

Cabe destacar que el protocolo ARP se utiliza dentro de una red local para resolver las direcciones de destino en la misma red, mientras que para comunicarse con dispositivos en otras redes, se requiere el uso de enrutadores y otros protocolos, como IP.

Aunque ARP es esencial para el funcionamiento de las redes locales, **también puede ser aprovechado por atacantes en técnicas de ataques de suplantación de ARP (ARP spoofing) para interceptar y manipular el tráfico de red**; por lo tanto, es importante implementar medidas de seguridad adecuadas, como la autenticación de dispositivos y la detección de ataques ARP, para proteger la integridad y la confidencialidad de la red.

### DHCP

> _**D**ynamic **H**ost **C**onfiguration **P**rotocol_.

Su objetivo principal es simplificar y automatizar el proceso de asignación de direcciones IP, eliminando la necesidad de una configuración manual en cada dispositivo.

DHCP funciona mediante un proceso de intercambio de mensajes entre un servidor DHCP y los dispositivos cliente de la red, por lo que se requiere al menos un servidor DHCP en la red para asignar direcciones IP a los dispositivos cliente.

#### Mensajes

1. **Descubrimiento** (DHCP Discover)  
Cuando un dispositivo se conecta a una red y está configurado para obtener una dirección IP automáticamente, envía un mensaje de descubrimiento DHCP broadcast a través de la red local. Este mensaje solicita la asignación de una dirección IP al servidor DHCP.

2. **Oferta** (DHCP Offer)  
Cuando un servidor DHCP recibe la solicitud de descubrimiento, responde enviando un mensaje de oferta DHCP broadcast. En este mensaje, el servidor propone una dirección IP disponible junto con otros parámetros de configuración, como la máscara de subred, la puerta de enlace predeterminada y los servidores DNS.

3. **Solicitud** (DHCP Request)  
Una vez que el dispositivo cliente recibe las ofertas de diferentes servidores DHCP, selecciona una y envía un mensaje de solicitud DHCP. Este mensaje confirma la aceptación de la oferta del servidor DHCP seleccionado.

4. **Aceptación** (DHCP Acknowledgment)  
El servidor DHCP recibe la solicitud y responde con un mensaje de aceptación DHCP. Este mensaje contiene la dirección IP asignada al dispositivo cliente y otros parámetros de configuración solicitados. El dispositivo cliente ahora utiliza la dirección IP y los demás parámetros para configurar su conexión de red.

DHCP también puede renovar y extender la duración de una dirección IP asignada previamente. Esto se hace mediante un proceso de renovación de concesiones, en el que el dispositivo cliente solicita al servidor DHCP una extensión de tiempo antes de que la dirección IP actual expire.

> **Nota**  
> Además de asignar direcciones IP, DHCP también puede proporcionar otros parámetros de configuración, como servidores DNS, servidores WINS (para la resolución de nombres de Windows) y configuraciones específicas de red, como las opciones de enrutamiento.

El uso de DHCP simplifica la administración de redes al permitir la asignación automática y centralizada de direcciones IP. Esto es especialmente útil en redes grandes donde la configuración manual de cada dispositivo sería una tarea tediosa y propensa a errores. Además, el DHCP facilita el movimiento de dispositivos dentro de la red, ya que pueden obtener una nueva dirección IP automáticamente al conectarse a un nuevo segmento de red.

Sin embargo, es importante tener en cuenta la seguridad al implementar DHCP. **Los servidores DHCP deben estar protegidos adecuadamente para evitar la asignación de direcciones IP a dispositivos no autorizados y prevenir ataques de suplantación de identidad**.

### HTTP y HTTPS

> _**H**yper**t**ext **T**ransfer **P**rotocol (**S**ecure)_

Estos son 2 protocolos de aplicación utilizados para la transferencia de información en la World Wide Web (WWW), que permiten que los navegadores web se comuniquen con los servidores web y soliciten recursos, como páginas web, imágenes, videos, etc.

**HTTP** se utiliza para la comunicación entre el navegador web del cliente y el servidor web. Se basa en el modelo de solicitud y respuesta, donde el cliente envía una solicitud al servidor y este responde con los datos solicitados. Las solicitudes HTTP incluyen métodos como GET, POST, PUT, DELETE, entre otros, que determinan el tipo de operación que se realizará en el servidor.

**HTTPS** es una extensión segura del protocolo HTTP que utiliza cifrado para garantizar la seguridad y privacidad de la comunicación entre el cliente y el servidor. HTTPS utiliza el protocolo SSL/TLS (*Secure Sockets Layer/Transport Layer Security*) para establecer una conexión segura. El cifrado en HTTPS protege los datos durante la transmisión, evitando que sean interceptados o modificados por atacantes.


|                         |                                               HTTP                                                |                                                                HTTPS                                                                |
|:-----------------------:|:-------------------------------------------------------------------------------------------------:|:-----------------------------------------------------------------------------------------------------------------------------------:|
|        Seguridad        |                                  Envía los datos en texto plano                                   |                   Utiliza certificado SSL/TLS para establecer una conexión segura y cifrar los datos transmitidos                   |
|         Riesgo          |                   Riesgo para la confidencialidad y la integridad de los datos                    |                          Mayor seguridad y protección de la confidencialidad y la integridad de los datos                           |
|    Cifrado de datos     |                                    No se cifra la información                                     |                                               Cifra los datos durante la transmisión                                                |
|   Acceso a los datos    | Cualquier persona que intercepte la comunicación puede leer y comprender el contenido transmitido |                           Solo el servidor y el cliente pueden acceder a los datos en un formato legible                            |
|    Puerto utilizado     |                                    Puerto 80 (predeterminado)                                     |                                                             Puerto 443                                                              |
| Uso en aplicaciones web |                               Adecuado para datos no confidenciales                               | Esencial para proteger la privacidad y la integridad de los datos transmitidos en aplicaciones web que manejan información sensible |
|     URL indicadora      |                                      Comienza con `http://`                                       |                                                       Comienza con `https://`                                                       |

### SSH

> _**S**ecure **Sh**ell_.

Proporciona una forma segura de acceder y controlar de manera remota servidores, computadoras y otros dispositivos de red.

A diferencia de otros protocolos de acceso remoto, como Telnet, que transmiten datos en texto plano, SSH utiliza técnicas de cifrado para proteger la confidencialidad e integridad de la información transmitida. Esto significa que la comunicación a través de SSH está encriptada, lo que dificulta a los atacantes interceptar y leer los datos transmitidos.

Además de proporcionar un canal seguro de comunicación, SSH también ofrece autenticación sólida utilizando un sistema de autenticación basado en claves públicas y privadas para verificar la identidad del usuario que intenta establecer la conexión. Esto significa que los usuarios pueden autenticarse sin necesidad de transmitir contraseñas en texto plano a través de la red, lo que aumenta la seguridad y protege contra ataques de suplantación de identidad.

SSH se utiliza ampliamente en entornos de administración de sistemas y redes, así como en aplicaciones que requieren una conexión segura, ya que permite a los administradores de sistemas tanto gestionar y configurar servidores de forma remota, como ejecutar comandos y realizar tareas administrativas sin necesidad de estar físicamente presentes en el servidor.

### FTP y SFTP

> _(**S**ecure) **F**ile **T**ransfer **P**rotocol_.

Son protocolos utilizados para la transferencia de archivos en redes de computadoras y, aunque ambos protocolos tienen una finalidad similar, existen diferencias importantes en cuanto a seguridad y funcionamiento.

**FTP** es uno de los protocolos más antiguos y ampliamente utilizados para transferir archivos en redes. Funciona sobre el protocolo TCP y utiliza 2 canales separados para la comunicación: uno para el intercambio de comandos y otro para la transferencia de datos. FTP es un protocolo no seguro, lo que significa que los datos transferidos a través de FTP no están encriptados y pueden ser interceptados o modificados por terceros.

**SFTP** es una extensión segura de SSH y proporciona una capa adicional de seguridad para la transferencia de archivos. Utiliza una única conexión segura para enviar comandos y transferir datos mediante el cifrado de extremo a extremo. SFTP emplea claves criptográficas y autenticación basada en contraseñas o claves públicas para garantizar la seguridad de la conexión.

#### Principales diferencias

|               |                                                                                        FTP                                                                                        |                                                                         SFTP                                                                         |
|:-------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------:|
|   Seguridad   |                           No proporciona cifrado de datos, lo que significa que la información transferida está expuesta y puede ser leída por terceros                           |                     Utiliza cifrado para proteger los datos durante la transferencia, brindando una capa adicional de seguridad                      |
| Autenticación | Utiliza un nombre de usuario y una contraseña para autenticar a los usuarios. Sin embargo, esta información se transmite en texto plano, lo que representa un riesgo de seguridad |                                Ofrece métodos de autenticación más seguros, como el uso de claves públicas y privadas                                |
|    Puertos    |            Utiliza los puertos 20 y 21 para establecer la conexión y transferir datos, lo que puede causar problemas en entornos de red con restricciones de firewall             | Utiliza el puerto 22, que es el mismo puerto utilizado por SSH, lo que facilita su configuración y evita problemas de bloqueo por parte de firewalls |
| Funcionalidad |       Ofrece un conjunto más amplio de funciones y comandos para realizar operaciones en archivos y directorios, como la capacidad de listar directorios y cambiar permisos       |           Aunque menos extenso en términos de comandos, todavía proporciona funcionalidad básica para transferir archivos de manera segura           |


## Tipos de redes

- **PAN** (_**P**ersonal **A**rea **N**etwork_)  
Red de dispositivos que se limita a un área de trabajo o a un área personal, como un escritorio, una habitación o un solo edificio; aunque las redes PAN pueden ser cableadas, la mayoría de ellas son inalámbricas y se comunican a través de tecnologías como Bluetooth y Wi-Fi.

- **LAN** (_**L**ocal **A**rea **N**etwork_)  
Red de dispositivos que se limita a un área local, como una casa, escuela, oficina o edificio. Las redes LAN pueden ser pequeñas o grandes, pero la velocidad de transferencia de datos es alta y el costo de instalación es bajo.

- **WLAN** (_**W**ireless **L**ocal **A**rea **N**etwork_)  
Red de dispositivos que se limita a un área local y utiliza tecnologías inalámbricas para comunicarse. Las redes WLAN son similares a las redes LAN, pero no utilizan cables para conectar dispositivos, lo que las hace más flexibles y fáciles de implementar.

- **MAN** (_**M**etropolitan **A**rea **N**etwork_)  
Red de dispositivos que se extiende sobre un área geográfica metropolitana, como una ciudad. Las redes MAN conectan múltiples redes LAN y WLAN y pueden ser públicas o privadas, ya que suelen ser utilizadas por empresas, organizaciones y gobiernos para interconectar redes locales y compartir recursos.

- **WAN** (_**W**ide **A**rea **N**etwork_)
Red de dispositivos que se extiende sobre un área geográfica amplia, como un país, un continente o incluso todo el mundo. Las redes WAN pueden ser públicas o privadas y son utilizadas por empresas, gobiernos, organizaciones y personas para interconectar redes locales y compartir recursos.


## Tipos de topologías

Las topologías de red definen la estructura de una red y determinan cómo se comunican los dispositivos entre sí.

![Topologías](https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/NetworkTopologies.svg/1024px-NetworkTopologies.svg.png)

Conocer los diferentes tipos de topologías de red y sus características es importante para comprender cómo funcionan las redes y cómo se comunican los dispositivos, lo que puede ayudar a identificar y solucionar problemas de red.

- **Bus**  
Todos los dispositivos están conectados a un único cable que se denomina bus o *backbone*. Los datos se transmiten a través del cable de un extremo a otro. Todos los dispositivos reciben los datos, pero solo el dispositivo al que se envían los datos los procesa.

- **Estrella**  
Todos los dispositivos están conectados a un único dispositivo central, como un concentrador o un conmutador. Los datos se transmiten a través del dispositivo central, que reenvía los datos a los dispositivos conectados. Los datos se transmiten de un dispositivo a otro a través del dispositivo central.

- **Anillo**  
Todos los dispositivos están conectados en un bucle continuo. Los datos se transmiten en un solo sentido, de un dispositivo a otro, hasta que llegan al dispositivo de destino. Cada dispositivo recibe los datos y los reenvía al siguiente dispositivo en el bucle.

- **Malla / Completa**
Todos los dispositivos están conectados entre sí. Los datos se transmiten de un dispositivo a otro hasta que llegan al dispositivo de destino. Cada dispositivo recibe los datos y los reenvía al siguiente dispositivo en la ruta más corta posible hasta que llegan al dispositivo de destino.

- **Árbol**  
Todos los dispositivos están conectados en una jerarquía de nodos. Los datos se transmiten desde un nodo a otro hasta que llegan al nodo de destino. Cada nodo recibe los datos y los reenvía al siguiente nodo en la ruta más corta posible hasta que llegan al nodo de destino.

- **Híbrida**  
Todos los dispositivos están conectados en una combinación de topologías.


## Dispositivos de red

Estos dispositivos se utilizan para conectar y comunicar otros dispositivos de red.

Normalmente, todas las redes están compuestas de al menos uno de estos dispositivos, ya que son los que permiten conectar un dispositivos con Internet.

- **Router** (enrutador)  
Dispositivo que conecta múltiples redes y transmite datos entre ellas. Los routers son dispositivos de capa de red y pueden filtrar datos, lo que significa que solo los datos que se envían a una red específica se transmiten a esa red.

- **Repeater** (repetidor)  
Dispositivo que amplifica o regenera una señal de red. Los repetidores se utilizan para extender la distancia de una red y pueden ser analógicos o digitales.

- **Hub** (concentrador)  
Dispositivo que conecta múltiples dispositivos de red y transmite datos entre ellos. Los concentradores son dispositivos de capa física y no pueden filtrar datos, lo que significa que todos los datos que reciben se transmiten a todos los dispositivos conectados.

- **Switch** (conmutador)  
Dispositivo que conecta múltiples dispositivos de red y transmite datos entre ellos. Los conmutadores son dispositivos de capa de enlace de datos y pueden filtrar datos, lo que significa que solo los datos que se envían a un dispositivo específico se transmiten a ese dispositivo.

- **Gateway** (puerta de enlace)  
Dispositivo que conecta múltiples redes y transmite datos entre ellas. Los gateways son dispositivos de capa de aplicación y pueden filtrar datos, lo que significa que solo los datos que se envían a una aplicación específica se transmiten a esa aplicación.


## Seguridad

La seguridad de la red es el proceso de proteger una red contra ataques no autorizados, intrusos y abusos. La seguridad de la red se logra mediante el uso de hardware y software, así como mediante la implementación de políticas y procedimientos de seguridad.

- **Firewall**  
Dispositivo que se utiliza para proteger una red de ataques no autorizados, intrusos y abusos; los firewalls se pueden implementar como hardware o software y se pueden configurar para bloquear o permitir el tráfico de red entrante y saliente.

- **VPN** (_**V**irtual **P**rivate **N**etwork_)  
Red privada que se extiende sobre una red pública, como Internet; las VPN se utilizan para proteger las comunicaciones de red mediante el cifrado de los datos que se transmiten a través de la red pública, creando un túnel seguro para la transmisión de datos.

- **Túnel**  
Conexión segura entre dos dispositivos de red que se utiliza para proteger las comunicaciones de red mediante el cifrado de los datos que se transmiten a través de la conexión.

- **Proxy**  
Servidor que se utiliza para proteger una red de ataques no autorizados, intrusos y abusos; los proxies impiden que un cliente y un servidor estén conectados directamente, lo que protege las identidades de ambos dispositivos respecto al otro.

- **IDS** (_**I**ntrusion **D**etection **S**ystem_)  
Dispositivo que se utiliza para detectar ataques no autorizados, intrusos y abusos en una red; los IDS no pueden bloquear el tráfico de red, pero pueden generar alertas cuando se detecta un ataque. Normalmente, un atacante tratará de realizar un ataque usando técnicas que no se detecten fácilmente por el IDS.

- **IPS** (_**I**ntrusion **P**revention **S**ystem_)  
Dispositivo que se utiliza para detectar y bloquear ataques no autorizados, intrusos y abusos en una red; al contrario que un IDS, los IPS sí pueden bloquear el tráfico de red cuando se detecta un ataque.

- **AAA** (_**A**uthentication, **A**uthorization, **A**ccounting_)  
Framework de seguridad que se utiliza para controlar el acceso a los recursos de la red. El AAA se puede implementar como hardware o software y se puede configurar para permitir o denegar el acceso a los usuarios y dispositivos de red.

    - **Autenticación**: verificar la identidad de un usuario o dispositivo.
    - **Autorización**: verificar que un usuario o dispositivo tiene permiso para acceder a los recursos de la red.
    - **Contabilidad**: registrar el uso de los recursos de la red por parte de un usuario o dispositivo.

- **BYOD** (_**B**ring **Y**our **O**wn **D**evice_)  
Política que permite a los usuarios utilizar sus propios dispositivos personales para acceder a los recursos de la red. Los dispositivos personales pueden incluir ordenadores portátiles, tabletas y móviles.

- **NAC** (_**N**etwork **A**ccess **C**ontrol_)  
Proceso de controlar el acceso de los usuarios y dispositivos a una red. El NAC se puede implementar como hardware o software y se puede configurar para permitir o denegar el acceso a los usuarios y dispositivos de red.

- **802.1x**  
Estándar de autenticación de red que se utiliza para controlar el acceso a los recursos de la red. El 802.1x se puede implementar como hardware o software y se puede configurar para permitir o denegar el acceso a los usuarios y dispositivos de red.


### Ataques

Como se mencionó anteriormente, las redes son el principal medio de los ciberataques, por lo que es importante conocer algunos de los ataques más comunes.

Los ataques se pueden clasificar en 2 tipos:

#### Pasivos

Son ataques que no afectan al funcionamiento de la red, pero que pueden comprometer la seguridad de la misma. Algunos ejemplos son:

- **Sniffing**  
Consiste en capturar datos de red, normalmente mediante la captura de paquetes; los atacantes pueden capturar datos e información de todo tipo, incluyendo nombres de usuario, contraseñas, datos de tarjetas de crédito, etc. Si bien los datos normalmente están cifrados, los atacantes pueden utilizar técnicas para descifrarlos.

- **Spoofing**  
Consiste en suplantar la identidad de un dispositivo o usuario en la red; los atacantes pueden suplantar la identidad de un dispositivo o usuario para acceder a una red o realizar otros ataques más avanzados.

- **Replay**  
Consiste en capturar datos de inicio de sesión (*sniffing*) y reenviarlos posteriormente para acceder a una red; los atacantes pueden acceder a una red creando una nueva sesión ya que disponen de los datos de inicio de sesión de un usuario legítimo.

- **Backdoor**  
Consiste en crear una forma de acceder a un dispositivo previamente comprometido sin necesidad de autenticarse; los atacantes pueden utilizar una puerta trasera para volver a acceder a un dispositivo sin volver a comprometerlo, lo que les permite tener un acceso permanente al dispositivo.

#### Activos

Son ataques que sí afectan al funcionamiento de la red, que pueden provocar pérdidas de datos o daños sobre los dispositivos o sus servicios. Algunos ejemplos son:

- **DoS** (_**D**enial **o**f **S**ervice_)  
Consiste en saturar un dispositivo o servicio para que no pueda atender las peticiones de los usuarios legítimos; los atacantes pueden utilizar distintas técnicas para ello, como el envío de paquetes de red, el envío de peticiones a un servicio, etc.

- **DDoS** (_**D**istributed **D**enial **o**f **S**ervice_)  
Se trata de un ataque *DoS* realizado de forma simultánea desde distintos dispositivos, lo que lo hace mucho más difícil de detectar, bloquear y mitigar; los atacantes habrían tenido que realizar otras acciones previamente para comprometer los dispositivos que utilizarán para realizar este ataque.

- **MITM** (_**M**an-**I**n-**T**he-**M**iddle_)  
Consiste en interceptar y manipular las comunicaciones entre dos dispositivos para obtener información de las mismas; se considera un ataque activo ya que los atacantes pueden tener la intención de modificar los datos que se transmiten entre los dispositivos, ya que en caso contrario se estaría realizando *sniffing*.

- **ARP poisoning**  
Consiste en modificar la tabla ARP de un dispositivo para redirigir el tráfico de red a otro dispositivo; los atacantes pueden provocar un fuljo de tráfico distinto al legítimo con el que capturar los datos que se transmiten entre los dispositivos legítimos.

- **DNS poisoning**  
Consiste en modificar la resolución de nombres de dominio para redirigir a los usuarios a sitios web maliciosos; los atacantes pueden provocar otro flujo de tráfico de red para engañar a los usuarios con el fin de que accedan a sitios web maliciosos y así poder capturar sus datos o tratar de que instalen malware, lo que podría comprometer sus dispositivos de red.



# Referencias

- [GeeksforGeeks - Computer Network Tutorials](https://www.geeksforgeeks.org/computer-network-tutorials/)
- [Wikipedia - Computer Network](https://en.wikipedia.org/wiki/Computer_network)