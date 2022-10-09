#!/bin/bash
menu(){ 
echo "
------------------------------------------------
1)MOSTRAR FECHA
2)MOSTRAR  USUARIOS  CONECTADOS  Y  QUÉ  HACEN
3)MOSTRAR  10  PROCESOS  QUE  CONSUMEN  MÁS  MEMORIA
4)MOSTRAR 10 PROCESOS QUE CONSUMEN MÁS CPU
5)MOSTRAR EL ESTADO DE LA RED
6)SALIR
------------------------------------------------
"
}
uno(){
echo "LA  FECHA  DEL  SISTEMA  ES:  "`date  +%d-%m-%Y`
}
dos(){
echo "LOS  USUARIOS  CONECTADOS  Y  LO  QUE  HACEN  SON:"; w
}
tres(){
echo "LOS  10  PROCESOS  QUE  CONSUMEN  MÁS  MEMORIA"
ps -auxf | sort -r -k4 | head -10
}
cuatro(){
echo "LOS  10  PROCESOS  QUE  CONSUMEN  MÁS  CPU"
ps -auxf | sort -r -k3 | head -10
}
cinco(){
echo "EL ESTADO DE LA RED ES:";netstat -s
}
while true;do
menu
read -p  "INTRODUCE  OPCIÓN  DEL  MENÚ  ANTERIOR:  "  opc
case $opc in
1)clear;uno;;
2)clear;dos;; 
3)clear;tres;; 
4)clear;cuatro;; 
5)clear;cinco;; 
6)exit;;
*)echo "OPCIÓN  NO  VÁLIDA";break;; 
esac
done

