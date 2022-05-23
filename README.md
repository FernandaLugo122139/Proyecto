# Código malicioso aplicando al secuestro de datos
Equipo B 2.0

García Lugo María Fernanda

Méndez Larios Emilio

Rivas Gutierrez Carlos Andres

Villegas Aguilar Carlos

# Bibliotecas 
Se tienen las librerías básicas stdlib.h, stdio.h, y string.h para el manejo de cadenas, sin embargo, se han agregado unas nuevas que serían sys/types.h y dirent.h que sirven para manejar directorios, abrirlos, recorrerlos y tener acceso a su estructura tipo dirent que contiene la información del directorio. También, se cuenta con stat.h que ayuda con una estructura tipo stat para obtener la información del archivo. Se debe incluir de igual forma la librería fcntl.h para poder elegir el modo de apertura de los archivos y manejar el DescriptorFile. La biblioteca unistd.h es la biblioteca estándar para utilizar funciones de los sistemas operativos basados en Unix, en este caso, serían aquellas como read, close y write que permiten el manejo de archivos a bajo nivel. Por último, contamos con time.h que  ayuda a programar el momento de ejecución del código y a errno.h para que en el caso de tener errores poder usar sus constantes y ver el motivo del error.

# Malware
Código que se encarga de la encriptación y activación del malware. Se divide en main y dos funciones, las cuales son recorrerDirectorio y leeArchivo. 
En el main se consigue la hora y fecha actual del sistema y se define en qué momento se requiere el inicio de ejecución. Se define la ruta del directorio principal (Documentos) y se obtiene el apuntador al directorio para enviarlo a la función recorrerDirectorio. Dentro de la función recorrerDirectorio se establece el ciclo que recorre cada una de las entradas, en donde con la función readdir de acuerdo con el apuntador que se le envía se obtienen las estructuras tipo dirent y de esta forma se recorre el directorio, hasta llegar a Null.Si el tipo de entrada es un directorio, se aplica recursividad. En el caso de que la entrada sea un archivo, se define la ruta y se manda a la función leeArchivo.La función leeArchivo va a ser la encargada de encriptar los datos que contienen los archivos. Se abre el archivo en modo lectura para poder guardar la información, posteriormente se aplica el algortimo de encriptación, el cual es un XOR con un número que sirve como llave de encriptación y finalmente se sobreescribe en el archivo original los datos encriptados. 


# MakeFile
Archivo que realiza la compilación de Malware.c. Este archivo consiste en la definición de la macros, en donde se establece el compilador y las banderas del compilador. Se establece "Proyecto" como nombre del ejecutable, se crean los archivos con extensión .o a partir de los archivos con extesión .c y se agrega una sección para remover los archivos generados anteriormente por la compilación en el caso de requerirlo. 
