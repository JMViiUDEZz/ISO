#!/bah/bash
#FUNCIONES

opciones(){
	echo "Usted  a  introducido  la  opción  $1  y  procedemos  a  ejecutarla"
	case $1 in
		"-c")uno $2;; 
		"-b")dos $2;;
		"-m")tres  $2;;
		"-v")cuatro $2;;
		*)echo "Opción  no  válida";break;; 
	esac
}

uno(){
	echo "Copia  fichero  $1  a  un  directorio  que  se  pide  por  teclado" 
	read -p  "Introduce  el  nombre  del  directorio  donde  copiar  "  di1 
	if [ -d $di1 ];then
		cp $1 $di1
	else
		echo "$di1 no es válido"
	fi
}

dos(){
	fi2=`readlink -f $1`
	echo "Borra fichero $1 de la ruta $fi2 donde esté ubicado"
	rm $fi2
}

tres(){
	echo "Mueve  fichero  $1  a  un  directorio  que  se  pedirá  por  teclado" 
	read -p  "Introduce  el  nombre  del  directorio  donde  copiar  "  di3  
	if [ -d $di3 ];then
		mv $1 $di3
	else
		echo "$di3 no es válido"
	fi
}

cuatro(){ 
	echo "Visualización  del  fichero  $1"
	cat $1
	cat $1 >> completo
}

visualizacion(){
	echo "Visualización  del  fichero  $1  con  ausencia  de  opciones"
	cat $1
}

fichero(){
	echo "Comprobación  del  fichero  $1"
		if [ -f $1 ];then 
			echo "$1 es fichero" 
			valido=$1
		else
			read -p  "Introduzca  fichero  "  valido
			while [ ! -f $valido ];do
				read -p  "Introduzca  fichero  "  valido
			done 
		fi
}

#PROGRAMA  PRINCIPAL

case $# in
	1)	echo "Ha  introducido  1  parámetro"; fichero $1
	visualizacion $valido
	;;
	2)	echo "Ha  introducido  2  parámetros" fichero $2
	opciones $1 $valido
	;;
	*)echo "Sólo  se  permite  1  o  2  parámetros";break;; 
esac
