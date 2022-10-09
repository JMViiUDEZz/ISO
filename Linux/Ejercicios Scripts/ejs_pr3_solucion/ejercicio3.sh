#!/bin/bash
intento=0
dato=`echo $$`
read -p "Introduce PID" num
intento=$(($intento+1))
while [ $dato -ne $num ];do
		if [ $dato -gt $num ];then
			echo "El PID es mayor"
		elif [ $dato -lt $num ];then
				echo "El PID es menor"
		else
				echo "Es el PID correcto"
		fi
		read -p "Introduce PID" num
		intento=$(($intento+1))
done
echo "Lo has intentado $intento veces"
