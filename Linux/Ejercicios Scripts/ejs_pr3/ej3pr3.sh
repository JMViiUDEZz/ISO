#!/bin/bash
valor=$$
echo "El pid es $valor" 
intentos=0
read -p  "Introduce  el  pid  que  creas:  "  num;intentos=$(($intentos+1))
echo $num  | egrep -q  '?[0-9]+$'
if [ $? -eq 0 ];then
while [ $num -ne $valor ];do 
if [ $num -lt $valor ];then
echo "El  pid  es  mayor,  vuelve  a  intentarlo"
intentos=$(($intentos+1))
elif [ $num -gt $valor ];then
echo "El  pid  es  menor,  vuelve  a  intentarlo" 
intentos=$(($intentos+1))
fi
read -p  "Introduce  el  pid  que  creas:  "  num
echo $num  | egrep -q  '?[0-9]+$'
if [ $? -eq 0 ];then 
continue
else
echo "no  has  introducido  un  número";exit 
fi
done
echo "Enhorabuena has acertado el pid del script con $intentos intentos"
else
echo "  $num  no  es  número"
fi

