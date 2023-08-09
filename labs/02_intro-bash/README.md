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

Este ejemplo muestra 2 variables que se llaman `nombre`, pero una definida localmente dentro de una función y otra definida globalmente al estar fuera de todas las funciones; en el ejemplo anterior está ocurriendo lo siguiente:

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


### Operadores

Los operadores son elementos del lenguaje que se utilizan para realizar operaciones sobre variables y valores.

Estas operaciones pueden ser aritméticas, lógicas, de comparación, etc.


#### Aritméticos

Bash permite realizar operaciones aritméticas con los siguientes operadores:

- `+`: suma.
- `-`: resta.
- `*`: multiplicación.
- `/`: división.
- `%`: módulo (resto de la división).

No existen operadores más complejos como potencias, raíces... como ocurre en otros lenguajes; para realizar operaciones más complejas, se puede utilizar el comando `bc` (calculadora de Bash).


#### Lógicos

Los operadores lógicos son aquellos que se utilizan para evaluar expresiones o condiciones, y devuelven un valor de salida que indica si la expresión es verdadera o falsa.

Una condición se considera verdadera cuando su valor de salida es `0` o `true`; y se considera falsa cuando su valor de salida es `1` o `false`.

> **Nota**:  
> Algunos lenguajes de programación manejan estos valores al revés.


### Estructuras condicionales o de control

Estas estructuras se utilizan para controlar el flujo de ejecución de un script, ejecutando bloques de código determinados en función de una o varias condiciones.


#### IF, ELSE y ELIF

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
- `-a` o `&&`: dos condiciones son verdaderas (*AND*).
- `-o` o `||`: al menos una de dos condiciones es verdadera (*OR*).
- `-z`: el elemento es una cadena vacía.
- `-n`: el elemento es una cadena no vacía.

> **Nota**  
> Existen muchas más opciones además de las mostradas; por ejemplo:
> - `-f`: el elemento es un fichero.
> - `-d`: el elemento es un directorio.
> - `-r`: el elemento tiene permisos de lectura.
> - `-w`: el elemento tiene permisos de escritura.
> - `-x`: el elemento tiene permisos de ejecución.
> - `-s`: el elemento tiene un tamaño mayor que cero.
> - `-e`: el elemento existe.
> - `-h`: el elemento es un enlace simbólico.
> - (...)


#### CASE

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


### Bucles

Estas estructuras se utilizan para repetir un bloque de código un número de veces determinado o mientras se cumpla una condición.

#### FOR

Este bucle se utiliza para ejecutar un bloque de código un número de veces.

```bash
#!/bin/bash

# FOR que itera una lista de números
for i in {1..5}; do
    echo "El valor de i es $i."     # Se ejecuta 5 veces
done

# FOR que itera sobre una variable
for ((i=0;i<=15;i++)); do
    echo "El valor de i es $i."     # Se ejecuta 15 veces

    if [ $i -eq 5]; then
        echo "Progreso al 33 %."    # Se ejecuta 1 vez
    elif [ $i -eq 10]; then
        echo "Progreso al 66 %."    # Se ejecuta 1 vez
    elif [ $i -eq 15]; then
        echo "Progreso al 100 %."   # Se ejecuta 1 vez
    fi
done
```

El bucle `for` tiene 2 formas de iterar:

**`for elemento in conjunto`**: itera sobre un conjunto de elementos, donde:

- `conjunto`: cualquier objeto que contenga varios valores.
- `elemento`: variable que toma cada elemento del `conjunto` por cada iteración.

> **Nota**  
> Esto se le conoce como *for-each* en otros lenguajes de programación.

**`for ((inicio;condición;operación))`**: itera mientras se cumpla una condición, donde:

- `inicio`: define la variable contador del bucle, así como su valor inicial.
- `condición`: condición que produce una iteración del bucle mientras se cumpla.
- `operación`: modificación de la variable contador al final de cada iteración.


#### WHILE y UNTIL

Estos bucles se utilizan para ejecutar un bloque de código mientras se cumpla una condición; ambos casos son opuestos:

