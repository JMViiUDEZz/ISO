#!/bin/bash
if [ -d ./cgs ];then
echo "El directorio cgs ya existe"
else
mkdir cgs
fi
for i  in `ls`;do  
if [ -f $i ];then
cp $i cgs
fi 
done
echo "Este es el resultado de la copia"
ls cgs 

