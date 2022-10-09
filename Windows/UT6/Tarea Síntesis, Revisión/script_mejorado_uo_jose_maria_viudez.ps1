function crearuo{
        Write-Host "Has elegido la opción 1"
        Write-Host "Estas son las unidades organizativas:"
        Get-ADOrganizationalUnit -filter * | ft name, DistinguishedName
        $uo = Read-Host "Introduzca el nombre de la Unidad Organizativa a crear"     
        New-ADOrganizationalUnit -Name $uo
}
function veruo{
        clear-host
        Write-Host "Has elegido la opción 2"
        Write-Host "Estas son las unidades organizativas:"
        Get-ADOrganizationalUnit -filter * | ft name, DistinguishedName
        $uo = Read-Host "Introduzca el nombre de la Unidad Organizativa a ver" 
        Get-ADOrganizationalUnit -filter * | where-object name -eq $uo    
          
}              
function moverusuou{
        Write-Host "Has elegido la opción 3"     
        Write-Host "Estas son los usuarios existentes"
        Get-ADuser -filter * | ft name
        $usu= Read-Host "Introduzca el nombre del usuario"

        Write-Host "Estas son las unidades organizativas existentes:"
        Get-ADOrganizationalUnit -filter * | ft name, DistinguishedName
        $uo= Read-Host "Introduzca el nombre de la Unidad Organizativa donde mover"
        Move-ADObject CN=$usu -TargetPath "OU=$uo"
}
function borraruo{
        Write-Host "Has elegido la opción 4"
        Write-Host "Estas son las unidades organizativas:"
        Get-ADOrganizationalUnit -filter * | ft name, DistinguishedName 
        $uo = Read-Host "Introduzca el nombre de la Unidad Organizativa" 
        $d1 = Read-Host "Introduzca el primer nombre del Dominio al que pertenece" 
        $d2 = Read-Host "Introduzca el segundo nombre del Dominio al que pertenece"
        set-adorganizationalunit -identity "ou=$uo,dc=$d1,dc=$d2"  -protectedfromaccidentaldeletion $false
        Remove-ADOrganizationalUnit -Identity "OU=$uo,DC=$d1,DC=$d2"
} 
function renombraruo{
        Write-Host "Has elegido la opción 5"
        Write-Host "Estas son las unidades organizativas:"
        Get-ADOrganizationalUnit -filter * | ft name, DistinguishedName 
        $uo = Read-Host "Introduzca el nombre de la Unidad Organizativa" 
        $d1 = Read-Host "Introduzca el primer nombre del Dominio al que pertenece" 
        $d2 = Read-Host "Introduzca el segundo nombre del Dominio al que pertenece"
        $nuevo_nom= Read-host "Introduce el nuevo nombre"
        Rename-ADObject -Identity "OU=$uo,DC=$d1,DC=$d2" -newname $nuevo_nom
       
} 

function menu{
    clear-host
    
    Write-Host "Menu de gestión de unidades organizativas"
    Write-Host ""
    Write-Host "1.Crear Unidades Organizativas."
    Write-Host "2.Ver miembros de una Unidad Organizativa."
    Write-Host "3.Mover un usuario a otra Unidad Organizativa."
    Write-Host "4.Borrar Unidades Organizativas."
    Write-Host "5.Renombrar Unidades Organizativas"
    Write-Host "6.Salir"
    Write-Host ""
    Write-Host "Si ninguna de las opciones anteriores es la correcta es porque este script no es el que buscabas..."
    Write-Host ""
    Write-Host ""
}
   
 $respuesta=0;$salir=0
    while ($respuesta -ge "0" -and $respuesta -le 6 -and $salir -eq 0 ){
    menu   
    $respuesta = Read-Host "Opción"
    switch ($respuesta){
        1 {crearuo}
        2 {veruo}
        3 {moverusuou}
        4 {borraruo}
        5 {renombraruo}
        6 {Write-Output "Gracias por usar este programa";$salir=1}
    }
   
}