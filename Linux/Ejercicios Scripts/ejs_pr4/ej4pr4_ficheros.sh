#!/bin/bash
copia(){
echo "Se realiza la copia del usuario $2 usando la opción $1 "
exis=`ls  /var  | grep  -w  "copias"`
if [ "$exis" = "" ];then
mkdir /var/copias
fi
fecha=`date +%y%m%d`
if [ "$1" = "a" ];then
echo "copia con ruta absoluta"
tar -cvf  /var/copias/$2_$fecha.tar  /home/$2  1>/dev/null    2>/dev/null 
gzip -9 /var/copias/$2_$fecha.tar
else
echo "copia con ruta relativa"
da=`pwd`
cd /var/copias
tar -cvf  $2_$fecha.tar  /home/$2  1>/dev/null    2>/dev/null 
gzip -9 /var/copias/$2_$fecha.tar 
cd $da
fi
}
usu=`id -u`
if [ $usu -ne 0 ];then
echo "Se  requieren  privilegios  de  root  para  realizar  el  programa";exit 
fi
if [ $# -eq 2 ];then
if [ "$1" = "a" ] || [ "$1" = "r" ];then 
usu=`grep  -w  "$2"  /etc/passwd`
if [ "$usu" != "" ];then
usu1=`find    /home  -name  "$2"`
if [ "$usu1" != "" ];then
copia $1 $2
else
echo "El usuario $2 no dispone de directorio personal"
fi 
else
echo "Usuario  $2  no  existente  en  del  sistema"
fi 
else
echo "$1 no válido, debe ser a o r"
fi 
else
echo "Debe  introducir  2  parámetros"
fi

