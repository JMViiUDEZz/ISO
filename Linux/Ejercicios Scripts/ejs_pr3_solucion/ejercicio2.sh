#!/bin/bash

if [ $# -eq 1 ];then
	if [ -d $@ ];then
		#indicar nombre
		fecha=`date +%F`
		tar -cf $fecha$@.tar $@
		gzip $fecha$@.tar
	else
		echo "El parámetro $@ no es directorio"
	fi
else 
	echo "Debe introducir un parámetro"
fi
