#1) Hacer ping 2) Trazar ruta 3) Cambiar IP 4) Consultar IP 5) Cambiar máscara 6) Sniffear (captura de tráfico en la red) 0) Salir
menu(){
  echo "-------------------------------------
  1) Hacer ping 
  2) Trazar ruta 
  3) Añadir IP 
  4) Consultar IP 
  5) Cambiar máscara 
  6) Sniffear (captura de tráfico en la red) 
  7) Gestión de tabla de rutas
  0) Salir
  -------------------------------------------
  "
}
uno(){
  clear;echo "Hacer ping"
  read -p "Introduce la ip a la que quieres conectar " direc
  ping -c3 $direc
}
dos(){
  clear;echo "Trazar ruta"
  read -p "Introduce la ip a la que quieres trazar la ruta " direc
  ip route get $direc
  
}
tres(){
  clear;echo "Añadir IP"
  #supongo que no existe
  #faltan las comprobaciones en una función externa
  #si se desea cambiar habría que eliminar y después añadir con los mismos datos menos el que se desea modificar
  read -p "Introduce la interfaz " disp
  read -p "Introduce la ip a la que quieres añadir " direc
  read -p "Introduce la máscara para la ip en formato abreviado sin /" mas
  read -p "Introduce el broadcast  " bro
  sudo ip address add $direc/$mas broadcast $bro dev $disp
}
cuatro(){
  clear; echo "Consultar IP"
  read -p "Introduce la ip a la que quieres consultar " direc
  encontrado=`ip address show | grep $direc`
  if [ "$encontrado" != "" ];then
    echo $encontrado
  else
    echo "$direc no se ha encontrado"
  fi
}
cinco(){
  clear; echo "Cambiar máscara"
  read -p "Introduce la interfaz a modificar " disp #dispositivo
  read -p "Introduce la ip a modificar" direc
  read -p "Introduce máscara anterior en formato abreviado /nº " mas1
  sudo ip address del $direc/$mas1 dev $disp
  read -p "Introduce nueva máscara en formato abreviado /nº " mas2
  read -p "Introduce el nuevo broadcast " bro
  sudo ip address add $direc/$mas2  broadcast $bro dev $disp
}
seis(){
   clear; echo "Sniffear (captura de tráfico en la red)"
   echo "Presione control d para detener"
   sudo tcpdump
}
siete(){
  clear;echo "Se va a visualizar la tabla de rutas"
  ip route show #se puede omitir show
  echo "Se va a crear una ruta por defecto"
  read -p "Introduce interfaz" disp1
  read -p "Introduce ip por defecto" direc1
  #sudo ip route add default via $direc1 dev $disp1
  
  echo "Se va a eliminar una ruta por defecto"
  read -p "Introduce interfaz" disp2
  read -p "Introduce ip por defecto" direc2
  #sudo ip route replace default via $direc2 dev $disp2
  
  
}
while true;do
  menu
  read -p "Elige opción del menú anterior " resp
  case $resp in 
    1) uno;;
    2) dos;; 
    3) tres;; 
    4) cuatro;;
    5) cinco;; 
    6) seis;;
    7) siete;;
    0) exit;;
    *)echo "$resp no es opción válida";exit;;
  esac
done

