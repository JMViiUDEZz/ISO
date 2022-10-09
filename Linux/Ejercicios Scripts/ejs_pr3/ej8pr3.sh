#!/bin/bash
menu(){ 
echo "
---------------------------------------------------
1)Visualización  de  particiones 
2)Visualización  de  memoria  li-bre
3)Visualización  de  espacio  ocupado  por  directorios 
4)Visualización  de  ver-sión  completa  del  sistema
---------------------------------------------------
"
}
uno(){
usuario=`id -u`
if [ $usuario -eq 0 ];then
echo "Las  particiones  del  sistema  son:" 
fdisk -l
else
echo "Debe ser root para conocer las particiones"
fi
}
dos(){
echo "La  memoria  libre  es:"
free -h
}
tres(){
echo "El espacio ocupado por directorios es:"
du -a
}
cuatro(){
echo "La  versión  completa  del  sistema  es:"
uname -a
}
while true;do
menu
read -p  "Introduce  una  opción  del  menú  anterior:  "  opc
case $opc in
1)clear;uno;;
2)clear;dos;; 
3)clear;tres;; 
4)clear;cuatro;;
*)echo "Debe  introducir  una  opción  válida";break;; 
esac
done