- `while`: ejecuta el bloque de código mientras se cumpla la condición.
- `until`: ejecuta el bloque de código hasta que se cumpla la condición.

> **Nota**  
> Observa como `until` equivale a *ejecuta el bloque de código mientras no se cumpla la condición*; lo que se correspondería con un `while` con la condición negada.

```bash
#!/bin/bash

# WHILE que itera mientras se cumple una condición
i=0

while [ $i -lt 5 ]; do
    echo "El valor de i es $i."     # Se ejecuta 5 veces

    i=$((i+1))
done

# UNTIL que itera hasta que se cumple una condición
i=0

until [ $i -eq 5 ]; do
    echo "El valor de i es $i."     # Se ejecuta 5 veces

    i=$((i+1))
done
```

Al contrario de lo que sucede con el bucle `for`, tanto `while` como `until` solo comprueban una condición, por lo que es necesario:

- Definir una variable contador antes de entrar en el bucle.
- Actualizar la variable contador al final del bucle.

> **Nota**  
> Si esto no se realiza correctamente, pueden suceder fallos graves como bucles infinitos.


#### Saltos

Existen 2 palabras reservadas especiales para alterar el funcionamiento de un bucle:

- `break`: finaliza la ejecución del bucle.
- `continue`: finaliza la iteración actual y pasa a la siguiente.

```bash
#!/bin/bash

letras='a b c d e f g h i j k l m n o p q r s t u v w x y z'

# FOR que itera una lista de números
for i in $letras; do
    echo "El valor de i es $i."     # Se ejecuta 5 veces (por la condición inferior)

    if [ $i -eq 'e' ]; then
        break                       # Finaliza el bucle cuando la letra es 'e'
    fi
done

# FOR que itera una lista de números
for i in $letras; do
    if [ $i -eq 'l' ]; then
        continue                    # Salta la iteración cuando la letra es 'l'
    fi

    echo "El valor de i es $i."     # Se ejecuta 25 veces (por la condición superior)
done
```

> **Nota**  
> Observa como `break` y `continue` solo afectan al bucle en el que se encuentran, por lo que si se utilizan dentro de un bucle anidado, solo afectarán a ese bucle.


### Funciones

Las funciones son bloques de código que se pueden ejecutar desde cualquier parte del script.

Resultan muy útiles para reutilizar código, ya que se puede ejecutar el mismo bloque de código desde diferentes partes del script; también es una buena forma de estructurar el código, ya que se pueden definir funciones para realizar tareas concretas y por otro lado, modularizar el código lo hace más legible y cómodo de mantener.

Las funciones pueden recibir parámetros, que se pueden utilizar dentro de la función como si fueran variables; y del mismo modo, una función puede devolver un valor, que se puede utilizar fuera de la función.

- Los parámetros se reciben usando las variables especiales vistas anteriormente (`$1`, `$2`, etc.), ya que las funciones se usan con la misma sintaxis que los comandos.
- Los valores se devuelven con el comando `echo`, que se puede capturar con la sintaxis `$(funcion)` fuera de la función.

> **Nota**  
> Una función puede recibir una cantidad infinita de parámetros y, al contrario que en otros lenguajes de programación, no se especifican en la definición de la función.

```bash
#!/bin/bash

# Muestra la hora del sistema
function mostrar_hora {
    date +%H:%M:%S
}

# Muestra la fecha del sistema
function mostrar_fecha {
    date +%d/%m/%Y
}

# Muestra la hora y la fecha del sistema
function mostrar_hora_fecha {
    echo "Hoy es $(mostrar_fecha) y son las $(mostrar_hora)."
}

# Recibe una lista de números y devuelve el mayor
function mayor {
    local mayor=0

    for i in $@; do
        if [ $i -gt $mayor ]; then
            mayor=$i
        fi
    done

    echo $mayor
}

numeros='1 3 2 8 9 4 3 5 6 7 1 9 2 6 9'
echo "Mensaje de bienvenida: $(mostrar_hora_fecha)."
echo "Sean $numeros los números a evaluar, el mayor es $(mayor $numeros).
```

