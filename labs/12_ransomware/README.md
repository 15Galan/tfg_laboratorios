# Ataque de Ransomware

El Ransomware es un tipo de malware tan sencillo como peligroso, cuyo objetivo es cifrar los archivos de un sistema, inhabilitando el acceso para sus usuarios y sus servicios.

Los ataques de ransomware consisten precisamente en la infección de un sistema con este tipo de malware, y la posterior petición de un rescate para recuperar los archivos cifrados a cambio de una gran suma de dinero por la clave de descifrado. No obstante, nunca hay garantías de que dicha clave funcione. Aquí algunos ejemplos:

- Los atacantes no tienen la capacidad de descifrar los archivos en muchas ocasiones, y simplemente se aprovechan de la desesperación de las víctimas para obtener dinero fácil.
- Los atacantes sí tienen la capacidad de descifrar los archivos, pero no lo hacen, ya que no tienen ningún incentivo para hacerlo.
- Los atacantes sí descifran los archivos, pero no lo hacen correctamente, y los archivos descifrados quedan corruptos e inservibles.

Este tipo de ataques se han vuelto muy populares en los últimos años, y han afectado a empresas y organizaciones de todo tipo, desde pequeñas start-ups hasta grandes corporaciones, pasando por instituciones gubernamentales, educativas y hasta centros hospitalarios. Tanto es así que actualmente existe un término conocido como **RaaS (*Ransomware as a Service*)**, que se refiere a la venta de kits de ransomware en la *Dark Web*, lo que permite a cualquier persona llevar a cabo este tipo de ataques, sin necesidad de tener conocimientos técnicos avanzados.

El impacto de estos ataques puede ser devastador, ya que los archivos cifrados pueden contener información crítica para el funcionamiento de la organización, y la pérdida de esta información puede llevar a la quiebra de la misma. Sin embargo, pese a la gravedad de estos ataques, el malware utilizado para llevarlos a cabo no es particularmente sofisticado, y en muchos casos se puede evitar su ejecución con medidas de seguridad básicas.

## Ejemplos

### Peyta

Descubierto por primera vez en marzo de 2016, este malware afectaba principalmente a sistemas operativos Windows y se propagaba a través de archivos adjuntos de correo electrónico maliciosos o enlaces de descarga comprometidos.

Peyta cifraba los archivos en el sistema de la víctima y exigía un rescate en Bitcoin para restaurar el acceso a los datos; fue particularmente dañino debido a su capacidad para propagarse rápidamente a través de redes empresariales.

### NotPeyta

También conocido como *Petya.A*, *ExPetr*, o *Nyetya*, fue un ciberataque importante que ocurrió en junio de 2017. Aunque inicialmente se creía que era una variante de Peyta, posteriormente se descubrió que era un malware completamente nuevo.

NotPetya se propagó utilizando una técnica llamada "actualización falsa", donde se disfrazaba como una actualización de software legítima. Una vez infectado un sistema, NotPetya cifraba los archivos y sobrescribía el MBR (*Master Boot Record*) del disco duro, lo que impedía que el sistema operativo se iniciara. Este malware tuvo un impacto significativo en muchas organizaciones en todo el mundo.

### WannaCry

Posiblemente el ransomware más conocido debido a su alcance masivo: aproximadamente 150 países fueron afectados.

El ataque tuvo lugar en mayo de 2017 y se aprovechó de una vulnerabilidad en el protocolo de comunicación SMB de Windows, conocida como EternalBlue.

WannaCry se propagaba automáticamente a través de redes y cifraba los archivos de las víctimas, exigiendo un rescate en Bitcoin para su desbloqueo. Este ataque afectó a cientos de miles de sistemas en todo el mundo, incluyendo hospitales, empresas y organismos gubernamentales.


# Laboratorio

> **Credenciales**  
> - `user:user`.

Este laboratorio contiene una muestra de ransomware muy simple, pero igualmente peligrosa si no se trata con cuidado. EL ransomware se llama `stockholm.py` y ha sido desarrollado en Python.

El script se encuentra en el directorio del usuario `root` y realizará las siguientes acciones:

1. Creará una clave de cifrado aleatoria.
2. Buscará una carpeta llamada *infection* en la carpeta del usuario `root`.
3. Usando la clave, cifrará todos los archivos de la carpeta *infection* cuya extensión también fuera afectada por WannaCry.
4. Guardará la clave de cifrado de forma segura en un archivo llamado *clave.key*.

No obstante, como solo es un ejemplo, el script también puede devolver los archivos a su estado original, siempre y cuando se le proporcione la clave de cifrado correcta; para ello, basta con ejecutar `stockholm.py -r <clave>` y revertirá el cifrado.

> **Nota**  
> Por eso es importante que la clave de cifrado jamás sea cifrada por el propio ransomware; si esto sucediera sería imposible recuperar los archivos.

El objetivo de este laboratorio es que observes el funcionamiento de un ransomware y experimentes con él para que puedas entender mejor cómo funcionan y cómo se pueden evitar.


# Referencias

- [WannaCry](https://es.wikipedia.org/wiki/WannaCry)
- [Petya](https://es.wikipedia.org/wiki/Petya_(malware))
- [NotPetya](https://es.wikipedia.org/wiki/NotPetya)
- [Script stockholm.py](https://github.com/15Galan/42malaga_bootcamp-ciberseguridad/tree/master/stockholm) - Repositorio
