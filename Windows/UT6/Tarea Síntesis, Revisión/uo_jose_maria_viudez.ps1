function crearuo{
        Write-Host "Has elegido la opción 1"
        $uo = Read-Host "Introduzca el nombre de la Unidad Organizativa"     
        New-ADOrganizationalUnit -Name $uo
}
function veruo{
        Write-Host "Has elegido la opción 2"
        $uo = Read-Host "Introduzca el nombre de la Unidad Organizativa" 
        $d1 = Read-Host "Introduzca el primer nombre del Dominio al que pertenece" 
        $d2 = Read-Host "Introduzca el segundo nombre del Dominio al que pertenece" 
        Get-ADUser -Filter * -SearchBase "OU=$uo,DC=$d1,DC=$d2"
        sleep 10
}              
function moverusuou{
        Write-Host "Has elegido la opción 3"
        $usu= Read-Host "Introduzca el nombre del usuario"
        $uo= Read-Host "Introduzca el nombre de la Unidad Organizativa"
        Move-ADObject CN=$usu -TargetPath "OU=$uo"
}
function borraruo{
        Write-Host "Has elegido la opción 4"
        $uo = Read-Host "Introduzca el nombre de la Unidad Organizativa" 
        $d1 = Read-Host "Introduzca el primer nombre del Dominio al que pertenece" 
        $d2 = Read-Host "Introduzca el segundo nombre del Dominio al que pertenece"
        Remove-ADOrganizationalUnit -Identity "OU=$uo,DC=$d1,DC=$d2"
} 
}
$salir = 0
while ($salir -eq "0"){
    Clear-Host
    Write-Host ""
    Write-Host ""
    Write-Host "Menu de gestión de unidades organizativas"
    Write-Host ""
    Write-Host "1.Crear Unidades Organizativas."
    Write-Host "2.Ver miembros de una Unidad Organizativa."
    Write-Host "3.Mover un usuario a otra Unidad Organizativa."
    Write-Host "4.Borrar Unidades Organizativas."
    Write-Host "5.Salir"
    Write-Host ""
    Write-Host "Si ninguna de las opciones anteriores es la correcta es porque este script no es el que buscabas..."
    Write-Host ""
    Write-Host ""

    $respuesta = Read-Host "Opción"
    Write-Host ""

    switch ($respuesta){
        1 {crearuo}
        2 {veruo}
        3 {moverusuou}
        4 {borraruo}
        5 {Write-Output "Gracias por usar este programa"
            $salir=1
        }
    }
}
