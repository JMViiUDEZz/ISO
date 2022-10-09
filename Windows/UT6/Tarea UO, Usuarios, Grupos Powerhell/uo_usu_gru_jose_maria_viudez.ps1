function crearuo{
        Write-Host "Has elegido la opción 1"
        $uo = Read-Host "Introduzca el nombre de la Unidad Organizativa"     
        New-ADOrganizationalUnit -Name $uo
}
function crearusu{
        Write-Host "Has elegido la opción 2"
        $usu = Read-Host "Introduzca el nombre del usuario"
        new-aduser -name $usu
}
function verusu{
        Write-Host "Has elegido la opción 3"
        $usu = Read-Host "Introduzca el nombre del usuario"
        get-aduser $usu -properties enabled
        sleep 10
} 
function creargru{
        Write-Host "Has elegido la opción 4"      
        $gru = Read-Host "Introduzca el nombre del grupo"
        $cat = Read-Host "Introduzca la categoría del grupo (Security/Distribution)"
        $sco = Read-Host "Introduzca el alcance del grupo (DomainLocal/Global/Universal)"
        New-ADGroup -Name $gru -GroupCategory $cat -GroupScope $sco
}
function agregarusugru{
        Write-Host "Has elegido la opción 5"
        $usu = Read-Host "Introduzca el nombre del usuario"
        $gru = Read-Host "Introduzca el nombre del grupo"
        add-adgroupmember -identity $gru -members $usu
}
function vergru{
        Write-Host "Has elegido la opción 6"
        $gru = Read-Host "Introduzca el nombre del grupo"
        get-adgroupmember -identity $gru
        sleep 10
}
function veruo{
        Write-Host "Has elegido la opción 7"
        $uo = Read-Host "Introduzca el nombre de la Unidad Organizativa" 
        $d1 = Read-Host "Introduzca el primer nombre del Dominio al que pertenece" 
        $d2 = Read-Host "Introduzca el segundo nombre del Dominio al que pertenece" 
        Get-ADUser -Filter * -SearchBase "OU=$uo,DC=$d1,DC=$d2"
        sleep 10
}              
function moverusuou{
        Write-Host "Has elegido la opción 8"
        $usu= Read-Host "Introduzca el nombre del usuario"
        $uo= Read-Host "Introduzca el nombre de la Unidad Organizativa"
        Move-ADObject CN=$usu -TargetPath "OU=$uo"
}
$salir = 0
while ($salir -eq "0"){
    Clear-Host
    Write-Host ""
    Write-Host ""
    Write-Host "Menu de José María Viúdez"
    Write-Host ""
    Write-Host "1.Crear Unidades Organizativas."
    Write-Host "2.Crear nuevas cuentas de usuario."
    Write-Host "3.Ver información de un usuario especifico."
    Write-Host "4.Crear nuevo grupo."
    Write-Host "5.Agregar un usuario a un grupo."
    Write-Host "6.Ver miembros de un grupo."
    Write-Host "7.Ver miembros de una Unidad Organizativa."
    Write-Host "8.Mover un usuario a otra Unidad Organizativa."
    Write-Host "9.Salir"
    Write-Host ""
    Write-Host "Si ninguna de las opciones anteriores es la correcta es porque este script no es el que buscabas..."
    Write-Host ""
    Write-Host ""

    $respuesta = Read-Host "Opción"
    Write-Host ""

    switch ($respuesta){
        1 {crearuo}
        2 {crearusu}
        3 {verusu}
        4 {creargru}
        5 {agregarusugru}
        6 {vergru}
        7 {veruo}
        8 {moverusuou}
        9 {Write-Output "Gracias por usar este programa"
            $salir=1
        }
    }
}
