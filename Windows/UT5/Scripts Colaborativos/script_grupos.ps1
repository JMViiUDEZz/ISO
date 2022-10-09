#Scripts de GRUPOS Erick#
$grupo=0
while ($grupo -ne 7){
   Clear-host
   Write-Output "Menu de grupos"
   Write-Output "-----------------------------------------"
   Write-Output "1. Listar grupos"
   Write-Output "2. Crear grupo" 
   Write-Host "3. Añade usuarios al grupo"
   Write-Host "4. Elimina usuarios del grupo."
   Write-Host "5. Elimina grupo"
   Write-Host "6. Muestra usuarios del grupo"
   Write-Host "7. Salir"
   Write-Output "Introduce una de las opciones: "
   $grupo=Read-Host "Seleccione opción"
   if ($grupo -eq 1){
       Get-LocalGroup|ft
   }
   if ($grupo -eq 2){
       $nomgr2=Read-Host "Nombre del nuevo grupo"
       New-LocalGroup $gruponuevo
   }
   if ($grupo -eq 3){
       $usuarionom=Read-Host "Indica usuario a añadir"
       $nomgr3=Read-Host "Grupo a asignar"
       Add-LocalGroupMember $nomgr5 -Member $usuarionom
   }
   if ($grupo -eq 4){
       $usuarionom2=Read-Host "Usuario a eliminar"
       $nomgr4=Read-Host "Nombre del grupo"
       Remove-LocalGroupMember -Member $usuarionom2 -Group $nomgr4
   }
   else{
       Write-Output "El grupo o el usuario no existe"
   }
   if ($grupo -eq 5){
       $nomgr5=Read-Host "Grupo a eliminar"
       Remove-LocalGroup -Confirm $nomgr5
   }
   if ($grupo -eq 6){
       $nomgr6=Read-Host "Grupo a listar miembros"
       Get-LocalGroupMember $nomgr6 |fl
   }
   else{
       Write-Output "El grupo no existe"
   }
  if ($grupo -ne 7){
       read-host "Gracias por usar este programa. Pulse para continuar"
   }
}