function crearusu{
        Write-Host "Has elegido la opción 1"
        $usu = Read-Host "Introduzca el nombre del usuario"
        new-aduser -name $usu
}
function verusu{
        Write-Host "Has elegido la opción 2"
        $usu = Read-Host "Introduzca el nombre del usuario"
        get-aduser $usu -properties enabled
        sleep 10
} 
function agregarusugru{
        Write-Host "Has elegido la opción 3"
        $usu = Read-Host "Introduzca el nombre del usuario"
        $gru = Read-Host "Introduzca el nombre del grupo"
        add-adgroupmember -identity $gru -members $usu
}            
function moverusuou{
        Write-Host "Has elegido la opción 4"
        $usu= Read-Host "Introduzca el nombre del usuario"
        $uo= Read-Host "Introduzca el nombre de la Unidad Organizativa"
        Move-ADObject CN=$usu -TargetPath "OU=$uo"
}
function borrarusu{
        Write-Host "Has elegido la opción 5"
        $usu = Read-Host "Introduzca el nombre del usuario"
        Remove-ADUser -Identity $usu
}
$salir = 0
while ($salir -eq "0"){
    Clear-Host
    Write-Host ""
    Write-Host ""
    Write-Host "Menu de José María Viúdez"
    Write-Host ""
    Write-Host "1.Crear nuevas cuentas de usuario."
    Write-Host "2.Ver información de un usuario especifico."
    Write-Host "3.Agregar un usuario a un grupo."
    Write-Host "4.Mover un usuario a otra Unidad Organizativa."
    Write-Host "5.Borrar cuentas de usuario."
    Write-Host "6.Salir"
    Write-Host ""
    Write-Host "Si ninguna de las opciones anteriores es la correcta es porque este script no es el que buscabas..."
    Write-Host ""
    Write-Host ""

    $respuesta = Read-Host "Opción"
    Write-Host ""

    switch ($respuesta){
        1 {crearusu}
        2 {verusu}
        3 {agregarusugru}
        4 {moverusuou}
        5 {borrarusu}
        6 {Write-Output "Gracias por usar este programa"
            $salir=1
        }
    }
}