#!/bin/bash

#Crea un script para Comprimir/Descomprimir ficheros. en formato "tgz" mediante el comando "tar" Mostrará un menú con las opciones:
#
# Comprimir
# Descomprimir
# Salir
#Dentro de cada una de las opciones, deberá pedir al usuario los ficheros a comprimir/descomprimir y el destino dónde comprimir/descomprimir.
#También tendrás que subir el script y los desarrollos intermedios al GitHub (indica ruta en el texto en linea)
# https://github.com/jojiso/Compresor
#funcion para el menu
menu() {
	clear
	echo "--------------"	
	echo "	Compresor  "
	echo "--------------"
	echo "1) Comprimir uno o varios archivo."
	echo "2) Descomprimir un archivo."
	echo "3) Salir."
	echo "--------------------------------"
	read -p "Seleccione una opción: " opcion
	return $opcion
}

#opciones del menu
opcion(){
	case $1 in
		1) read -p "Escribe la ruta de los archivos a comprimir: " ficheros
		read -p "Escribe la ruta absoluta y el nombre del archivo comprimido: " comprimido
		comprimir;;
		2) read -p "Escribe la ruta del archivo que quieres descomprimir con la extension tar.gz: " descomprimir
		read -p "Escribe la ruta absoluta donde quieras descomprimirlo: " ruta
		descomprimir;;
		*) exit;;
	esac
}



#funcion comprimir
comprimir(){
	echo "Los ficheros son $ficheros"
	tar czvf $comprimido.tar.gz $ficheros
}

#funcion descomprimir
descomprimir(){
	tar xvfz $descomprimir -C $ruta
}

while true
do
menu 
opcion $?
done