La salida de este script sería:

```text
Mensaje de bienvenida: Hoy es 20/10/2019 y son las 20:10:00.
Sean 1 3 2 8 9 4 3 5 6 7 1 9 2 6 9 los números a evaluar, el mayor es 9.
```

> **Nota**  
> Bash permite definir las funciones en cualquier lugar del script, pero es una buena práctica definirlas al inicio para que sea más fácil encontrarlas y gestionarlas; no es demasiado agradable leer scripts desordenados.


### Arrays

Los arrays son variables especiales que permiten almacenar varios valores en una misma variable.

Los arrays se pueden definir de 2 formas:

- `array=(valor1 valor2 valor3)`: se definen los valores del array entre paréntesis y separados por espacios.
- `array=([0]=valor1 [1]=valor2 [2]=valor3)`: se definen los valores del array entre paréntesis y separados por espacios, pero se puede especificar el índice de cada valor.

> **Nota**  
> Al igual que en muchos lenguajes de programación, los índices de los arrays empiezan en 0.

Estas son las distintas operaciones disponibles para el manejo de arrays:

|              Operación               | Descripción                                                                        |
|:------------------------------------:| ---------------------------------------------------------------------------------- |
|            `${array[@]}`             | Devuelve todos los valores del array, separado por espacios.                       |
|            `${array[i]}`             | Devuelve el valor del array en la posición **i**.                                  |
|            `${#array[@]}`            | Devuelve la longitud del array (número de elementos).                              |
|            `${#array[i]}`            | Devuelve la longitud del elemento **i** del array.                                 |
|           `${array[@]:i}`            | Devuelve todos los elementos del array, a partir de la posición **i**.             |
|          `${array[@]:i:n}`           | Devuelve los **n** siguientes elementos del array, a partir de la posición **i**.  |
|   `${array[@]/patrón/sustitución}`   | Devuelve todos los elementos del array, reemplazando el patrón por la sustitución. |
|         `${array[@]#patrón}`         | Devuelve todos los elementos del array, eliminando el patrón por la izquierda.     |
|         `${array[@]%patrón}`         | Devuelve todos los elementos del array, eliminando el patrón por la derecha.       |
|    `array=(elemento ${array[@]})`    | Añade un elemento al inicio del array.                                             |
|    `array=(${array[@]} elemento)`    | Añade un elemento al final del array.                                              |
|           `unset array[i]`           | Elimina el elemento **i** del array.                                               |
|            `unset array`             | Elimina el array.                                                                  |
| `array3=(${array1[@]} ${array2[@]})` | Concatena los arrays **array1** y **array2** en el array **array3**.               |

> **Nota**  
> Las operaciones con `patrón` y `sustitución` hacen referencias a **expresiones regulares**.

```bash
#!/bin/bash

# Definición de arrays
array1=("uno" "dos" "tres" "cuatro" "cinco" "seis" "siete" "ocho" "nueve" "diez")
array2='95 96 97 98 99'

# Presentación de los arrays
echo "array1        : ${array1[@]}"         # Todos los elementos del array1
echo "array2        : ${array2[@]}"         # Todos los elementos del array2
echo

# Operaciones básicas
echo "array1[3]     : ${array1[3]}"         # El elemento 3 del array1
echo "#array1[@]    : ${#array1[@]}"        # Longitud del array1
echo "#array1[3]    : ${#array1[3]}"        # Longitud del elemento 3 del array1
echo "array1[@]:2   : ${array1[@]:2}"       # Elementos del array1 a partir del elemento 2
echo "array1[@]:2:3 : ${array1[@]:2:3}"     # 3 elementos del array1 a partir del elemento 2
echo

# Operaciones avanzadas
echo "array1[@]/dos/nueve : ${array1[@]/dos/nueve}"     # Todos los elementos del array1, reemplazando 'dos' por 'nueve'
echo "array1[@]/nueve/uno : ${array1[@]/nueve/uno}"     # Todos los elementos del array1, reemplazando 'nueve' por 'uno'
echo "array1[@]#dos       : ${array1[@]#dos}"           # Todos los elementos del array1, eliminando 'dos' por la izquierda
echo "array1[@]%dos       : ${array1[@]%dos}"           # Todos los elementos del array1, eliminando 'dos' por la derecha
echo

# Modificaciones de arrays
array1=(0 ${array1[@]})
echo 'array1=(0 ${array1[@]}) :' ${array1[@]}   # Añade un elemento al inicio del array1
array1=(${array1[@]} 6)
echo 'array1=(${array1[@]} 6) :' ${array1[@]}   # Añade un elemento al final del array1
echo
array3=(${array1[@]} ${array2[@]})              # Concatena los arrays array1 y array2
echo 'array3=(${array1[@]} ${array2[@]}) :' ${array3[@]}
echo
unset array1[3]                                 # Elimina el elemento 3 del array1
echo "unset array1[3] : ${array1[@]}"
unset array1                                    # Elimina el array1
echo "unset array1    : ${array1[@]}"
echo
```

