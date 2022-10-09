#!/bin/bash
cond=-1        #contadores
conf=0
if [ $# -eq 1 ];then
	if [ -d $1 ];then
		for i in ` du -a $1 `;do
			if [ -f $i ];then
				conf=$(($conf+1))
			fi 
			if [ -d $i ];then
				cond=$(($cond+1))
			fi 
		done
		echo "Número de directorios: $cond"
		echo "Número de ficheros: $conf"
	else
		echo "$1 no es directorio"
	fi
else 
	echo "Introduce un parámetro"
fi

