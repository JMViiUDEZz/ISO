#!/bin/bash
uno(){
echo "SE  EJECUTA  LA  OPCIÓN  -m"
shift
for i in $*;do
if [ -f  $i  -a  -r  $i  ];then
echo "----------------------------------------------------"
echo "EL  CONTENIDO  DE  $i"
cat $i
echo "----------------------------------------------------"
else
echo "$i  NO  ES  FICHERO  O  NO  DISPONE  DE  PERMISOS"
fi 
done
}
dos(){
echo "SE  EJECUTA  LA  OPCIÓN  -x"
shift
for i in $*;do
if [ -x $i ];then
echo "----------------------------------------------------"
echo "SE EJECUTA $i"
sh $i
echo "----------------------------------------------------"
else
echo "$i NO ES EJECUTABLE"
fi 
done
}
tres(){
echo "SE  EJECUTA  LA  OPCIÓN  -p"
shift
for i in $*;do
if [ -f $i ];then
echo "EL  PROPIETARIO  DE  $i  ES  "`ls  -l  $i  | cut  -d"  "  -f3`
else
echo "$i  NO  ES  FICHERO"
fi 
done
}
if [ $# -eq 0 ];then
echo "CONTENIDO  DEL  SCRIPT  $0  ES:"
echo "----------------------------------------------------"
cat $0
echo "----------------------------------------------------"
else
if [ $# -ge 2 ];then 
case $1 in
"-m")uno  $*;;
"-x")dos $*;;
"-p")tres $*;;
*)echo "Opción  no  válida";exit;; 
esac
else
echo "Se  necesitan  como  mínimo  2  parámetros"
fi 
fi

