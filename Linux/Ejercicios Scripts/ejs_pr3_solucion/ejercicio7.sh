#!/bin/bash
menu() {
echo "Elige una opción del siguiente menú:"
echo "
	1) cuenta usuarios conectados
	2) usuarios con directorio home
	3) lista identificadores de usuarios conectados 
	4) lista cuentas de usuarios
	5) dia mes año en distintas variables 
	6) cambiar a mayúsculas los nombres de los ficheros "
}

uno() {
	echo "El número de usuarios conectados es: "; users | wc -w       #wc para contar
}

dos() {
	echo "El número de usuarios con directorio homer es "; ls /home | wc -l
	ls /home > allusers
	echo "Comprobación de allusers"
	cat allusers
}

tres() {
	echo "Los usuarios conectados son: "; users 
}

cuatro () {
	echo "---Cuentas de usuarios ordenadas por nombre: ---"
	cat /etc/passwd | cut -d: -f1,3 | sort -t: k1
	echo "---Cuentas de usuarios ordenadas por id: ---"
	cat /etc/passwd | cut -d: -f1,3 | sort -t: k2 -n
}

cinco() {
	echo "Dia-mes-año: "`date +%d-%m-%Y`
}

seis() {
	if [ $# -ne 0 ];then
		for i in $*;do
			nuevo=`echo "$i" | tr [:lower] [upper:]`
			mv $i $nuevo 
			echo "Comprobación de cambio de nombres de ficheros"
			ls | grep $nuevo
		done
		else 
			echo "EL parámetro $i no es fichero"
	fi
}


while true; do 
	menu
	read -p "Introduce opción del menú anterior: " opc
	case $opc in
		1)clear;uno;;
		2)clear;dos;;
		3)clear;tres;;
		4)clear;cuatro;;
		5)clear;cinco;;
		6)clear;seis $@;;
		*)echo "Ha introducido una opción no válida";break;;		
	esac
done
