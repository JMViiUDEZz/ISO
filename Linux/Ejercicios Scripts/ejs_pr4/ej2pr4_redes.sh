#!/bin/bash
validacion (){
ok=0
for i in $*;do
num1=`echo  $i  | tr  -s  .  "  "  | wc  -w`
if [ $num1 -eq 4 ];then 
for j in `seq 1 4`;do
num2=`echo $i | cut -d. -f$j`
if [ $num2 -lt 0 -o $num2 -gt 255 ];then 
echo $i  "no  es  correcto  y  salimos";exit
fi 
done
else
echo $i  "no  es  correcto  y  salimos";exit 
fi
done
echo "Comprobación  de  direcciones  correcta";ok=1
}
usu=`id -u`
if [ $usu -ne 0 ];then
echo "El  usuario  no  es  root  y  salimos  ";exit 
fi
echo "Elige una interfaz de red de las que aparecen a continuación " 
ip -0 -o address | cut -d: -f2
nic=""
while [ "$nic" = "" ];do
read -p "Debes elegir nic " nic
done
read -p  "Introduce  ip  "  direcc
read -p  "Introduce  máscara  de  subres  en  formato  /nº  "  mas
read -p  "Introduce  puerta  de  enlace  "  enla
read -p  "Introduce  dns  principal  "  ser_dns1 
read -p  "Introduce  dns  secundario  "  ser_dns2 
validacion $direcc $enla $ser_dns1 $ser_dns2
if [ $mas  -lt  8  -o  $mas  -gt  30  ];then
echo "$mas  no  es  una  máscara  correcta  y  salimos";exit
fi
if [ $ok -eq 1 ];then
echo "
ethernets:
$nic:
dhcp4: no
addresses:  [$direcc/$mas] gateway4:  $enla nameservers:
search: [local]
addresses: [$ser_dns1,$ser_dns2] ">> 
/etc/netplan/01-network-manager-all.yaml 
sudo netplan apply
fi
echo "Comprobación  de  cambio"; ip  address

