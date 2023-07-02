# Introducción a Bash Scripting

El Bash *scripting* es una de las herramientas más potentes que podemos utilizar en Linux. Nos permite automatizar tareas, y ejecutar comandos de forma secuencial; por tanto, es una herramienta muy útil tanto para desarrolladores, administradores de sistemas y ciberseguridad en general, ya que se encuentra en la base de muchas herramientas.


## Antes de empezar

### ¿Qué es el *scripting*?

El *scripting* es la acción de crear o construir scripts, y donde un script es un fichero de texto que contiene una serie de instrucciones que se ejecutan de forma secuencial; estas instrucciones pueden ser comandos de la terminal, o instrucciones de control de flujo como bucles o condicionales.

Los scripts se pueden ejecutarse de 2 formas:

- **Interactiva**: ejecutando el script en la terminal o de forma manual.  
    Por ejemplo, ejecutando el comando `./script.sh`.
- **Automática**: ejecutando el script de forma programada.  
    Por ejemplo, al arrancar el sistema o al ejecutar un comando concreto.

> **Nota**  
> Una forma muy habitual de automatizar la ejecución de un script es mediante el uso de un *cronjob* o *crontask* (tarea de Cron): un proceso que se ejecuta de forma periódica en el sistema, donde se puede especificar que se ejecuten acciones definidas en scripts.


### ¿Qué es Bash?

Bash es un lenguaje de scripting que se ejecuta a nivel de sistema operativo que permite automatizar tareas y ejecutar comandos de forma secuencial.

Se trata de un lenguaje de scriping muy potente debido a su profunda integración con el sistema operativo, lo que le permite realizar una gran cantidad de operaciones sin necesidad de dependencias externas y sin consumir muchos recursos; por este mismo motivo, resulta ser el lenguaje de scripting más extendido, ya que se encuentra en la base de muchos sistemas Linux, y es el lenguaje de scripting por defecto en la mayoría de sus distribuciones.

Cuenta con los elementos de cualquier lenguaje de programación, como variables, bucles, condicionales, funciones, etc; además de una gran cantidad de comandos integrados que le permiten realizar operaciones de forma muy eficiente.


## Componentes del lenguaje Bash

### Shebang

El *shebang* es la primera línea de un script, y se utiliza para indicar al sistema operativo qué intérprete debe utilizar para ejecutar el script.

Por ejemplo, si queremos que el script se ejecute con Bash, la primera línea del script debe ser:

```bash
#!/bin/bash
```

> **Nota**  
> El *shebang* es un comentario para Bash, por lo que no se ejecuta como parte del script.

Existen varios intérpretes de Bash, como `bash`, `sh`, `dash`, `zsh`, etc; por lo que es importante indicar el intérprete correcto en el *shebang*.

> **Nota**  
> Python, al ser un lenguaje de script, también puede utilizar *shebangs* para indicar el intérprete que debe utilizar para ejecutar el script.
> 
> Por ejemplo, si queremos que el script se ejecute con Python 3, la primera línea del script debe ser:
>
> ```python
> #!/usr/bin/env python3
> ```

### Comentarios

Los comentarios son líneas que se ignoran al ejecutar el script, y se utilizan para documentar el código.

En Bash, los comentarios se indican con el símbolo `#`, y se pueden utilizar tanto en una línea como en varias líneas.

```bash
#!/bin/bash

# Esto es un comentario de una sola línea

echo "Hola mundo"   # Comentario al final de una línea

# Esto es un comentario de varias líneas;
# y pueden comentarse incluso líneas
#
# vacías.
```


### Variables

Las variables son elementos que se utilizan para almacenar información, y se pueden utilizar para almacenar cualquier tipo de dato.


#### Definición y uso de variables

Las variables de Bash **no tienen tipo**, por lo que se pueden utilizar para almacenar cualquier dato.

Las variables se definen usando el símbolo `=` y pueden ser de 2 tipos:

- **Local**: solo se pueden utilizar dentro de la función o script donde se definen.
- **Global**: se pueden utilizar en cualquier parte del script una vez definidas.

