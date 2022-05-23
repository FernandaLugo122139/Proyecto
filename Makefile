#Garcia Lugo Maria Fernanda
#Mendez Larios Emilio
#Rivas Gutierrez Carlos Andres
#Villegas Aguilar Carlos

#Definicion de la macros

CC=gcc#Compilador
CFLAGS= -Wall#Banderas del compilador

#Reglas de inferencia

Proyecto:Malware.o
	$(CC) -o Proyecto Malware.o


%.o:%.c
	$(CC) $(CFLAGS) -c $<
	
clean:
	rm *.o Proyecto