### Expresiones regulares (*regex*)

Las expresiones regulares son patrones que se utilizan para buscar y/o reemplazar cadenas de texto.

Estas pueden definirse como `/regex/` o bien, solo `regex`, y estas son las distintas operaciones disponibles para el manejo de expresiones regulares:

| Operación | Descripción                                             |
|:---------:| ------------------------------------------------------- |
|    `^`    | Inicio de línea.                                        |
|    `$`    | Fin de línea.                                           |
|    `.`    | Cualquier carácter.                                     |
|    `*`    | Cero o más repeticiones del carácter anterior.          |
|    `+`    | Una o más repeticiones del carácter anterior.           |
|    `?`    | Cero o una repetición del carácter anterior.            |
|   `[]`    | Cualquier carácter entre los corchetes.                 |
|   `[^]`   | Cualquier carácter que no esté entre los corchetes.     |
|   `()`    | Agrupación de caracteres.                               |
|    `\`    | Caracter de escape.                                     |
|   `\|`    | Operador lógico OR.                                     |
|  `\{n\}`  | Exactamente **n** repeticiones del carácter anterior.   |
| `\{n,\}`  | Al menos **n** repeticiones del carácter anterior.      |
| `\{n,m\}` | Entre **n** y **m** repeticiones del carácter anterior. |

> **Nota**  
> Las expresiones regulares se utilizan en muchos comandos, algunos ejemplos de los más conocidos pueden ser: `grep`, `egrep`, `awk`, `sed`...

Algunos ejemplos de expresiones regulares usando la sintaxis anterior:

|       Expresión regular        | Descripción                                                                         | Ejemplo de cadena detectada       |
|:------------------------------:| ----------------------------------------------------------------------------------- | --------------------------------- |
|              `^a`              | Empieza por la letra **a**.                                                         | "a", "ajo", "altura"              |
|              `a$`              | Acaba por la letra **a**.                                                           | "a", "pila", "altura"             |
|             `^a$`              | Empieza y acaba por la misma letra **a**.                                           | "a"                               |
|             `^a*$`             | Empieza por la letra **a** y termina por cualquier cantidad de **a**.               | "a", "aa", "aaa", "aaaa", "aaaaa" |
|         `^[a-z][0-9]$`         | Empieza por una letra minúscula y acaba por un número.                              | "a1", "z9"                        |
|       `^[a-zA-Z][0-9]$`        | Empieza por una letra y acaba por un número.                                        | "A2", "z9"                        |
|        `^[a-zA-Z0-9]$`         | Empieza y acaba por una letra o un número.                                          | "A", "2", "z"                     |
|        `^[a-zA-Z0-9]*$`        | Empieza y acaba por una letra o un número, con cualquier cantidad de caracteres.    | "abc123", "XYZ789", "123"         |
|          `^(a`\|`b)$`          | Empieza y acaba por la letra **a** o la letra **b**.                                | "a", "b"                          |
| `^(hola`\|`buenas)\ [a-zA-Z]*` | Empieza por "hola" o "buenas" seguido de un espacio y cualquier cantidad de letras. | "hola mundo", "buenas tardes"     |
|          `^0[0-9]+$`           | Empieza por un cero y acaba por un número.                                          | "012345", "09876"                 |
|         `^0[0-9]{2}$`          | Empieza por un cero y acaba por dos números.                                        | "012", "078"                      |
|         `^0[0-9]{2,}$`         | Empieza por un cero y acaba por dos o más números.                                  | "0123", "0987654321"              |


## Entrada/Salida estándar

La entrada/salida estándar es la forma en la que los programas interactúan con el entorno.

- La entrada estándar es la forma en la que los programas reciben información.
- La salida estándar es la forma en la que los programas muestran información.

La entrada/salida estándar puede ser redirigida a ficheros o a otros programas.

### Redirección de la entrada/salida estándar

La redirección de la entrada/salida estándar se realiza mediante los operadores `>` y `<`.

- `>` redirige la salida estándar a un fichero.
- `<` redirige la entrada estándar desde un fichero.

Ejemplos:

```bash
echo "Hola mundo" > fichero.txt
```

```text
$ cat fichero.txt

