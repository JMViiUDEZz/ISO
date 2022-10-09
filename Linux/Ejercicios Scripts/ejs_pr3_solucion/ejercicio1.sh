#!/bin/bash
menu () {
echo "Elige una opción del siguiente menú:"
echo "
	1) suma
	2) resta
	3) producto
	4) división
	5) resto"
}

suma(){
	resultado=`echo "($1)+($2)" | bc -l`
} 
resta(){
	resultado=`echo "($1)-($2)" | bc -l`
}
producto(){
	resultado=`echo "($1)*($2)" | bc -l`
}
division(){
	if [ "$2" != "0" ];then
		resultado=`echo "scale=2;($1)/($2)" | bc -l`
	else
		echo "División por 0"
	fi
}
resto(){
	if [ $2 -ne 0 ];then
		resultado=$(($1%$2))
	else
		echo "División por 0"
	fi
}


if [ $# -eq 2 ];then
	echo $1 | egrep -q '^\-?[0-9 .,]+$'
	if [ $? -ne 0 ];then
		echo "El parámetro $1 no es número"
		exit
	fi
	echo $2 | egrep -q '^\-?[0-9 .,]+$'
	if [ $? -ne 0 ];then
				echo "El parámetro $2 no es número"
				exit
	fi
	echo "Se procede a realizar las operaciones que elijas del sisguiente menú"
	menu
