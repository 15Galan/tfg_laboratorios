# Introducción al OSINT

OSINT (_**O**pen **S**ource **Int**elligence_) es una disciplina que se encarga de recolectar información de fuentes abiertas; es decir, información que se encuentra disponible para el público en general. Esta información puede ser utilizada para realizar análisis de seguridad, inteligencia de negocios, análisis de riesgos, etc.

Esta disciplina se ha utilizado desde hace mucho tiempo, pero con el auge de las redes sociales y la facilidad de acceso a la información, se ha vuelto mucho más popular.

> **Nota**  
> Existen diferentes inteligencias además de OSINT, como las siguientes:
>
> - **HUMINT** (_**Hum**an **Int**elligence_): información obtenida por medio de personas (agentes, informadores...).
> - **SIGINT** (_**Sig**nals **Int**elligence_): información obtenida por medio de señales (telefonía, radiofrecuencia...).
> - **IMINT** (_**Im**agery **Int**elligence_): información obtenida por medio de imágenes (satélites, videovigilancia, drones...).
> - **MASINT** (_**Mas**sive **Int**elligence_): información obtenida por medio de sensores (sonares, radares...).

## Herramientas útiles

### Google Dorks

El buscador de Google es una herramienta muy útil para realizar búsquedas de información, pero también es posible utilizarlo para realizar búsquedas más específicas; para ello, se pueden utilizar los llamados *Google Dorks*, que son cadenas de búsqueda que permiten filtrar los resultados de búsqueda.

Estos son algunos de los operadores más utilizados:

