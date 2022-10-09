#!/bin/bash 
menu(){ 
echo "
------------------------------------------------------------------------------------
1.CUENTA  USUARIOS  CONECTADOS
2.CUENTA  USUARIOS  CON  DIRECTORIO  HOME  Y  LOS  ALMACENA  EN  all.users,
3.LISTA  IDENTIFICADORES  DE  USUARIOS  CONECTADOS  AL  SISTEMA,
4.LISTA  CUENTAS  DE  USUARIOS  ORDENADOR  POR  NOMBRE  E  ID
5.DIA  MES  AÑO  EN  VARIABLE  MOSTRADA  EN  PANTALLA
6.CAMBIA  A  MAYÚSCULAS  LOS  NOMBRES  DE  FICHEROS  PASADOS  POR  PARÁMETRO
------------------------------------------------------------------------------------
"
}
uno(){
echo "El  número  de  usuarios  conectados  es:  ";users  | wc -w
}
dos(){
echo "El  número  de  usuarios  con  directorio  home  es:  ";ls /home  | wc -l
ls /home > allusers
echo "comprobación  de  allusers"
cat allusers
}
tres(){
echo "Lista  de  usuarios  conectados  al  sistema:  ";users
}
cuatro(){
echo "---Cuentas  de  usuarios  ordenadas  por  nombre:---  "
cat /etc/passwd | cut -d: -f1,3 | sort -t: -k1 
echo "---Cuentas de usuarios ordenadas por id: " 
cat /etc/passwd | cut -d: -f1,3 | sort -t: -k2 -n
}
cinco(){
echo "Dia-més-año:  "`date  +%d-%m-%Y`
}
seis(){
if [ $# -ne 0 ];then 
for i in $*;do
if [ -f $i ];then
nuevo=`echo  "$i"  | tr  [:lower:]  [:upper:]`
mv $i $nuevo
echo "Comprobación  de  cambio  de  nombres  de  ficheros"
ls | grep $nuevo
else
echo "El  parámetro  $i  no  es  fichero"
fi 
done
else
echo "No  ha  introducido  nombres  de  ficheros  a  cambiar  el  nombre"
fi
}
while true;do 
menu
read -p  "Introduce  opción  del  menú  anterior:  "  opc
case $opc in
1)	clear;uno;;
2)	clear;dos;; 
3)clear;tres;;
4)clear;cuatro;; 
5)clear;cinco;; 
6)clear;seis  $@;;
*)echo "Ha  introducido  una  opción  no  válida";break;; 
esac
done 

