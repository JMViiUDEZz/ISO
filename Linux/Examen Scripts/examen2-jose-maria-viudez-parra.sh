#• Si se ejecuta sin ninguna opción se visualizará el contenido del script
#• Opción puede ser:
#-c: copiará ficheros a un directorio que se pedirá por teclado.
#-b: borrará ficheros del directorio donde esté ubicado.
#-m: moverá ficheros a un directorio que se pedirá por teclado.
# -v: visualizará el contenido de los ficheros y volcará la información a un archivo     llamado completo

copia (){
	echo " "
	echo " "
	echo "Opción -c"
	echo " "
	echo " "
	read -p "Di el directorio al que deseas copiar: " direccion
	
	for i in $*;do
		if [ -f $i ];then
			echo " "
			echo " "
			cp $i $direccion
			echo " "
			echo " "
			cat $i 
			echo "Se copio correctamente"
		else
			echo " "
			echo " "
			echo "El elemento dicho no es un fichero"
		fi
	done
	
	
	echo " "
	echo " "
}

borra (){
	echo " "
	echo " "
	echo "Opción -b"
	for i in $*;do
		if [ -f $i ];then
			echo " "
			echo " "
			cat $i
			rm $i
			echo "Se borro correctamente"
		else
			echo " "
			echo " "
			echo "El elemento dicho no es un fichero"
		fi
	done
	echo " "
	echo " "
}

mueve (){
	echo " "
	echo " "
	echo "Opción -m"
	echo " "
	echo " "
	read -p "Di el directorio al que deseas mover: " direccion
	for i in $*;do
		if [ -f $i ];then
			echo " "
			echo " "
			cat $i
			mv $i $direccion
			echo " "
			echo " "
			echo "Se movio correctamente"
		else
			echo " "
			echo " "
			echo "El elemento dicho no es un fichero"
		fi
	done
	
	
	echo " "
	echo " "
}

visualiza (){
	echo " "
	echo " "
	echo "Opción -v"
	
	for i in $*;do
	if [ -f $i ];then
		echo " "
		echo " "
		echo "Contenido del fichero"
		cat $i
		echo " "
		echo "--------------------------------"
		echo " "
		cat $i 
		cat $i >> completo
		echo " "
		echo "--------------------------------"
		echo " "
		echo "Se volco totalmente la información de este fichero"
	else
		echo " "
		echo " "
		echo "El elemento dicho no es un fichero"
	fi
	done	
	echo " "
	echo " "
}



usu=`id -u`
if [ $usu -eq 0 ];then
	echo "" > completo
	if [ $# -eq 0 ];then
		cat $0
	else
		case $1 in
			-c)shift; copia $*;;
			-b)shift; borra $*;;
			-m)shift; mueve $*;;
			-v)shift; visualiza $*;;
		esac	
	fi
else
	echo "No eres usuario Root"
fi


