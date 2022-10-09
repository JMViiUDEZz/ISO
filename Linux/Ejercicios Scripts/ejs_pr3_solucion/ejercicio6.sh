#!/bin/bash
if [ -d ./cgs ];then
	echo "El directorio cgs ya existe"
else
	mkdir cgs
fi

for i in `du -a`;do
	if [ -f $i ]; then
		cp $i cgs
	fi
done
#comprobacion
echo "Comprobación de la copia en cgs"
ls cgs