Hola mundo
```

1. Coloca *"Hola mundo"* en la salida estándar.
2. Redirige la salida estándar al *fichero.txt*.
3. Ahora el *fichero.txt* contiene *"Hola mundo"*.

```bash
wc -l < fichero.txt
```

```text
1
```

1. Coloca el contenido de *fichero.txt* en la entrada estándar.
2. Cuenta el número de líneas de la entrada estándar.
3. Muestra el resultado por la salida estándar.

Por otra parte, también existen los operadores `>>` y `<<`, cuya función es similar a los anteriores, pero en lugar de sobreescribir la entrada/salida, añaden el contenido al final.

Ejemplos:

```bash
echo "Adiós mundo" >> fichero.txt
```

```text
$ cat fichero.txt

Hola mundo
Adiós mundo
```

1. Coloca *"Hola mundo"* en la salida estándar.
2. Redirige la salida estándar al *fichero.txt*.
3. Añade *"Adiós mundo"* al final del *fichero.txt*.


### Tuberías

La redirección de la salida estándar de un programa a la entrada estándar de otro programa se realiza mediante el operador `|`, también llamado *pipe* (o *tubería* en español).

Este operador es muy útil para encadenar programas y realizar tareas complejas.

Ejemplo:

```bash
ls -l | grep "*.sh"
```

1. Ejecuta el comando `ls -l` y muestra el resultado por la salida estándar.
2. Redirige la salida estándar a la entrada estándar del comando `grep "*.sh"`.
3. El comando `grep "*.sh"` filtra las líneas que contienen la cadena de texto `*.sh` (todos los ficheros `.sh`).
4. Se muestran las líneas obtenidas en la terminal.

> **Nota**  
> El comando `grep` es muy útil para filtrar líneas que contienen una cadena de texto.


# Laboratorio

Este laboratorio consiste en un entorno Debian con varios usuarios y grupos creados, así como varios ficheros con diferentes permisos.

El objetivo es que puedas practicar con Bash, teniendo todo un entorno Linux a tu disposición con el que experimentar; puedes programar y probar tus propios scripts, replicar algunos de los ejemplos anteriores o ejecutar algunos scripts del laboratorio.

Este entorno contiene los siguientes usuarios:

- `root`, superusuario.
- `user`, usuario normal. 
- `homer`, usuario normal y miembro del grupo `simpsons`.
- `marge`, usuario normal y miembro del grupo `simpsons`.
- `bart`, usuario normal y miembro del grupo `simpsons`.
- `lisa`, usuario normal y miembro del grupo `simpsons`.

La contraseña de cada usuario es el nombre del usuario.



# Referencias

- [Manual de Bash de GNU](https://www.gnu.org/software/bash/manual/bash.html)
- [Tester de expresiones regulares](https://regex101.com)

