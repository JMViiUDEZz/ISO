#!/bin/bash
informe(){
echo "------------------------------------------------------"
echo "GENERACIÓN  DE  INFORME  DEL  USUARIO:  $1"
echo -n  "Nº  PROCESOS  EN  EJECUCIÓN:  "
ps -f  -u  $1  --sort=start_time  | sed 1d  | wc -l
echo "PROCESO  MÁS  ANTIGUO:  "
ps -f  -u  $1  --sort=start_time  | sed 1d  | head -1
echo "LISTADO  DE  PROCESOS  DEL  USUARIO:"
ps -f  -u  $1    --sort=start_time
echo "NÚMERO  DE  DIRECTORIOS  DEL  USUARIO:  "`ls  -lR  /home/$1  | grep  ^d  | wc  -l  `
echo "NÚMERO  DE  FICHEROS  REGULARES:  "`ls  -lR  /home/$1  | grep  ^-  | wc  -l  `
tamano=`du  -s  /home/$1  | cut  -f1`
echo "TAMAÑO  OCUPADO  EN  DISCO  POR  EL  USUARIO:  "  $tamano
total=`df / | tr -s " " " " | cut -d" " -f3 | sed 1d ` 
porcentaje=`echo  "scale=2;$tamano/$total*100"  | bc  -l`
echo "PORCENTAJE  QUE  EL  TAMAÑO  DEL  USUARIO  $tamano  REPRESENTA  SOBRE  EL  TOTAL  $total:
$porcentaje %"
echo "------------------------------------------------------"
}
usu=`whoami`
if [ $# -eq 0 ];then
informe  $usu
else
case $1 in
"-u")
if [ $2 ];then
us=`grep  -w  "$2"  /etc/passwd`
if [ "$us" != "" ];then
informe  $2 
else 
informe  $usu
fi 
else
echo "No  ha  proporcionado  el  usuario  y  se  genera  informe  del  usuario  actual" 
informe  $usu
fi
;;
"-a")
for i in `cat /etc/passwd| cut -d: -f1`;do
us=`id -u $i`
if [ $us -ge 500 ];then
informe  $i
fi 
done
;;
*)echo "parámetro  no  válido";exit;; 
esac
fi

