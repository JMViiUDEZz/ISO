#!/bah/bash
opciones(){
echo "Usted  a  introducido  la  opción  $1  y  procedemos  a  ejecutarla"
case $1 in
"-c")uno  $1 $2;;
"-b")dos $1 $2;;
"-m")tres  $1  $2;;
"-p")cuatro  $1 $2;;
"-e")cinco  $1 $2 ;;
*)echo "Opción  no  válida";break;; 
esac
}
uno(){
echo "Copia  fichero  $2  a  un  directorio  que  se  pide  por  teclado"
}
dos(){
echo "Borra fichero $2 del directorio donde esté ubicado"
}
tres(){
echo "Mueve  fichero  $2  a  un  directorio  que  se  pedirá  por  teclado"
}
cuatro(){
echo "Ejecuta  fichero  $2  de  forma  programada"
}
cinco(){
echo "Crea  un  shell-script,  realiza2,  y  lo  llama"
}
visualizacion(){
echo "Visualización  del  fichero  $1  con  ausencia  de  opciones"
cat $1
}
fichero(){
echo "Comprobación  del  fichero  $1"
if [ -f $1 ];then 
echo "$1 es fichero"
else
read -p  "Introduzca  fichero  "  fich
while [ ! -f $fich ];do
read -p  "Introduzca  fichero  "  fich
done 
fi
return $fich
}
#PROGRAMA  PRINCIPAL
case $# in
1)	echo "Ha  introducido  1  parámetro"
echo "Comprobación  del  fichero  $1"
if [ -f $1 ];then 
echo "$1 es fichero"
else
read -p  "Introduzca  fichero  "  fich
while [ ! -f $fich ];do
read -p  "Introduzca  fichero  "  fich
done 
fi
visualizacion $fich
;;
2)	echo "Ha  introducido  2  parámetros" 
echo "Comprobación  del  fichero  $2" 
if [ -f $2 ];then
echo "$2 es fichero"
else
read -p  "Introduzca  fichero  "  fich
while [ ! -f $fich ];do
read -p  "Introduzca  fichero  "  fich
done
fi
opciones $1 $fich
;;
*)echo "Sólo  se  permite  1  o  2  parámetros";break;; 
esac

