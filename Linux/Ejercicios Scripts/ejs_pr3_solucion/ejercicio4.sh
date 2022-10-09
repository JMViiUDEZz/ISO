#!/bin/bash
usu=`id -u`
if [ $usu -eq 0 ];then
	echo $i >listaetc	
	for i in `ls /etc`;do
		if [ -r $i ];then      	#-r para comprobar que es permiso de lectura
			echo $i >>listaetc			
		fi
		done
else
	echo "Este script debe ser ejecutado por el root"
fi