| Operador      | Descripción                                                                |
| ------------- | -------------------------------------------------------------------------- |
| `""`          | Valor literal                                                              |
| `site:`       | Filtro para el dominio                                                     |
| `filetype:`   | Filtro para el tipo de un archivo (su extensión)                           |
| `ext:`        | Filtro para el tipo de un archivo (su extensión)                           |
| `inurl:`      | Busca una palabra en una URL del sitio                                     |
| `intext:`     | Busca una palabra en los resultados de una página del sitio                |
| `intitle:`    | Busca una palabra en el título de una página del sitio                     |
| `allinurl:`   | Busca todas las palabras en una URL del sitio                              |
| `allintext:`  | Busca todas las palabras en los resultados de una página del sitio         |
| `allintitle:` | Busca todas las palabras en el título de una página del sitio              |
| `-`           | Simbolo de exclusión, excluye de los resultados lo que vaya a continuación |
| `*`           | Símbolo de comodín, representa *cualquier palabra*                         |
| `cache:`      | Mostrará la versión en caché de la web en cuestión                         |
| `OR`          | Operador lógico, también se puede representar por `\`                      |
| `AND`         | Operador lógico, normalmente se deja el espacio en blanco                  |

#### Ejemplos

"Documentos PDF del gobierno considerados como confidenciales."

```text
site:gov filetype:pdf allintitle:restricted
```

- `site:gov`: filtro para el dominio; dominio del gobierno.
- `filetype:pdf`: filtro para el tipo de archivo; documentos PDF.
- `allintitle:restricted`: filtro para el título de la página; contiene la palabra *restricted*.

> **Ejemplo**  
> El primer resultado de [la aplicación de este *dork*](https://www.google.com/search?q=site%3Agov+filetype%3Apdf+allintitle%3Arestricted&sxsrf=AB5stBhWGj9DrI6nj9KhkI6a85jcMG2sdQ%3A1689199828948&source=hp&ei=1CSvZN2uN4yRkdUPmqu_oAM&iflsig=AD69kcEAAAAAZK8y5DM5XOXwcnI3pqbPxP6RxDy8Elup&ved=0ahUKEwjd6Ibel4qAAxWMSKQEHZrVDzQQ4dUDCAs&uact=5&oq=site%3Agov+filetype%3Apdf+allintitle%3Arestricted&gs_lcp=Cgdnd3Mtd2l6EAM6BwgjEOoCECdQiAJYiAJg8gRoAXAAeACAAVaIAVaSAQExmAEAoAECoAEBsAEK&sclient=gws-wiz) ya es un documento confidencial.

"Brecha de alguna página que contenga un usuario y contraseña determinados."

```text
filetype:txt site:example.com password|passwords|contraseña|contraseñas|login
```

- `filetype:txt`: filtro para el tipo de archivo; texto plano.
- `site:example.com`: filtro para el dominio; el sitio [example.com](https://example.com).
- `password| ... |login`: filtro para el contenido; contiene las palabras *password(s)*, *contraseña(s)* o *login*.

"Documentos que contengan la palabra *confidencial*."

```text
inurl:webkeyword filetype:doc confidencial
```

- `inurl:webkeyword`: filtro para la URL; contiene la palabra *webkeyword*.
- `filetype:doc`: filtro para el tipo de archivo; Microsoft Word.
- `confidencial`: filtro para el contenido; contiene la palabra *confidencial*.

"Feeds de cámaras de seguridad."

```text
inurl:"ViewerFrame?Mode="
```

- `inurl:"ViewerFrame?Mode="`: filtro para la URL; contiene la cadena *ViewerFrame?Mode=* (ya que es una cadena que muchas cámaras sueñen utilizar).

Por último, cabe destacar que, al igual que en otros campos de la ciberseguridad, ser ingenioso marcará la diferencia para sacarle más provecho a esta herramienta.

![Diana](https://i0.wp.com/i.postimg.cc/xjRk8mcy/Diana-Dorks.jpg?w=696&ssl=1)

### Shodan.io

[Shodan.io](https://www.shodan.io) es un motor de búsqueda que, al contrario de los motores de búsqueda habituales, no indexa páginas web, sino que rastrea y almacena información sobre dispositivos como servidores, cámaras IP, enrutadores, sistemas de control industrial, dispositivos médicos y una amplia variedad de otros dispositivos que se encuentran conectados a Internet.

Su objetivo principal es proporcionar a los investigadores de seguridad, profesionales de la red y curiosos, acceso a información detallada sobre estos dispositivos: Shodan.io almacena metadatos e información técnica sobre los dispositivos, como puertos abiertos, servicios en ejecución, versiones de software, configuraciones predeterminadas... y en algunos casos, incluso datos sensibles (que podrían ser accesibles públicamente).

Esta plataforma permite a los usuarios buscar dispositivos y servicios específicos utilizando una variedad de filtros y operadores avanzados, dando un gran control sobre la información a sus usuarios.

Además, cuenta con una API pública que permite a los usuarios construir sus propias funcionalidades sobre la base de la información que proporciona Shodan.io.

> **Ejemplo**  
> [Esta búsqueda](https://www.shodan.io/host/191.252.201.137) muestra un caso real de una cámara de seguridad que se encuentra en Brasil, donde es posible visualizar la información del dispositivo, de la IP, los puertos abiertos y CVEs.

### VirusTotal

[VirusTotal](https://www.virustotal.com/gui/home/upload) es una plataforma de análisis de malware y servicio de inteligencia de amenazas basado en la web, que proporciona a los usuarios la capacidad de enviar archivos y direcciones URL sospechosos para su escaneo y análisis.

Cuando se envía un archivo o URL, se somete a un escaneo utilizando una amplia variedad de motores antivirus y herramientas de análisis de malware; estos motores son proporcionados por diferentes empresas de seguridad, lo que permite obtener una visión general de cómo se detecta el archivo o la URL en diferentes productos antivirus y herramientas de seguridad.

VirusTotal recopila y comparte información relevante sobre los archivos y URL analizados de manera anónima, lo que incluye metadatos, características del archivo, resultados de escaneos antivirus, entre otros; esto hace que se convierta en una gran fuente de información para realizar OSINT y contrastar datos.

Además, también proporciona una API, por lo que es posible generar análisis de forma más cómoda.

### WHOIS

[WHOIS](https://who.is) es un protocolo de consulta y respuesta que se utiliza para consultar una base de datos que permite determinar el propietario de un nombre de dominio o una dirección IP en Internet.

# Laboratorio

> **Credenciales**  
> - `root:root`.

Este entorno presenta un proyecto de Python con el que extraer información de una IP de varias fuentes de información, entre las que se encuentran Shodan, VirusTotal y WHOIS.

El proyecto consiste en una interfaz de línea de comandos que permite al usuario introducir una IP o una lista de IPs (en un archivo de texto) y obtener información de cada una de ellas usando las fuentes mencionadas, entre otras.

> **Nota**  
> La información de Shodan.io y VirusTotal se obtiene a través de sus APIs públicas, por lo que es necesario tener una cuenta en cada una de ellas y obtener una clave de API para poder usarlas.
>
> No usar una clave no afectará al programa más allá de no usar esas 2 fuentes de información.


# Referencias

- [Google Dorking, ¿qué es?](https://derechodelared.com/google-dorking-que-es)
- [Tutorial de Google Hacking en Español](https://www.youtube.com/watch?v=VYf5f2MTMSw)
- [Google Hacking Database](https://www.exploit-db.com/google-hacking-database)
- [Shodan (website)](https://en.wikipedia.org/wiki/Shodan_(website))
- [WhoisXMLAPI](https://whois.whoisxmlapi.com)
- [sherlock-project/sherlock](https://github.com/sherlock-project/sherlock)
