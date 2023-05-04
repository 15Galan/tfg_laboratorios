> **Warning**  
> Esto no es un laboratorio, sino la documentación para la página en la que se describe el uso de Kali Linux como una máquina virtual con la que complementar la plataforma. Se usarán:
>
> - [Vagrant](https://www.vagrantup.com), como gestor declarativo de máquinas virtuales.
> - [VirtualBox](https://www.virtualbox.org), como hypervisor de la máquina virtual.
> - [Kali Linux](https://www.kali.org), como máquina virtual y herramienta genérica de pentesting.
>
> La documentación describirá cómo crear y usar una máquina virtual para conectarse a los laboratorios y practicar los distintos conceptos de la plataforma, porque algunas vulnerabilidades requieren de herramientas que cuentan con una interfaz gráfica; aquellas instaladas en los laboratorios tienden más a ser scripts y aplicaciones pensadas para la consola.



# Pwner

Para complementar las funcionalidades de la plataforma, esta es una pequeña introducción a la creación e instalación de una máquina virtual de Kali Linux.

Pero primero, será necesario aclarar algunos conceptos.

## ¿Qué es una máquina virtual?

Una máquina virtual es **un sistema operativo que se ejecuta dentro de otro sistema operativo, de forma aislada**; es decir, todo lo que ocurre dentro de la máquina virtual no afecta a tu ordenador. Teniendo en cuenta ese factor aislante, las máquinas virtuales son muy útiles para multitud de propósitos en el campo de la informática en general.

Algunos ejemplos son los siguientes:

- **Desarrollo y pruebas**: permiten crear un entorno de desarrollo y pruebas aislado del sistema operativo anfitrión, con configuraciones específicas necesarias para desarrolar y probar una aplicación; esto permite a los desarrolladores trabajar en diferentes sistemas operativos y configuraciones sin tener que adquirir múltiples equipos físicos.
- **Aislamiento de malware**: también se utilizan como medida de seguridad para aislar el malware en entornos seguros; esto permite a los investigadores de seguridad analizar el malware sin poner en riesgo el sistema operativo anfitrión.
- **Experimentación**: realizar experimentos de mucho riesgo podrían afectar el sistema operativo anfitrión, pero el uso de copias de seguridad y clonación de máquinas virtuales permiten a los usuarios experimentar con diferentes configuraciones en un espacio seguro.
- **Virtualización de servidores**: permitir una asignación más eficiente de los recursos de un servidor, lo que permite a las empresas reducir los costes de hardware y aumentar la escalabilidad de sus servicios.

Las máquinas virtuales son útiles, pero será encesario un software que permita tratar con ellas.

## ¿Qué es un hypervisor?

Un hypervisor es un **software que permite crear, eliminar y gestionar máquinas virtuales** (configuración de sus componentes virtuales, configuración de red...).

Este software se encarga de **emular los componentes físicos de un ordenador** (CPU, RAM, disco duro, tarjeta de red...) para que el sistema operativo que se ejecuta dentro de la máquina virtual pueda interactuar con ellos como si se tratase de un ordenador físico.

Existe una amplia variedad de hypervisores, pero los más comunes son los siguientes:

- [VirtualBox](https://www.virtualbox.org): hypervisor de código abierto desarrollado por Oracle que destaca por ser el más popular y el más sencillo de usar, pero también el más limitado.
- [VMware](https://www.vmware.com): hypervisor de código privado desarrollado por VMware que destaca por ser el más completo y el más potente, pero también el más complejo de usar.
- [Hyper-V](https://www.microsoft.com): hypervisor de código privado desarrollado por Microsoft que destaca por ser el más integrado con Windows, pero también el más limitado.

> **Recomendación**  
> Los usuarios principiantes en la virtualización se sentirán más cómodos con **VirtualBox**, ya que es el más sencillo de usar y el más popular, por lo que existe más información y ayuda en Internet en caso de ser necesaria.  
> VirtualBox es con el que se trabajará en esta documentación.

## ¿Qué es Kali Linux?

Kali Linux es una distribución de Linux basada en Debian que está orientada a la seguridad informática y al pentesting. Esta distribución cuenta con una gran cantidad de herramientas de seguridad, por lo que es muy útil y la más usada en el campo de la ciberseguridad, por lo que encontrarás mucha información y ayuda en caso de que la necesites.

> **Importante**  
> Kali Linux es un conjunto de herramientas compatibles con Linux, esto quiere decir que las herramientas pueden usarse en cualquier distribución de Linux, pero Kali Linux ya cuenta con todas las herramientas preinstaladas y configuradas desde el comienzo.


# Instalación

¡Perfecto! Una vez mencionado qué es una máquina virtual, un hypervisor y Kali Linux, ya se puede comenzar con la instalación de una máquina virtual con la que poder llevar a cabo técnicas de pentesting en los laboratorios de la plataforma.

## Conseguir VirtualBox

Para instalar VirtualBox en Linux, se puede usar el siguiente comando:

```shell
sudo apt install virtualbox
```

> Si se usa Windows o macOS, se puede descargar el instalador correspondiente desde la [página oficial](https://www.virtualbox.org/wiki/Downloads).


## Conseguir Kali Linux

Las máquinas virtuales de un sistema operativo pueden crearse a través de los archivos `.ISO` de dicho sistema operativo, que son archivos que contienen una imagen del sistema, lo que permite instalarlo en los ordenadores convencionales -y también, en máquinas virtuales-.

Sin embargo, también pueden descargarse máquinas virtuales ya creadas y configuradas, esto suele ser más rápido y en esta ocasión, es muy conveniente; para ello, se usará **Vagrant** y **Vagrant Cloud**.

### Vagrant y Vagrant Cloud

- Vagrant es un **gestor de máquinas virtuales que se caracteriza por hacerlo de forma declarativa**; es decir, a través de un *archivo de configuración que describe cómo debe ser una máquina virtual*, llamado *Vagrantfile*.
- Estas máquinas pueden obtenerse en Vagrant Cloud, un **portal de máquinas virtuales** con el que subir y descargar máquinas ya configuradas, y de forma gratuita.

Para instalar Vagrant en Linux, se puede usar el siguiente comando:

```shell
sudo apt install vagrant
```

> Si se usa Windows o macOS, se puede descargar el instalador correspondiente desde la [página oficial](https://www.vagrantup.com/downloads).

Una vez instalado, se creará una carpeta para la máquina virtual de Kali Linux donde se almacenará el *Vagrantfile* que se generará automáticamente al descargar la máquina.

```shell
mkdir ~/Vagrant/Kali
```

Para la máquina virtual de Kali Linux, se usará esta: [elrey741/kali-linux_amd64](https://app.vagrantup.com/elrey741/boxes/kali-linux_amd64); puede descargarse manualmente o ejecutando el siguiente comando:

```shell
vagrant init elrey741/kali-linux_amd64
```

## Crear y ejecutar la máquina virtual

Una vez descargada la máquina virtual, se puede crear y ejecutar con el siguiente comando:

```shell
vagrant up
```

Este comando detectará si la máquina virtual definida en el *Vagrantfile* (Kali Linux) existe en VirtualBox y la ejecutará. Si no existe, la descargará previamente.

---

**Una vez hecho todo eso, el entorno de Kali Linux estará listo para usarse**.