> **Nota**  
> Cabe destacar que es muy importante no dejar espacios entre el nombre de la variable, el símbolo `=` y el valor de la variable; Bash es un lenguaje muy sensible a su sintaxis y un simple espacio puede provocar errores muy difíciles de depurar.

```bash
#!/bin/bash

function saludar() {
    local nombre="Homer"    # Definición de variable local

    echo "Hola $nombre"
}


function despedir() {
    echo "Adiós $nombre"    # Acceso de la variable global
}

nombre="Galán"              # Definición de variable global

echo "Buenas tardes $nombre"

saludar
despedir
```

El resultado de ejecutar el script anterior sería:

```text
Buenas tardes Galán
Hola Homer
Adiós Galán
```

Este ejemplo muestra 2 variables que se llaman `nombre`, pero una definida localmente dentro de una función y otra definida globalmente al estar fuera de todas las funciones. Sabiendo que un script se ejecuta de forma secuencial (es decir, desde el inicio del fichero hasta el final), está ocurriendo lo siguiente:

1. Se define la función `saludar()` con la variable `nombre` (local, porque está dentro de `saludar()`).
2. Se define la variable `nombre` (global, porque está fuera de las funciones).
3. Se ejecuta el comando `echo` para mostrar el valor de la variable `nombre` (toma el valor global).
4. Se ejecuta `saludar()`, mostrando que `nombre` tiene un valor diferente (exclusivo para el interior de esa función).
5. Se ejecuta `despedir()`, mostrando que `nombre` tiene el valor global (porque no se definió localmente ningún valor).


#### Variables de entorno

Las variables de entorno son variables globales que se utilizan para almacenar información sobre el entorno del sistema operativo, como el nombre del usuario, la ruta del directorio de trabajo, etc.

Estas variables se pueden utilizar en cualquier script, y se pueden consultar con los comandos `env` o `printenv`; algunas de las más comunes son:

- `HOME`: ruta del directorio de trabajo del usuario.
- `PATH`: ruta de los directorios donde se encuentran los comandos.
- `PWD`: ruta del directorio de trabajo actual.
- `USER`: nombre del usuario.
- `SHELL`: ruta del intérprete de comandos.

```bash
#!/bin/bash

echo "Hola $USER, tu directorio de trabajo es $HOME"
echo "Estás utilizando el intérprete $SHELL"
echo "Ahora mismo te encuentras en $PWD"
echo "Esta es tu variable PATH: $PATH"
```

##### `export` y `unset`

El comando `export` se utiliza para definir variables de entorno.

- Usado en la terminal, define la variable de entorno para la sesión actual.
- Usado en un script, define la variable de entorno para el script actual.

El comando `unset` se utiliza para eliminar variables de entorno.

- Usado en la terminal, elimina la variable de entorno para la sesión actual.
- Usado en un script, elimina la variable de entorno para el script actual.


#### Variables especiales

Bash tiene una serie de variables especiales que se utilizan para almacenar información sobre el entorno de ejecución del script.

Estas variables se pueden utilizar en cualquier script, y se pueden consultar con el comando `set`; algunas de las más comunes son:

- `$0`: nombre del script.
- `$1`, `$2`, `$3`, ...: parámetros 1, 2, 3, ... del script, respectivamente.
- `$#`: número de parámetros del script.
- `$?`: código de salida del último comando ejecutado.
- `$@`: lista con todos los parámetros del script.
- `$*`: lista con todos los parámetros del script, como una sola cadena.

```bash
#!/bin/bash

echo "Nombre del script           : $0"
echo "Número de parámetros        : $#"
echo "Parámetros recibidos        : $@"
echo "Primer parámetro            : $1"
echo "Segundo parámetro           : $2"
echo "Tercer parámetro            : $3"
echo "Salida del comando anterior : $?"
echo "Parámetros recibidos        : $*"
```

El resultado de ejecutar el script anterior sería:

