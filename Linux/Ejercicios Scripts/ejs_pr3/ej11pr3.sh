#!/bin/bash
informe(){
echo "-----------------------------------------------------"
echo "FECHA  Y  HORA  ACTUAL:  "`date  +%d-%m-%Y"  "%T` 
echo "EL  DIRECTORIO  DONDE  ESTÁN  LOS  ARCHIVOS  ES:  $2" 
echo "LISTADO  DE  FICHEROS  CONTENI-DOS  EN  EL  INFORME:  "
find $2 -type "$1" -print
echo "EL  USUARIO  QUE  HA  REALIZADO  EL  INFORME  ES:  "`whoami`
echo "-----------------------------------------------------"
}
if [ $# -eq 3 ];then
case $2 in
"f")echo "Se  va  a  realizar  informe  de  ficheros";; 
"d")echo "Se  va  a  realizar  informe  de  directorios";; 
"p")echo "Se  va  a  realizar  informe  de  pipes";;
"h")echo "Se  va  a  realizar  informe  de  enlaces  simbólicos";; 
"b")echo "Se  va  a  realizar  informe  de  archivos  de  bloques";; 
"c")echo "Se  va  a  realizar  informe  de  fucheros  de  caracteres";;
*)echo "tipo  de  fichero  $2  no  admitido";exit;; 
esac
if [ -d $3 ];then
if [ -f $1 ];then
echo "$1 ya existe"
read -p  "¿Quiere  modificarlo?  s/n:  "  resp
case $resp in
s|S)
echo "Se  va  a  modificar  el  informe"
echo "Se  comprueba  permisos  de  escritura:"
if [ -w  $1  ];then
echo "Si  tiene  permisos  de  escritura  y  se  hace  informe"
informe  $2  $3  > $1
else
echo "El  usuario  no  dispone  de  permisos  de  escritura  y  no  se  puede  realizar
informe"
fi
;;
n|N)echo "No  se  modifica  el  informe  y  salimos  ";exit;;
*)echo "Debe introducir una respuesta correcta";; 
esac
else
fich=`find  .  -name  "$1"`
if [ "$fich" != "" ];then
informe  $2  $3  >$fich 
else
touch $1
if [ $? -ne 0 ];then
echo "Error  en  la  creación  del  fichero  informe:  no  se  puede  generar  el  informe"
else
informe  $2  $3  >$1
fi 
fi
fi 
else
echo "El  parámetro  $3  no  es  directorio  y  no  se  puede  realizar  informe"
fi 
else
echo "Debe  introducir  3  parámetros"
fi 

