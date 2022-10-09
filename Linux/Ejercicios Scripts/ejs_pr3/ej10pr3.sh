#!/bin/bash
menu(){
echo "
------------------------------------------
1)BUSCAR  FICHERO  Y  MOSTRAR  CAMINO  ABSOLUTO
2)CAMBIAR  PERMISOS  AL  FICHERO
3)BUSCAR  CADENA  EN  FICHERO
4)SALIR
------------------------------------------
"
}
uno(){
du -a  | grep -w  "$@"  1>/dev/null 
if [ $? -eq 0 ]; then
echo "EL  FICHERO  SE  HA  ENCONTRADO"
du -a  | grep -w  "$@" 
echo "Y  SU  CAMINO  ABSOLUTO  ES:  "`readlink  -f  $@`
else
echo "El fichero $@ no se ha encontrado"
fi
}
dos(){
echo "LOS  PERMISOS  ACTUALES  DEL  FICHERO  $@  son  "
ls -lR  | grep -w  "$@"
echo "INDICA  LOS  PERMISOS  QUE  QUIERES  CAMBIAR  EN  EN  VALOR  OCTAL"
read -p  "Permiso  de  usuario  "  perus 
read -p  "Permiso  de  grupo  "  pergr 
read -p  "Permiso  de  otros  "  perot 
chmod $perus$pergr$perot $@
echo "VERIFICACIÓN  DE  CAMBIO  DE  PERMISOS"
ls -lR  | grep -w  "$@"
}
tres(){
read -p    "INTRODUCE  LA  CADENA  A  BUSCAR  EN  EL  FICHERO  "  cad
grep -w  "$cad"  $@  1>/dev/null 
if [ $? -eq 0 ];then
echo "LA  CADENA  $cad  SE  HA  ENCONTRADO  en  $@"
else
echo "LA CADENA $cad NO SE HA ENCONTRADO EN $@ "
fi
}
if [ $# -eq 1 ];then
if [ -f $@ ];then
while true;do
menu
read -p  "Introduce  un  opción  del  menú  "  opc
case $opc in 
1)clear;uno $@;; 
2)clear;dos $@;; 
3)clear;tres $@;; 
4)exit;;
*)echo "Ha  introducido  un  opción  no  válida";break 
esac
done 
else
echo "El  parámetro  $@  no  es  fichero"
fi 
else
echo "Debe  introducir  un  parámetro"
fi

