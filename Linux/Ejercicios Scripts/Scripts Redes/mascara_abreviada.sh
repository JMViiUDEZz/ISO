#!/bin/bash
#Convertir máscara decimal en abreviada
#introducir la máscara
read -p "Introduce la máscara en decimal " mas
#comprobar el formato
cont=0
for j in `seq 1 4`;do
  for i in `echo $mas | cut -d'.' -f$j`;do
    #comprobación del valor entre 0 y 255
    if [ $i -ge 0 -a  $i -le 255 ];then
      cont=$(($cont+1))
    else
      echo "El valor $i no está entre 0 y 255";exit
    fi
  done
done
if [ $cont -ne 4 ];then
  echo "El formato de la máscara no es correcto y salimos ";exit
fi 
#pasar a binario
cont1=0
for j in `seq 1 4`;do
  for i in `echo $mas | cut -d'.' -f$j`;do
    num=`echo "ibase=10;obase=2;$i" | bc`
    #contar el número de 1 
    for l in `seq 1 8 `;do
      for k in `echo $num | cut -c$l`;do
        if [ $k -eq 1 ];then
          cont1=$(($cont1+1))
        fi
      done 
    done
  done
done
#visualizar la máscara en formato abreviado
echo "La máscara de $mas abreviada es: /$cont1"

echo "Otra alternativa más eficiente"
#pasar máscara de binario a abreviada
#pasar un número decimal a binario echo "ibase=10;obase=2;num"
#comprobación de máscara correcta
con1=0
read -p "Introduce la máscara en decimal " mas
#comprobación de valores correctos
num=`echo $mas | tr -s '.' " "`
for i in $num;do
  num1=`echo "ibase=10;obase=2;$i" | bc -l`
  #contar los 1
  con=`echo $num1 | grep -o '1' | wc -l`
  con1=$(($con1+$con))
done
echo "La máscara es /$con1"