```text
$ ./main.sh "uno dos" tres 15

Nombre del script           : ./main.sh
Número de parámetros        : 3
Parámetros recibidos        : uno dos tres 15
Primer parámetro            : uno dos
Segundo parámetro           : tres
Tercer parámetro            : 15
Salida del comando anterior : 0
Parámetros recibidos        : uno dos tres 15
```

### Comillas

Las comillas se utilizan para indicar que un texto es una cadena de caracteres, y no un comando o una variable. Sin emabrgo, en Bash existen 3 tipos de comillas que se utilizan para diferentes propósitos:

- `'`: indica que el texto es una cadena de caracteres, y no se debe interpretar nada.
- `"`: indica que el texto es una cadena de caracteres, pero se deben interpretar las variables.
- <code>\`</code> o `$()`: indica que el texto es un comando, y se debe ejecutar.

```bash
#!/bin/bash

echo "Hola $USER, tu directorio de trabajo es: $HOME"   # Comillas dobles
echo 'Hola $USER, tu directorio de trabajo es: $HOME'   # Comillas simples
echo "Hola $USER, tu directorio de trabajo es: `pwd`"   # Comillas invertidas (ejecución)
echo "Hola $USER, tu directorio de trabajo es: $(pwd)"  # Ejecución de un comando
```

El resultado de ejecutar el script anterior sería:

```text
Hola srgalan, tu directorio de trabajo es: /home/srgalan
Hola $USER, tu directorio de trabajo es: $HOME
Hola srgalan, tu directorio de trabajo es: /home/srgalan
Hola srgalan, tu directorio de trabajo es: /home/srgalan
```

### Operadores aritméticos

Bash permite realizar operaciones aritméticas con los siguientes operadores:

- `+`: suma.
- `-`: resta.
- `*`: multiplicación.
- `/`: división.

No existen operadores más complejos como potencias, raíces... como ocurre en otros lenguajes; para realizar operaciones más complejas, se puede utilizar el comando `bc` (calculadora de Bash).


### Operadores lógicos

Los operadores lógicos son aquellos que se utilizan para evaluar expresiones o condiciones, y devuelven un valor de salida que indica si la expresión es verdadera o falsa.

Una condición se considera verdadera cuando su valor de salida es `0` o `true`; y se considera falsa cuando su valor de salida es `1` o `false`.

> **Nota**:  
> Algunos lenguajes de programación manejan estos valores al revés.


#### Estructuras condicionales o de control

Estas estructuras se utilizan para controlar el flujo de ejecución de un script, ejecutando bloques de código determinados en función de una o varias condiciones.


##### IF, ELSE y ELIF

El condicional `if` se utiliza para evaluar una expresión o condición y ejecutar un bloque de código cuando esta es verdadera.

Este es un ejemplo con varias combinaciones:

```bash
#!/bin/bash

# IF simple, una sola condición
if [ 1 -eq $2 ]; then
    echo "El segundo parámetro es un 1."        # La condición es verdadera
fi

# IF-ELSE, dos condiciones
if [ 10 -ne $2 ]; then
    echo "El segundo parámetro no es un 10."    # La condición es verdadera
else
    echo "El segundo parámetro es un 10."       # La condición es falsa
fi

# IF-ELIF-ELSE, múltiples condiciones (aquí son 3)
if [ 'a' == $3 ]; then
    echo "El tercer parámetro es una a."        # La 1ª condición es verdadera
elif [ 'b' == $3 ]; then
    echo "El tercer parámetro es una b."        # La 1ª es falsa, pero la 2ª es verdadera
else
    echo "El tercer parámetro no es ni una a ni una b."     # Ninguna es verdadera
