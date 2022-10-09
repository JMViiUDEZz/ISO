#Menú de gestión de redes
do{
$showmenu
clear-host
Write-Host "1--- Mostrar información simple de todos los adaptadores de red"
Write-Host "2---Mostrar información detallada de un adaptador (pide nombre de adaptador)"
Write-Host "3---Activar/desactivar adaptador (pide nombre)"
Write-Host "4---Configuración IP con las siguientes opciones"
Write-Host "5---Salir"

$select= Read-Host "Seleccione una opción"

if ($select -eq 1){
    Get-NetAdapter
    }

if ($select -eq 2){
    $nombre= read-host "Nombre del adaptador de red"
    Get-NetAdapter -name $nombre
}

if ($select -eq 3){
    $nombre2= read-host "Nombre del adaptador de red"
    $act_des= read-host "deseas activar(a) o descativar(d)"
    if($act_des -eq "a"){
        enable-NetAdapter -name $nombre2
    }
    else{
        disable-NetAdapter -name $nombre2
    }
    }

if ($select -eq 4) {
#Menú de configuración IP
do {
clear-host


Write-Host "A---Ver configuración actual"
Write-Host "B---Comprobar conectivad a Internet"
Write-Host "C---Cambiar con Conf. estática (pide IP, máscara, pta. enlace y DNS)"
Write-Host "D---Cambiar con Conf. dinámica (Habilita las opciones oportunas)"
Write-Host "E---Volver"

$select1= Read-Host "Seleccione una A,B,C,D,E"

 if ($select1 -eq "A")
 {
     gip
 }

 if ($select1 -eq "B")
 {
Test-Connection www.google.es
 }

 if ($select1 -eq "C")
 {
    $ip= Read-Host "Indica una ip"
    $pe= read-host "Indica una puerta de enlace"
    $mask= Read-Host "Indica una máscara"
    $dns=read-host "Indica un DNS"
    Remove-NetIPAddress
    New-NetIPAddress -IPAddress $ip -PrefixLength $mask -DefaultGateway $pe -ServerAddresses $dns
 }

  if ($select1 -eq "D")
 {
   
    
 }

   if ($select1 -ne "E")
 {
   
     Read-Host "Pulsa una tecla para continuar"
    }
} while ($select1 -ne "E")
}

 if ($select -ne 5)
 {
    Read-Host "Pulsa una tecla para continuar"
  }
    
} while ($select -ne 5)