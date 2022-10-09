#!/bin/bash
if [ $# -eq 1 ];then 
if [ -d $@ ];then
nd=-1;nf=0
for i in `du -a $@`;do
if [ -d $i ];then
nd=$(($nd+1)) 
elif [ -f $i ];then
nf=$(($nf+1)) 
fi
done
echo "directorios hay $nd" 
echo "fi-cheros hay $nf" 
else
echo "$@  no  es  directorio"
fi 
else
echo "Debe  introducir  1  parámetro"
fi