fi
```

> **Nota**  
> Pueden encadenarse tantos `elif` como se quiera, pero solo puede haber un `if`/`fi` y un `else`.

Las condiciones pueden describirse usando las siguientes sintaxis y todas hacen lo mismo:

- `test condición`: es el comando más antiguo.
- `[ condición ]`: es una versión mejorada de `test`.
- `[[ condición ]]`: es la versión más moderna, actualmente es la más utilizada y la más recomendable.

> **Nota**  
> Observa que en todos los casos se mantienen los espacios en la sintaxis.

Por otra parte, también hay que hablar de los *flags* o los operadores que se utilizan para comprobar las condiciones:

- `-eq` o `==`: dos elementos son iguales.
- `-ne` o `!=`: dos elementos son diferentes.
- `-gt` o `>`: el primer elemento es mayor que el segundo.
- `-ge` o `>=`: el primer elemento es mayor o igual que el segundo.
- `-lt` o `<`: el primer elemento es menor que el segundo.
- `-le` o `<=`: el primer elemento es menor o igual que el segundo.
- `-z`: el elemento es una cadena vacía.
- `-n`: el elemento es una cadena no vacía.


##### CASE

El condicional `case` se utiliza para realizar múltiples comparaciones en una variable y ejecutar acciones en función del resultado; resulta útil cuando se desea comprobar una variable contra varios patrones diferentes.

Este es un ejemplo con varias combinaciones:

```bash
#!/bin/bash

# CASE simple, una sola condición
case $1 in
    1)
        echo "El primer parámetro es un 1."     # La condición es verdadera
        ;;
esac

# CASE con múltiples condiciones
case $2 in
    10)
        echo "El segundo parámetro es un 10."   # La 1ª condición es verdadera
        ;;
    20)
        echo "El segundo parámetro es un 20."   # La 1ª es falsa, pero la 2ª es verdadera
        ;;
    *)
        echo "El segundo parámetro no es ni un 10 ni un 20."    # Ninguna es verdadera
        ;;
esac
```

> **Nota**  
> Pueden encadenarse tantos `)` como se quiera, pero solo puede haber un `case`/`esac`.

Aquí solo pueden hacerse 2 tipos de comprobaciones:

- Una variable coincide con un patrón/valor concreto.
- Una variable no coincide con ningún patrón valor.

Las condiciones pueden describirse usando las siguientes sintaxis:

- `patrón)`: la variable coincide con el patrón.
- `patrón1|...)`: la variable coincide con alguno de los patrones.
- `*)`: la variable no coincide con ninguno de los patrones.
- `;;`: la ejecución del `case` finaliza.

> **Nota**  
> Se puede hacer una comprobación y ejecución de varios patrones consecutivos si no se utilizara `;;`.
>
> Es decir, cuando una variable coincide con un patrón, ejecuta ese bloque de código y si no hay un `;;`, pasará a comprobar el siguiente patrón, y así sucesivamente hasta que encuentre un `;;` o llegue al final del `case` (se encuentre con `esac`).


#### Bucles

Estas estructuras se utilizan para repetir un bloque de código un número de veces determinado o mientras se cumpla una condición.

##### FOR

Este bucle se utiliza para ejecutar un bloque de código un número de veces.

```bash
#!/bin/bash

# FOR simple, una sola condición
for i in {1..5}; do
    echo "El valor de i es $i."     # Se ejecuta 5 veces
done

# FOR con múltiples condiciones
for i in {1..5}; do
    echo "El valor de i es $i."     # Se ejecuta 5 veces
    if [ $i -eq 3 ]; then
        break                       # Se ejecuta 3 veces
    fi
done
```

---

# Laboratorio

Este laboratorio consiste en un entorno Debian con varios usuarios y grupos creados, así como varios ficheros con diferentes permisos.

El objetivo es que puedas practicar con Bash, teniendo todo un entorno Linux a tu disposición con el que experimentar.

Este entorno contiene los siguientes usuarios:

- `root`, superusuario.
- `user`, usuario normal. 
- `homer`, usuario normal y miembro del grupo `simpsons`.
- `marge`, usuario normal y miembro del grupo `simpsons`.
- `bart`, usuario normal y miembro del grupo `simpsons`.
- `lisa`, usuario normal y miembro del grupo `simpsons`.

La contraseña de cada usuario es el nombre del usuario.



# Referencias

Enlaces útiles de los que se obtuvieron información.
