# Introducción a Linux

Linux es un sistema operativo de código abierto y gratuito que ha revolucionado el mundo de la informática desde su creación en 1991 por Linus Torvalds.

La principal característica de Linux es su filosofía de código abierto, lo que significa que su código fuente está disponible para que cualquier persona lo estudie, modifique y distribuya libremente.

Una de las principales diferencias entre Linux y otros sistemas operativos es su diversidad de distribuciones, ya que existen numerosas distribuciones de Linux, como: [Debian](https://www.debian.org), [Fedora](https://getfedora.org), [Arch Linux](https://archlinux.org), [Ubuntu](https://ubuntu.com), [CentOS](https://www.centos.org) ... entre otras, cada una con sus propias características y enfoques. Esto permite a los usuarios elegir la distribución que mejor se adapte a sus necesidades y preferencias. **Respecto a la ciberseguridad, en especial, se pueden destacar las distribuciones [Kali Linux](https://www.kali.org) y [ParrotOS](https://parrotsec.org)**.

Además, Linux es conocido por su estabilidad y seguridad, lo que lo convierte en una opción popular para servidores y entornos de trabajo críticos, ya que ha desempeñado un papel fundamental en el desarrollo de la informática: muchos servidores web, supercomputadoras, dispositivos móviles y sistemas embebidos utilizan Linux como base.

También es ampliamente utilizado en el ámbito de la programación y el desarrollo de software, ya que proporciona herramientas poderosas y un entorno de desarrollo robusto. Su enfoque en el código abierto ha fomentado una comunidad activa y colaborativa de desarrolladores, lo que ha llevado a una amplia gama de aplicaciones y herramientas disponibles para Linux.


## Jerarquía de ficheros y directorios

Los ficheros en los sistemas UNIX están organizados en una jerarquía de directorios, cuyo objetivo es facilitar la gestión y el acceso a los mismos. Esta estructura de directorios se conoce como **[FHS (*Filesystem Hierarchy Standard*)](https://refspecs.linuxfoundation.org/fhs.shtml)** y es la que se utiliza en la mayoría de los sistemas UNIX, incluyendo Linux.

Esta jerarquía de directorios proporciona una estructura lógica y coherente para los ficheros y directorios, lo que permite tanto a los usuarios como a las aplicaciones encontrar y acceder a los ficheros de manera más eficiente. Además, la jerarquía de directorios también permite una gestión más sencilla de los permisos de acceso y la seguridad del sistema.


### `/`

La raíz de esta jerarquía mencionada es el directorio `/` (barra), y a partir de este directorio se encuentran todos los demás directorios y ficheros del sistema.

Se conoce como el **directorio raíz** y es el único directorio que no tiene un directorio padre.

```text
$ ls /

bin    etc    lib    mnt    proc   run    srv    tmp    var
dev    home   media  opt    root   sbin   sys    usr
```

- Todas las rutas de un fichero o directorio comienzan con `/`.
- Solo el usuario `root` puede escribir en este directorio.
- El directorio personal del usuario `root` del sistema se encuentra en `/root`.

### `/bin`

Contiene ficheros binarios (ejecutables) esenciales, que implementan los comandos y utilidades básicas del sistema.

> **Ejemplos**  
> El código ejecutable del comando `ls` se encuentra en `/bin/ls`.

```text
$ ls /bin

arch           echo           kill           nice           sh
ash            ed             link           nisdomainname  sleep
base64         egrep          linux32        pidof          stat
bbconfig       false          linux64        ping           stty
busybox        fatattr        ln             ping6          su
cat            fdflush        login          pipe_progress  sync
chgrp          fgrep          ls             printenv       tar
chmod          fsync          lzop           ps             touch
chown          getopt         makemime       pwd            true
conspy         grep           mkdir          reformime      umount
cp             gunzip         mknod          rev            uname
date           gzip           mktemp         rm             usleep
dd             hostname       more           rmdir          watch
df             ifconfig       mount          route          ypdomainname
dmesg          ionice         mountpoint     run-parts      zcat
dnsdomainname  iostat         mpstat         sed
domainname     ipcalc         mv             setpriv
dumpkmap       kbd_mode       netstat        setserial
```

- El directorio `/bin` se encuentra en la ruta de búsqueda global del sistema (`$PATH`), lo que significa que los comandos ubicados en ese directorio pueden ser ejecutados desde cualquier ubicación del sistema sin necesidad de especificar su ruta.
- Los comandos ubicados en `/bin` son de uso general y están disponibles para todos los usuarios del sistema.
- El contenido de `/bin` es estático, ya que sus ficheros son esencialmente ejecutables compilados que no requieren librerías externas para su funcionamiento.
- El directorio `/bin` se monta como *solo lectura* al inicio, para evitar cambios accidentales o maliciosos en los ficheros binarios esenciales del sistema.

## `/boot`

Contiene los ficheros necesarios para el arranque del sistema.

```text
$ ls /boot

config-5.15.0-72-generic      initrd.img-5.15.0-73-generic  System.map-5.15.0-73-generic
config-5.15.0-73-generic      initrd.img.old                vmlinuz
efi                           memtest86+.bin                vmlinuz-5.15.0-72-generic
grub                          memtest86+.elf                vmlinuz-5.15.0-73-generic
initrd.img                    memtest86+_multiboot.bin      vmlinuz.old
initrd.img-5.15.0-72-generic  System.map-5.15.0-72-generic
```

Se muestran a continuación algunos de los ficheros más importantes de `/boot`:

- **`efi` o `grub`**: gestores de arranque EFI (*Extensible Firmware Interface*) o GRUB (*Grand Unified Bootloader*) que usan muchos sistemas Linux.  
Se encargan de cargar el kernel del sistema operativo y de transferir el control al mismo; además, permiten seleccionar el sistema operativo que se desea arrancar en caso de que existan varios instalados en el sistema.
- **`initrd.img` o `initramfs`**: imagen de arranque inicial.  
Contiene una imagen temporal de un sistema de ficheros mínimo que se utiliza para montar el sistema de ficheros raíz y cargar los módulos del kernel necesarios para arrancar el sistema de ficheros real.
- **`System.map`**: mapa de símbolos del kernel.
Contiene la tabla de símbolos del kernel, que son los nombres de las funciones y variables globales que se utilizan en el kernel y sus módulos.  
Este archivo es útil para diagnóstico y depuración del kernel.
- **`vmlinuz`**: kernel del sistema operativo.  
Se encarga de administrar los recursos del hardware y de proporcionar servicios básicos tanto al sistema como a los programas.

## `/dev`

Contiene ficheros especiales que representan dispositivos de hardware y que permiten acceder a los mismos; más concretamente, estos ficheros son interfaces de software utilizadas para acceder a hardware o recursos del sistema.

Estos ficheros no solo representan dispositivos físicos, también pueden representar dispositivos virtuales o pseudo-dispositivos.

> **¿Qué es un pseudo-dispositivo?**  
> Un dispositivo que no existe físicamente, sino que es creado por el sistema operativo para proporcionar una interfaz de software que permita acceder a un recurso del sistema.
>
> Algunos ejemplos son los ficheros `null`, `zero` y `random`.

Los ficheros especiales de `/dev` se crean automáticamente al arrancar el sistema, y se eliminan al apagarlo.

```text
$ ls /dev

core     full     null     pts      shm      stdin    tty      zero
fd       mqueue   ptmx     random   stderr   stdout   urandom
```

Aunque los nombres pueden variar según la distribución, algunos de los ficheros especiales más comunes son:

- **`null`**: dispositivo nulo.  
Cuando se escribe en él, los datos escritos se descartan.
- **`zero`**: dispositivo de ceros.  
Cuando se lee, se obtiene una secuencia de bytes nulos.
- **`random` y `urandom`**: dispositivo de números aleatorios.  
Cuando se lee, se obtiene una secuencia de bytes aleatorios.
- **`tty`**: terminal actual del usuario.  
Cuando se escribe en él o se lee, se interactúa con la entrada y salida estándar de la terminal actual. Pueden existir varios ficheros `tty` numerados (uno por terminal).
- **`fd`**: descriptor de archivo.  
Cuando se lee, se obtiene una lista de los descriptores de archivo abiertos por el proceso actual. Un descriptor de archivo es un número entero que identifica un archivo abierto por un proceso.
- **`stdin`**: entrada estándar de UNIX.  
Cuando se lee, se obtiene la entrada estándar del usuario. Por defecto, la entrada estándar es el teclado, por lo que al leer de `stdin` se obtienen los caracteres introducidos por el usuario.
- **`stdout`**: salida estándar de UNIX.  
Cuando se escribe en él, se envía la salida estándar al usuario. Por defecto, la salida estándar es la pantalla o una terminal, por lo que al escribir en `stdout` se muestran los caracteres en la pantalla.

Además de los dispositivos mostrados, existen numerosos ficheros en `/dev` para interactuar con dispositivos de hardware como: impresoras, tarjetas de sonido, cámaras, unidades de CD/DVD, puertos serie, puertos USB, etc.

## `/etc`

Contiene ficheros de configuración que controlan el funcionamiento de diversos aspectos del sistema y de los programas instalados en él.

```text
$ ls /etc

alpine-release        init.d                network               shadow
apk                   inittab               opt                   shadow-
ca-certificates       iproute2              os-release            shells
ca-certificates.conf  iptables              passwd                ssh
conf.d                issue                 passwd-               ssl
crontabs              logrotate.d           periodic              sysctl.conf
ethertypes            modprobe.d            profile               sysctl.d
fstab                 modules               profile.d             terminfo
group                 modules-load.d        protocols             udhcpd.conf
group-                motd                  resolv.conf           vim
hostname              mtab                  securetty             wgetrc
hosts                 nanorc                services
```

Algunas cosas a tener en cuenta:

- **Permisos y seguridad**: los archivos ubicados en `/etc` suelen tener permisos restringidos para garantizar la seguridad del sistema; normalmente, solo el usuario `root` tiene permisos de lectura y escritura sobre estos ficheros, mientras que el resto de usuarios solo pueden leerlos.
- **Estructura y organización**: aunque la estructura exacta de `/etc` pueda variar según la distribución, suele estar organizada en subdirectorios que contienen ficheros de configuración relacionados entre sí. Algunos ejemplos podrían ser: `/etc/init.d` para scripts de inicio, `/etc/network` para configuración de red, `/etc/passwd` para información de usuarios, `/etc/ssh` para configuración de SSH, etc.
- **Personalización del sistema**: el directorio `/etc` proporciona a los administradores la posibilidad de personalizar y ajustar su comportamiento según sus necesidades: al editar los ficheros de configuración relevantes, es posible modificar la forma en que se ejecutan los servicios, las políticas de seguridad, las rutas de acceso de ficheros, las opciones de red y muchas otras configuraciones.

Por último, pero no menos importante, **modificar ficheros de `/etc` puede causar problemas en el funcionamiento del sistema**, por lo que es recomendable hacer copias de seguridad de los ficheros antes de modificarlos.

## `/home`

Contiene los directorios personales de los usuarios del sistema.

Cada vez que un usuario es registrado en el sistema se crea un directorio en `/home` con el nombre del usuario; por ejemplo, la carpeta del usuario `srgalan` estará en `/home/srgalan`. Este directorio está diseñado para ser utilizado por el propietario de la cuenta y generalmente tiene permisos de lectura, escritura y ejecución restringidos solo para ese usuario en particular.

Estos directorios de los usuarios se conocen como **directorios _home_** (aunque no sean literalmente `/home`) y pueden referenciarse con el alias `~` (tilde) o `$HOME` (variable de entorno).

```text
srgalan@alpine:~$ ls /home
srgalan
sradmin

srgalan@alpine:~$ echo ~
/home/srgalan

srgalan@alpine:~$ echo $HOME
/home/srgalan

sradmin@alpine:~$ echo ~
/home/sradmin

root@alpine:~# echo ~
/root
```

> **Recordatorio**  
> Cabe destacar que, como se mencionó anteriormente, el usuario `root` tiene su directorio personal en `/root` en lugar de `/home/root`.

Además de los directorios personales de los usuarios, es posible encontrar otros directorios dentro de `/home` que se utilicen para diferentes propósitos; por ejemplo: `/home/shared` o `/home/public`, que se utiliza para compartir archivos y recursos entre varios usuarios.

También, algunas distribuciones añaden directorios adicionales dentro de los directorios personales de los usuarios; por ejemplo, es común encontrar un directorio `/home/usuario/bin` que actúa como el directorio `/bin` descrito anteriormente (binarios y comandos básicos del sistema), pero solo para el usuario en cuestión.

## `/lib`

Contiene las librerías compartidas y ficheros de datos utilizados por programas y aplicaciones del sistema.

Estas librerías se conocen como **_shared libraries_** o **librerías dinámicas** y son binarios que contienen funciones y rutinas de código reutilizables que pueden ser utilizadas por múltiples programas a la vez. Almacenar estas bibliotecas en un lugar común permite ahorrar espacio en disco y facilita la gestión y actualización de las bibliotecas del sistema. Se cargan en memoria cuando se ejecuta un programa que las requiere y, a diferencia de las librerías estáticas, estas librerías no se vinculan al programa en tiempo de compilación, sino que se cargan en tiempo de ejecución.

```text
$ ls /lib

apk                    libcrypto.so.1.1       mdev
firmware               libssl.so.1.1          modules-load.d
ld-musl-x86_64.so.1    libz.so.1              sysctl.d
libc.musl-x86_64.so.1  libz.so.1.2.12
```

Algunos ejemplos de librerías comunes son:

- **Librerías `.so`**: librerías compartidas de UNIX; por ejemplo, `libc.so` y `libm.so`, librerías estándar y matemática de C, respectivamente.
- **Directorios `.d`**: directorios que contienen ficheros de configuración para programas y servicios; por ejemplo, `modules-load.d` contiene ficheros de configuración para cargar módulos del kernel.
- **Enlaces simbólicos**: también es común encontrar enlaces simbólicos que apuntan a versiones específicas de las librerías compartidas, permitiendo mantener la compatibilidad con versiones distintas.

> **Nota**  
> Algunos sistemas operativos utilizan además un directorio `/lib64` para almacenar librerías de 64 bits, mientras que `/lib` se utiliza para librerías de 32 bits.

## `/media`

Contiene directorios que actúan como puntos de montaje para dispositivos extraíbles como CD-ROM, DVD, unidades USB, etc, lo que proporciona un acceso rápido y sencillo al contenido de estos dispositivos.

Generalmente, el directorio `/media` está vacío, pero cuando se conecta un dispositivo extraíble, se crea un directorio con el nombre del dispositivo dentro de `/media` y se monta el dispositivo en ese directorio. Además, en algunas distribuciones, también es posible encontrar un directorio intermedio con el nombre del usuario que montó el dispositivo (por ejemplo, `/media/srgalan/usb` en vez de `/media/usb`).

```text
$ ls /media

cdrom   floppy  usb
```

> **Nota**  
> No debe confundirse con `/mnt` o `/mnt/media`, ni con `/dev`: el directorio `/media` se utiliza específicamente para montar dispositivos extraíbles y acceder a su contenido, mientras que:
> - `/mnt` se utiliza para montar sistemas de archivos temporales o permanentes.
> - `/mnt/media` se utiliza para montar sistemas de archivos de red.
> - `/dev` contiene ficheros especiales que representan dispositivos de hardware.

## `/mnt`

Contiene directorios que actúan como puntos de montaje para sistemas de archivos temporales o permanentes.

Se debe tener en cuenta que el directorio `/mnt` generalmente se utiliza para montajes temporales y puede variar según la distribución y la configuración del sistema. Algunos sistemas pueden utilizar directorios adicionales, como `/mnt/cdrom`, `/mnt/usb`, etc, para montajes específicos.

## `/opt`

Contiene directorios con paquetes de software de terceros y aplicaciones que no forman parte del sistema operativo.

Su propósito principal es proporcionar un lugar centralizado para instalar software de terceros en el sistema operativo, lo que ayuda a mantener organizadas las aplicaciones y paquetes que no están incluidos en la distribución base del sistema.

Los paquetes de software suelen tener su propio directorio individual dentro de `/opt`.

```text
$ ls /opt

brave.com  containerd
```

Además, también es común dichos paquetes incluyan su propia estructura de directorios (`/opt/app/bin` para los ejecutables, `/opt/app/lib` para las bibliotecas, `/opt/app/share` para los archivos compartidos, ...); estos directorios secundarios suelen seguir una estructura estándar similar a la utilizada en otros lugares del sistema.

> **Importante**  
> El directorio `/opt` no es un estándar estricto definido por el sistema operativo en sí. Sin embargo, se ha convertido en una convención ampliamente aceptada en muchas distribuciones de UNIX y Linux.

## `/proc`

Contiene directorios y ficheros virtuales generados dinámicamente, que proporcionan información sobre el sistema y los procesos en ejecución.

```text
$ ls /proc

1                  driver             kpageflags         softirqs
101                dynamic_debug      loadavg            stat
75                 execdomains        locks              swaps
77                 fb                 mdstat             sys
acpi               filesystems        meminfo            sysrq-trigger
asound             fs                 misc               sysvipc
bootconfig         interrupts         modules            thread-self
buddyinfo          iomem              mounts             timer_list
bus                ioports            mtrr               tty
cgroups            irq                net                uptime
cmdline            kallsyms           pagetypeinfo       version
consoles           kcore              partitions         version_signature
cpuinfo            key-users          pressure           vmallocinfo
crypto             keys               schedstat          vmnet
devices            kmsg               scsi               vmstat
diskstats          kpagecgroup        self               zoneinfo
dma                kpagecount         slabinfo
```

Respecto al sistema, se proporciona información sobre el hardware y el kernel:

- **`/proc/cpuinfo`**: información sobre la CPU.
- **`/proc/meminfo`**: información sobre la memoria.
- **`/proc/version`**: información sobre la versión del kernel.

```text
$ cat /proc/meminfo

MemTotal:        7990292 kB
MemFree:          202884 kB
MemAvailable:    3433260 kB
Buffers:          178912 kB
Cached:          3252008 kB
SwapCached:        54060 kB
Active:          2764984 kB
Inactive:        4177116 kB

(...)

HugePages_Free:        0
HugePages_Rsvd:        0
HugePages_Surp:        0
Hugepagesize:       2048 kB
Hugetlb:               0 kB
DirectMap4k:      811884 kB
DirectMap2M:     7428096 kB
DirectMap1G:           0 kB
```

Respecto a los procesos, se proporciona información detallada sobre los procesos en ejecución; cada proceso tiene un directorio correspondiente a su identificador numérico (PID) dentro de `/proc`:

- **`/proc/<PID>/cmdline`**: línea de comandos utilizada para ejecutar el proceso.
- **`/proc/<PID>/cwd`**: directorio de trabajo actual del proceso.
- **`/proc/<PID>/environ`**: variables de entorno del proceso.
- **`/proc/<PID>/status`**: estado del proceso.


```text
$ ls /proc/77/

arch_status         fd                  numa_maps           smaps_rollup
attr                fdinfo              oom_adj             stack
autogroup           gid_map             oom_score           stat
auxv                io                  oom_score_adj       statm
cgroup              limits              pagemap             status
clear_refs          loginuid            patch_state         syscall
cmdline             map_files           personality         task
comm                maps                projid_map          timens_offsets
coredump_filter     mem                 root                timers
cpu_resctrl_groups  mountinfo           sched               timerslack_ns
cpuset              mounts              schedstat           uid_map
cwd                 mountstats          sessionid           wchan
environ             net                 setgroups
exe                 ns                  smaps
```

## `/root`

El directorio personal del usuario `root`.

Actúa como cualquier otro directorio personal de `/home`, pero solo es accesible por el usuario `root` y este se encuentra en la raíz del sistema (`/`).

## `/run`

Directorio temporal que contiene ficheros y directorios que son necesarios durante el tiempo de ejecución del sistema.

Suele emplearse para almacenar ficheros generados por programas y servicios en ejecución, así como para crear otros recursos temporales. Este directorio es especialmente útil para contener aquellos ficheros que no deben ser persistentes entre reinicios del sistema.

```text
$ ls /run

acpid.pid        log                      sudo
acpid.socket     lvm                      sysconfig
alsa             motd.d                   systemd
avahi-daemon     mount                    thermald
blkid            netns                    tmpfiles.d
blkmapd.pid      NetworkManager           u-d-c-gpu-0000:01:00.0-0x10de-0x13c0
console-setup    nvidia-persistenced      u-d-c-nvidia-drm-was-loaded
containerd       nvidia-xdriver-8f484723  u-d-c-nvidia-was-loaded
crond.pid        openvpn                  udev
crond.reboot     openvpn-client           udisks2
cryptsetup       openvpn-server           unattended-upgrades.lock
cups             plymouth                 user
dbus             rpcbind                  utmp
dmeventd-client  rpcbind.lock             uuidd
dmeventd-server  rpcbind.sock             vmnat.2035
docker           rpc_pipefs               vmnet-bridge-0.pid
docker.pid       runc                     vmnet-dhcpd-vmnet1.pid
docker.sock      sendsigs.omit.d          vmnet-dhcpd-vmnet8.pid
gdm3             shm                      vmnet-natd-8.pid
gdm3.pid         snapd                    vmnet-netifup-vmnet1.pid
initctl          snapd-snap.socket        vmnet-netifup-vmnet8.pid
initramfs        snapd.socket             vmware
irqbalance       speech-dispatcher        xtables.lock
lock             spice-vdagentd
```

Algunos ejemplos de ficheros que se pueden encontrar en este directorio son:

- **Sockets (`.sock`)**: ficheros que permiten la comunicación entre procesos (por ejemplo, `docker.sock`).
- **Ficheros de PID (`.pid`)**: contienen el identificador de un proceso (por ejemplo, `docker.pid`).
- **Ficheros de bloqueo (`.lock`)**: permiten bloquear el acceso a un recurso (por ejemplo, `xtables.lock`).
- **Ficheros de cola**: almacenan mensajes o datos temporales que serán procesados por otros componentes del sistema (por ejemplo, `rpc_pipefs`).

## `/sbin`

Contiene programas ejecutables del sistema relacionados a la administración del mismo, en general: inicio, apagado, configuración de red, manejo de dispositivos y otras tareas de administración críticas.

Se conocen como **comandos de administración del sistema** y están destinados a ser ejecutados por el usuario `root`.

> **Nota**  
> A diferencia del directorio `/bin`, que contiene comandos utilizados por usuarios regulares, el directorio `/sbin` alberga utilidades y programas esenciales que están diseñados para la gestión y configuración del sistema

```text
$ ls /sbin

acpid                       ifup                        modinfo
adjtimex                    init                        modprobe
apk                         inotifyd                    nameif
arp                         insmod                      nologin
arptables                   ip                          nstat
arptables-nft               ipaddr                      pivot_root
arptables-nft-restore       iplink                      plipconfig
arptables-nft-save          ipmaddr                     poweroff
arptables-restore           ipneigh                     raidautorun
arptables-save              iproute                     rarp
blkid                       iprule                      reboot
blockdev                    iptables                    rmmod
bridge                      iptables-legacy             route
ctstat                      iptables-legacy-restore     routef
depmod                      iptables-legacy-save        routel
ebtables                    iptables-nft                rtacct
ebtables-nft                iptables-nft-restore        rtmon
ebtables-nft-restore        iptables-nft-save           rtpr
ebtables-nft-save           iptables-restore            rtstat
ebtables-restore            iptables-restore-translate  setconsole
ebtables-save               iptables-save               slattach
fbsplash                    iptables-translate          ss
fdisk                       iptunnel                    swapoff
findfs                      klogd                       swapon
fsck                        ldconfig                    switch_root
fstrim                      lnstat                      sysctl
genl                        loadkmap                    syslogd
getty                       logread                     tc
halt                        losetup                     tunctl
hdparm                      lsmod                       udhcpc
hwclock                     mdev                        vconfig
ifcfg                       mii-tool                    watchdog
ifconfig                    mkdosfs                     xtables-legacy-multi
ifdown                      mkfs.vfat                   xtables-monitor
ifenslave                   mkmntdirs                   xtables-nft-multi
ifstat                      mkswap
```

Algunos ejemplos de comandos comunes en este directorio son:

- **`fdisk`**: manipular tablas de particiones de los discos.
- **`ifconfig`**: configurar y mostrar información de las interfaces de red.
- **`init`**: proceso padre del sistema, responsable de iniciar y detener servicios durante el arranque y apagado del sistema.
- **`iptables`**: herramienta de firewall para configurar reglas de filtrado de paquetes en el kernel.
- **`mount`**: montar sistemas de archivos en el árbol de directorios.
- **`reboot`**: reiniciar el sistema.
- **`shutdown`**: apagar el sistema de forma segura.
- **`udevadm`**: administrar el sistema de dispositivos dinámicos del kernel.

## `/srv`

Contiene datos específicos de servicios que se ejecutan en el sistema.

El propósito principal del directorio `/srv` es almacenar datos que son proporcionados por los servicios del sistema en lugar de datos generales del sistema operativo; por ejemplo, algunos servicios de red como servidores web, servidores de archivos o servidores de impresión, entre otros, pueden utilizar el directorio para almacenar los ficheros y documentos que se sirven a través de estos servicios.

```text
$ ls /srv

ftp  http  nfs  rsync  tftp
```

Cabe destacar que este directorio se trata de una convención y, aunque no es un directorio estándar definido por el sistema, se ha adoptado comúnmente en varias distribuciones de UNIX. Esta decisión se basa en la idea de separar los datos del servicio de los datos del sistema: al utilizar `/srv`, se pretende facilitar la administración y el mantenimiento de los servicios, ya que los archivos relevantes para cada servicio se pueden encontrar en un lugar común y predecible.

## `/tmp`

Contiene ficheros temporales que son creados por diferentes programas y servicios del sistema (archivos de caché, registros, archivos intermedios, ...).

Los ficheros almacenados en `/tmp` no solo se eliminan automáticamente cuando el sistema se reinicia, sino que también pueden ser eliminados por el sistema en cualquier momento, por lo que no se recomienda utilizarlo para almacenar ficheros importantes.

```text
$ ls /tmp

config-err-SARr6j
snap-private-tmp
ssh-Gc1CS4I1T4Mv
systemd-private-80c033ea57ea4d-colord.service-cISgUf
systemd-private-80c033ea57ea4d-fwupd.service-Zqlz5f
systemd-private-80c033ea57ea4d-ModemManager.service-eH7Raf
systemd-private-80c033ea57ea4d-switcheroo-control.service-7PMRuf
systemd-private-80c033ea57ea4d-systemd-logind.service-NRHZWg
systemd-private-80c033ea57ea4d-systemd-resolved.service-L7JcVh
systemd-private-80c033ea57ea4d-systemd-timesyncd.service-eRevri
systemd-private-80c033ea57ea4d-upower.service-9bzVwh
tracker-extract-files.1000
tracker-extract-files.125
vmware-root
vscode-typescript1000
```

Algunos aspectos importantes:

- **Acceso público**: generalmente, `tmp` es accesible para todos los usuarios del sistema, por lo que cualquier usuario puede crear, modificar o eliminar ficheros en este directorio; esto también permite que múltiples programas o usuarios compartan archivos temporales, facilitando la colaboración y el intercambio de datos temporales entre ellos.
- **Montaje en RAM**: en algunos sistemas modernos, el directorio `/tmp` se monta en la memoria RAM, mejorando el rendimiento al ofrecer un acceso más rápido a los ficheros temporales; además, reduce el desgaste del disco duro.

## `/usr`

Contiene los programas y datos de usuarios que no son esenciales para el funcionamiento del sistema, aunque su uso puede variar en función de la distribución.

```text
$ ls /usr

bin                       local
include                   sbin
lib                       share
libexec                   x86_64-alpine-linux-musl
```

La estructura común de este directorio es la siguiente:

- **`/usr/bin`**: contiene los programas ejecutables que se pueden utilizar por todos los usuarios del sistema.
- **`/usr/include`**: contiene los ficheros de cabecera que se utilizan para compilar aplicaciones y librerías.
- **`/usr/lib` y `/usr/lib64`**: contiene las librerías compartidas y los módulos de carga dinámica. Sigue el mismo patrón que `/lib` y `/lib64`, pero para programas y datos de usuarios.
- **`/usr/local`**: contiene los programas y datos de usuarios que no son parte de la distribución, sino que han sido instalados localmente por el administrador del sistema.
- **`/usr/sbin`**: contiene los programas ejecutables que solo pueden ser utilizados por el administrador del sistema.
- **`/usr/share`**: contiene los datos compartidos que se utilizan por diferentes programas y servicios del sistema; por ejemplo, archivos de configuración, documentación, ficheros de localización, etc.

> **Nota**  
> Sigue una estructura muy parecida a la del directorio `/`, pero en esta ocasión, se aplican a los programas y datos de usuarios que además no son esenciales para el sistema.

## `/var`

Contiene datos variables del sistema, como registros, archivos de estado, colas de correo y ficheros temporales.

```text
$ ls /var

cache  git    local  log    opt    spool  www
empty  lib    lock   mail   run    tmp
```

Algunos ejemplos de directorios comunes en este directorio son:

- **`/var/cache`**: ficheros de caché de aplicaciones y servicios del sistema.
- **`/var/lib`**: datos persistentes de aplicaciones y servicios del sistema.
- **`/var/log`**: los registros de los diferentes servicios del sistema.
- **`/var/mail`**: los buzones de correo de los usuarios.
- **`/var/opt`**: datos variables de aplicaciones y servicios del sistema.
- **`/var/run`**: archivos de estado de aplicaciones y servicios del sistema.
- **`/var/spool`**: colas de correo y de impresión.
- **`/var/tmp`**: ficheros temporales que no se eliminan automáticamente cuando el sistema se reinicia.
- **`/var/www`**: ficheros de sitios y aplicaciones web que se ejecutan en el sistema (si se utiliza como servidor web).


# La terminal

La terminal es una interfaz de línea de comandos que permite a los usuarios interactuar con el sistema operativo mediante la introducción de comandos de texto.

Se trata de una herramienta muy potente que permite a los usuarios realizar tareas complejas de forma rápida y eficiente, aunque también es cierto que su uso puede resultar intimidante para los usuarios menos experimentados.

> **¿Por qué utilizar la terminal?**  
> Aunque la mayoría de las tareas se pueden realizar utilizando una interfaz gráfica o GUI (*Graphical User Interface*), la terminal ofrece una serie de ventajas que la convierten en una herramienta muy útil para los usuarios más experimentados.
> 
> No obstante, cabe destacar que en Linux no todo tiene una GUI disponible y por tanto, solo es posible usar la terminal.

Aquí se muestra un ejemplo de la cabecera de una terminal en Kali Linux:

```text
[srgalan@kali:~/Documents]$ 
```

La cabecera separa las distintas ejecuciones de los comandos y se compone de los siguientes elementos (en base al ejemplo mostrado):

- **`srgalan`**: nombre del usuario ejecutando la terminal.
- **`kali`**: nombre del equipo.
- **`~/Documents`**: directorio actual (en este caso, los documentos del usuario).
- **`$`**: símbolo del *prompt*, también llamado faceta, que indica que la terminal está esperando comandos.
    - Si es `$`, significa que se ejecuta por un usuario.
    - Si es `#`, significa que se ejecuta por el superusuario o `root`.


## La shell

La shell es un programa que actúa como capa de abstracción entre el terminal y el sistema operativo, lo que permite a los usuarios interactuar con el sistema operativo mediante la introducción de comandos de texto.

Existen diferentes tipos de shell, aunque la más común es la shell Bash (*Bourne Again SHell*), que es la shell por defecto en la mayoría de las distribuciones de Linux.

No hay que confundirlo con un terminal:

- El terminal es un programa que proporciona una interfaz de usuario para acceder a la shell.
- La shell se encarga de interpretar los comandos introducidos por el usuario y ejecutarlos.


## Comandos

Los comandos son programas que se ejecutan en la terminal para realizar tareas específicas, como administrar el sistema, gestionar archivos y directorios, etc.

Esta sección abarcará algunos comandos básicos que se utilizan con frecuencia en la terminal, pero también incluirá algunos comandos más utilizados en el ámbito de la seguridad informática.


### Básicos

| Comando |     Argumentos     | Descripción                                             |
|:-------:|:------------------:|:------------------------------------------------------- |
|   cd    |    [directorio]    | Cambia el directorio actual.                            |
|   ls    |       [ruta]       | Lista los archivos y directorios del directorio actual. |
|   pwd   |                    | Muestra la ruta absoluta del directorio actual.         |
|  mkdir  |    [directorio]    | Crea un directorio.                                     |
|  rmdir  |    [directorio]    | Elimina un directorio.                                  |
|  touch  |     [archivo]      | Crea un archivo vacío.                                  |
|   rm    |     [archivo]      | Elimina un archivo.                                     |
|   cp    | [origen] [destino] | Copia un archivo o directorio.                          |
|   mv    | [origen] [destino] | Mueve un archivo o directorio.                          |
|   cat   |     [archivo]      | Muestra el contenido de un archivo.                     |
|  less   |     [archivo]      | Muestra el contenido de un archivo de forma paginada.   |
|  head   |     [archivo]      | Muestra las primeras líneas de un archivo.              |
|  tail   |     [archivo]      | Muestra las últimas líneas de un archivo.               |
|  grep   | [patrón] [archivo] | Busca un patrón en un archivo.                          |
|  find   | [ruta] [criterios] | Busca archivos y directorios.                           |
|  sudo   |     [comando]      | Ejecuta un comando con privilegios de superusuario.     |
|   su    |     [usuario]      | Cambia de usuario.                                      |
|  exit   |                    | Cierra la terminal.                                     |

### Usuarios, grupos y permisos

| Comando  |           Argumentos            | Descripción                                        |
|:--------:|:-------------------------------:|:-------------------------------------------------- |
|  whoami  |                                 | Muestra el nombre de usuario actual.               |
|    id    |                                 | Muestra la identificación de usuario y los grupos. |
|  groups  |                                 | Muestra los grupos del usuario actual.             |
|  passwd  |                                 | Cambia la contraseña del usuario actual.           |
| adduser  |            [usuario]            | Crea un nuevo usuario.                             |
| deluser  |            [usuario]            | Elimina un usuario.                                |
| addgroup |             [grupo]             | Crea un nuevo grupo.                               |
| delgroup |             [grupo]             | Elimina un grupo.                                  |
| usermod  |      [opciones] [usuario]       | Modifica un usuario.                               |
| groupmod |       [opciones] [grupo]        | Modifica un grupo.                                 |
| userdel  |      [opciones] [usuario]       | Elimina un usuario.                                |
| groupdel |       [opciones] [grupo]        | Elimina un grupo.                                  |
| useradd  |      [opciones] [usuario]       | Crea un nuevo usuario.                             |
| userdel  |      [opciones] [usuario]       | Elimina un usuario.                                |
| usermod  |      [opciones] [usuario]       | Modifica un usuario.                               |
| groupadd |       [opciones] [grupo]        | Crea un nuevo grupo.                               |
| groupdel |       [opciones] [grupo]        | Elimina un grupo.                                  |
| groupmod |       [opciones] [grupo]        | Modifica un grupo.                                 |
|  chmod   | [permisos] [archivo/directorio] | Cambia los permisos de un archivo o directorio.    |
|  chown   | [usuario] [archivo/directorio]  | Cambia el propietario de un archivo o directorio.  |
|  chgrp   |  [grupo] [archivo/directorio]   | Cambia el grupo de un archivo o directorio.        |

### Red

|  Comando   |         Argumentos         | Descripción                                |
|:----------:|:--------------------------:|:------------------------------------------ |
|  ifconfig  |                            | Muestra la configuración de red.           |
|     ip     |                            | Muestra la configuración de red.           |
|    ping    |           [host]           | Envía paquetes ICMP a un host.             |
| traceroute |           [host]           | Muestra la ruta de los paquetes a un host. |
|  netstat   |                            | Muestra las conexiones de red.             |
|     ss     |                            | Muestra las conexiones de red.             |
|    nmap    |  [opciones] [host/rango]   | Escanea puertos y servicios.               |
|     nc     | [opciones] [host] [puerto] | Abre una conexión TCP o UDP.               |
|  tcpdump   |         [opciones]         | Captura paquetes de red.                   |
| wireshark  |         [opciones]         | Captura paquetes de red.                   |
|    ssh     |      [usuario]@[host]      | Abre una conexión SSH.                     |
|    scp     | [archivo] [usuario]@[host] | Copia archivos a través de SSH.            |
|    sftp    |      [usuario]@[host]      | Transfiere archivos a través de SSH.       |

### Sistema

| Comando |          Argumentos           | Descripción                                       |
|:-------:|:-----------------------------:|:------------------------------------------------- |
|  uname  |                               | Muestra información del sistema.                  |
| uptime  |                               | Muestra el tiempo de actividad del sistema.       |
|   who   |                               | Muestra los usuarios conectados.                  |
|    w    |                               | Muestra los usuarios conectados.                  |
|  last   |                               | Muestra los últimos usuarios conectados.          |
|   ps    |                               | Muestra los procesos en ejecución.                |
|   top   |                               | Muestra los procesos en ejecución.                |
|  kill   |       [opciones] [PID]        | Envía una señal a un proceso.                     |
| killall |      [opciones] [nombre]      | Envía una señal a un proceso.                     |
|  pkill  |      [opciones] [patrón]      | Envía una señal a un proceso.                     |
|  pgrep  |      [opciones] [patrón]      | Muestra los procesos que coinciden con un patrón. |
| pstree  |                               | Muestra los procesos en forma de árbol.           |
|  free   |                               | Muestra el uso de memoria.                        |
|   df    |                               | Muestra el uso de disco.                          |
|   du    |                               | Muestra el uso de disco.                          |
|  mount  |   [opciones] [dispositivo]    | Monta un sistema de archivos.                     |
| umount  | [opciones] [punto_de_montaje] | Desmonta un sistema de archivos.                  |
|  fdisk  |   [opciones] [dispositivo]    | Gestiona particiones.                             |
|  mkfs   |   [opciones] [dispositivo]    | Crea un sistema de archivos.                      |
|  fsck   |   [opciones] [dispositivo]    | Verifica y repara un sistema de archivos.         |

### Archivos

| Comando |      Argumentos       | Descripción                                     |
|:-------:|:---------------------:|:----------------------------------------------- |
|   dd    |      [opciones]       | Copia y convierte archivos.                     |
|  file   |       [archivo]       | Muestra el tipo de archivo.                     |
| strings |       [archivo]       | Muestra las cadenas de texto de un archivo.     |
| hexdump |       [archivo]       | Muestra el contenido hexadecimal de un archivo. |
|   xxd   |       [archivo]       | Muestra el contenido hexadecimal de un archivo. |
|  diff   | [archivo1] [archivo2] | Muestra las diferencias entre dos archivos.     |
|  patch  |       [archivo]       | Aplica un parche a un archivo.                  |

### Procesos

| Comando |     Argumentos      | Descripción                                       |
|:-------:|:-------------------:|:------------------------------------------------- |
|   ps    |                     | Muestra los procesos en ejecución.                |
|   top   |                     | Muestra los procesos en ejecución.                |
|  kill   |  [opciones] [PID]   | Envía una señal a un proceso.                     |
| killall | [opciones] [nombre] | Envía una señal a un proceso.                     |
|  pkill  | [opciones] [patrón] | Envía una señal a un proceso.                     |
|  pgrep  | [opciones] [patrón] | Muestra los procesos que coinciden con un patrón. |
| pstree  |                     | Muestra los procesos en forma de árbol.           |

### Memoria

| Comando | Argumentos | Descripción                              |
|:-------:|:----------:|:---------------------------------------- |
|  free   |            | Muestra el uso de memoria.               |
| vmstat  |            | Muestra el uso de memoria.               |
|  pmap   |   [PID]    | Muestra el uso de memoria de un proceso. |
|   top   |            | Muestra el uso de memoria.               |


# Permisos del sistema, usuarios y grupos

En un sistema operativo basado en Unix, como Linux, los permisos desempeñan un papel crucial para garantizar la seguridad y la gestión eficiente de los recursos del sistema.

Los permisos se pueden otorgar a usuarios individuales o a grupos de usuarios, por eso es importante comprender cómo funcionan los usuarios y los grupos en Linux, para además complementar el conocimiento de los permisos.

## Usuarios

Los usuarios son cuentas individuales que representan a personas o servicios que interactúan con el sistema; cada usuario tiene un nombre de usuario único y una identificación de usuario (UID) asociada.

Los usuarios se crean para permitir a las personas acceder al sistema y utilizar los recursos disponibles; cada usuario tiene su propio entorno y configuración personalizada, así como su directorio de inicio y su shell predeterminada.

```text
$ id

uid=1000(ubuntu) gid=1000(ubuntu) groups=1000(ubuntu),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),116(lxd),999(docker)
```

## Grupos

Los grupos son una forma de organizar y administrar usuarios en categorías lógicas; cada usuario puede pertenecer a uno o más grupos; se utilizan para simplificar la asignación de permisos y el manejo de recursos compartidos.

```text
$ groups

ubuntu adm cdrom sudo dip plugdev lxd docker
```

```text
$ cat /etc/group

root:x:0:
daemon:x:1:
bin:x:2:
sys:x:3:
adm:x:4:syslog,ubuntu
tty:x:5:
disk:x:6:
```

## Permisos del sistema

Los permisos del sistema definen los niveles de acceso y control que se otorgan a usuarios y grupos sobre archivos y directorios; en un sistema basado en Unix, los permisos se dividen en tres categorías principales:

- Lectura (**r**), que permite ver el contenido de un archivo o listar los archivos en un directorio.
- Escritura (**w**), que permite modificar o eliminar un archivo existente, y en un directorio, permite crear, eliminar o renombrar archivos.
- Ejecución (**x**) permite ejecutar un archivo o acceder a un directorio. En el caso de los directorios, también es necesario tener permiso de ejecución para acceder a su contenido.

Estos permisos se asignan tanto a usuarios individuales como a grupos; además, los permisos se establecen para tres categorías de usuarios:

- El propietario del archivo.
- El grupo propietario.
- Otros usuarios.

Estos permisos se representan mediante una combinación de letras y símbolos, como rwx, y se asignan al propietario, grupo y otros usuarios.

```text
$ ls -l /home

total 24
drwxr-xr-x 2 bart  bart  4096 Jul  1 14:32 bart
drwxr-xr-x 2 homer homer 4096 Jul  1 14:32 homer
drwxr-xr-x 2 lisa  lisa  4096 Jul  1 14:32 lisa
drwxr-xr-x 2 marge marge 4096 Jul  1 14:32 marge
drwxr-xr-x 1 user  user  4096 Jul  1 14:32 user
```

La correcta gestión de usuarios, grupos y permisos del sistema es esencial para mantener la seguridad y la integridad de un sistema informático; a través de la asignación adecuada de permisos, puedes controlar qué usuarios y grupos pueden acceder, modificar o ejecutar archivos y directorios específicos.

Esta segmentación garantiza que los usuarios solo tengan acceso a los recursos necesarios para realizar sus tareas y protege los datos confidenciales de accesos no autorizados.

Asignación de permisos a través de comandos.

![Permisos](https://linuxcommand.org/images/file_permissions.png)

```
rwx rwx rwx = 111 111 111
rw- rw- rw- = 110 110 110
rwx --- --- = 111 000 000

(...)

rwx = 111, que es 7 en binario.
rw- = 110, que es 6 en binario.
r-x = 101, que es 5 en binario.
r-- = 100, que es 4 en binario.

(...)
```

> **Ejemplos**  
> - `chmod 777 file` -> Todos los permisos al dueño, grupo y usuarios (`rwx rwx rwx`).
> - `chmod 005 file` -> Lectura y ejecución a los usuarios (`--- --- r-x`).
> - `chmod 201 file` -> Escritura al dueño y ejecución a los usuarios (`-w- --- --x`).

> **Nota**  
> Cabe destacar que, lógicamente, los ficheros con permisos `777` son una muy mala práctica de seguridad, ya que cualquier usuario podría modificarlos o ejecutarlos.
> 
> Se recomienda encarecidamente seguir una **política de permisos mínimos** a la hora de gestionar los permisos de los ficheros en un sistema.

# Laboratorio

Este laboratorio consiste en un entorno Debian con varios usuarios y grupos creados, así como varios ficheros con diferentes permisos.

El objetivo es que puedas practicar con los comandos de gestión de usuarios, grupos y permisos, así como con los comandos de búsqueda de ficheros, de red, de gestión de memoria y de procesos.

Estos son los siguientes usuarios:

- `root`, superusuario.
- `user`, usuario normal.
- `homer`, usuario normal y miembro del grupo `simpsons`.
- `marge`, usuario normal y miembro del grupo `simpsons`.
- `bart`, usuario normal y miembro del grupo `simpsons`.
- `lisa`, usuario normal y miembro del grupo `simpsons`.

La contraseña de cada usuario es el nombre del usuario.


# Referencias

- [Linux File Hierachy](https://www.geeksforgeeks.org/linux-file-hierarchy-structure)
- [linuxcomand.org](https://linuxcommand.org)
