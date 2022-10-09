#!/bin/bash
touch listaetc
if [ -d /etc ];then
for i in `ls /etc/*`;do
if [ -f $i -a -r $i ];then
basename $i  >> listaetc
fi 
done
else
echo "El  directorio  /tmp  no  existe"
fi
echo "Los ficheros que contiene service de listaetc son:"
cat listaetc  | grep -w  "services" 

