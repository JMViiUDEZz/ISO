#!/bin/bash
menu (){
echo "Elige  opción  del  siguiente  menú:"
echo "
1)	suma
2)	resta
3)	producto
4)	división
5)	resto"
}
suma  (){
resultado=`echo "($1)+($2)" | bc -l`
}
resta(){
resultado=`echo "($1)-($2)" | bc -l`
}
producto(){
resultado=`echo "($1)*($2)" | bc -l`
}
division(){
if [ "$2" != "0" ];then 
resultado=`echo "scale=2;($1)/($2)" | bc -l`
else
echo "División  por  0"
fi
}
resto(){
if [ $2 -ne 0 ];then
resultado=$(($1%$2))
else
echo "División  por  0"
fi
}
if [ $# -eq 2 ];then
echo $1  | egrep -q  '^\-?[0-9  .,]+$'
if [ $? -ne 0 ];then
echo "El  parámetro  $1  no  es  número"
exit fi
echo $2  | egrep -q  '^\-?[0-9  .,]+$'
if [ $? -ne 0 ];then
echo "El  parámetro  $2  no  es  número"
exit
fi
echo "Se  procede  a  realizar  las  operaciones  que  elijas  del  siguiente  menú" 
menu
read -p  "Introduce  opción  del  menú:  "  resp
echo $resp  | egrep -q  '^?[0-9  .,]+$'
while [ $? -eq 0 ] && [ $resp -ge 1 ];do 
case $resp in
1)operacion="  +  "; echo "Se  va  a  realizar  $operacion  ";suma  $1  $2;; 
2)operacion=" - ";echo "Se va a realizar $operacion ";resta $1 $2;; 
3)operacion=" * ";echo "Se va a realizar $operacion ";producto $1 $2;; 
4)operacion="  /  ";echo "Se  va  a  realizar  $operacion  ";division  $1  $2;; 
5)operacion=" % ";echo "Se va a realizar $operacion ";resto $1 $2;;
*)echo "opción  $resp  no  válida  y  se  termina";break;;
esac
echo "$1 $operacion $2 = $resultado"
read -p  "Introduce  opción  del  menú:  "  resp
done 
else
echo "Debe  introducir  2  números"
fi

