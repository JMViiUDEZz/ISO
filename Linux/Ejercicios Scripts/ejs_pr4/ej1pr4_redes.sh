#!/bin/bash
conexion(){
echo "Se  procede  a  comprobar  la  conexión  del  fichero  $1  con  la  opción  $2"
for i in `cat $1`;do
if [ "$2" = "-h" ];then
tipo=`echo $i | cut -d: -f1`
elif [ "$2" = "-i" ];then
tipo=`echo $i | cut -d: -f2`
fi
con=`ping  -c1  $tipo  | grep  -w  "0%  packet  loss"`  2>/dev/null 
if [ "$con" != "" ];then
echo "La  máquina  $tipo  responde"
else
echo "La  máquina  $tipo  no  responde"
fi 
done
}
comprobacion_fichero(){ 
if [ ! -f $1 ];then
echo "$1  no  es  fichero  y  no  se  puede  ejecutar  el  programa";exit 
fi
}
comprobacion_opcion(){
if [ "$1" = "-i" -o "$1" = "-h" ];then
op=$1
else
echo "$1  no  es  válida";exit 
fi
}
case $# in
0)
echo "Debe  introducir  como  mínimo  el  archivo";; 
1)
comprobacion_fichero  $1
read -p  "Introduce  opción  -i  o  -h  "  resp; 
comprobacion_opcion  $resp
conexion $1 $op
;;
2)
comprobacion_fichero  $1 
comprobacion_opcion  $2 
conexion $1 $2
;;
*)echo "Debe  introducir  1  o  2  parámetros";; 
esac

