# Código malicioso aplicando al secuestro de datos
Equipo B 2.0

García Lugo María Fernanda

Méndez Larios Emilio

Rivas Gutierrez Carlos Andres

Villegas Aguilar Carlos

# Bibliotecas 
Se tienen las librerías básicas stdlib.h, stdio.h, y string.h para el manejo de cadenas, sin embargo, se han agregado unas nuevas que serían sys/types y dirent.h que sirven para manejar directorios, abrirlos, recorrerlos y tener acceso a su estructura tipo dirent que contiene la información del directorio. También, se cuenta con stat.h que ayuda con una estructura tipo stat para obtener la información del archivo. Se debe incluir de igual forma la librería fcntl.h para poder elegir el modo de apertura de los archivos y manejar el DescriptorFile. La biblioteca unistd.h es la biblioteca estándar para utilizar funciones de los sistemas operativos basados en Unix, en este caso, serían aquellas como read, close y write que permiten el manejo de archivos a bajo nivel. Por último, contamos con time.h que  ayuda a programar el momento de ejecución del código y a errno.h para que en el caso de tener errores poder usar sus constantes y ver el motivo del error. 

# Malware

# MakeFile
