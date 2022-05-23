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
En el main se consigue la hora y fecha actual del sistema y se define en qué momento se requiere el inicio de ejecución. Se tiene un ciclo que nos ayuda a detener la ejecución en donde compara dichos tiempos. Se define la ruta del directorio principal (Documentos) y se obtiene el apuntador al directorio para enviarlo a la función recorrerDirectorio, la cual sirve para recorrer todas las entradas del directorio.

Dentro de la función recorrerDirectorio se establece el ciclo que recorre cada una de las entradas, en donde con la función readdir de acuerdo con el apuntador que se le envía se obtienen las estructuras tipo dirent y de esta forma se recorre el directorio, hasta llegar a Null. Dentro del ciclo primero se válida que la entrada no sea el directorio anterior ni el actual y se pregunta si el tipo de entrada es un directorio ya que en ese momento haremos uso de la recursividad para poder recorrerla,una vez que haya terminado se cierran todos los apuntadores. En el caso de que la entrada sea un archivo, se define la ruta y se manda a la función leeArchivo.

La función leeArchivo va a ser la encargada de encriptar los datos que contienen los archivos. Se abre el archivo con la ruta correspondiente, en solo modo lectura y así obtenemos el descriptorFile, se manda a llamar a la función stat la cual se va a encargar de llenar la estructura tipo stat con la información del archivo, se obtiene el tamaño en bytes del archivo, utilizamos la función read que recibe el descriptorFile, el buffer en donde se van a guardar los datos y cuantos datos se van a leer en bytes , en este caso va a ser todo el archivo. Se cierra el descriptorFile para proseguir a aplicar el algoritmo de encriptación , recorriendo cada uno de los bytes y aplicando un XOR con el número de elección, una vez que se sobreescribe la información en ese buffer se continua a hacerlo en el archivo real, se abre el archivo en modo escritura y se borra su contenido anterior, después utilizando la función write, la cual recibe el descriptorFile, el buffer y el tamaño en bytes a escribir, se dedica a escribir los datos encriptados y se cierra el archivo.


# MakeFile
