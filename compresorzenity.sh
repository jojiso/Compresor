#!/bin/bash

#Crea un script para Comprimir/Descomprimir ficheros. en formato "tgz" mediante el comando "tar" Mostrará un menú con las opciones:
#
# Comprimir
# Descomprimir
# Salir
#Dentro de cada una de las opciones, deberá pedir al usuario los ficheros a comprimir/descomprimir y el destino dónde comprimir/descomprimir.
#También tendrás que subir el script y los desarrollos intermedios al GitHub (indica ruta en el texto en linea)
# https://github.com/jojiso/Compresor

destino=`tempfile`
#funcion para el menu
menu(){
	opcion=`zenity --list --height="210"\
  --title="Elija la operacion que quiere realizar" \
  --column="Número operacion" --column="Operacion" \
	"1" "Comprimir" \
	"2" "Descomprimir" \
	"3" "Salir" 2>/dev/null`
	return $opcion	
}

#opciones del menu
opcion(){
	case $1 in
		1) #read -p "Escribe la ruta de los archivos a comprimir: " ficheros
		ficheros=`zenity --file-selection --multiple --separator=" " --title="Selecciona los ficheros a comprimir" 2>/dev/null`
		ruta=`zenity --file-selection --directory --title="Selecciona la ruta donde comprimir" 2>/dev/null`		
		nombre=`zenity --entry --title="Compresor" --text="Introduce el nombre del archivo comprimido:" 2>/dev/null`
		
		#read -p "Escribe la ruta absoluta y el nombre del archivo comprimido: " comprimido
		comprimir;;
		2) #read -p "Escribe la ruta del archivo que quieres descomprimir con la extension tar.gz: " descomprimir
		descomp=`zenity --file-selection --title="Selecciona el fichero a descomprimir" 2>/dev/null`		
		#read -p "Escribe la ruta absoluta donde quieras descomprimirlo: " ruta
		ruta=`zenity --file-selection --directory --title="Selecciona la ruta donde descomprimir" 2>/dev/null`		
		descomprimir;;
		*) exit;;
	esac
}

#funcion comprimir

comprimir(){    
	
   	tar -czvf $ruta/$nombre.tar.gz $ficheros
	zenity --info --text="El archivo $nombre.tar.gz se ha comprimido con exito" 2>/dev/null
}

#funcion descomprimir
descomprimir(){
	tar -xzvf $descomp -C $ruta
	zenity --info --text="$descomp se ha descomprimido en $ruta" 2>/dev/null
}

while true
do
menu 
opcion $?
done


