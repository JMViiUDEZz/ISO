function creargru{
        Write-Host "Has elegido la opción 1"      
        $gru = Read-Host "Introduzca el nombre del grupo"
        $cat = Read-Host "Introduzca la categoría del grupo (Security/Distribution)"
        $sco = Read-Host "Introduzca el alcance del grupo (DomainLocal/Global/Universal)"
        New-ADGroup -Name $gru -GroupCategory $cat -GroupScope $sco
}
function agregarusugru{
        Write-Host "Has elegido la opción 2"
        $usu = Read-Host "Introduzca el nombre del usuario"
        $gru = Read-Host "Introduzca el nombre del grupo"
        add-adgroupmember -identity $gru -members $usu
}
function vergru{
        Write-Host "Has elegido la opción 3"
        $gru = Read-Host "Introduzca el nombre del grupo"
        get-adgroupmember -identity $gru
        sleep 10
}
function borrarusugru{
        Write-Host "Has elegido la opción 4"      
        $gru = Read-Host "Introduzca el nombre del grupo"
        $usu = Read-Host "Introduzca el nombre del usuario"
        Remove-ADGroupMember -Identity $gru -Members $usu
} 
function borrargru{
        Write-Host "Has elegido la opción 5"      
        $gru = Read-Host "Introduzca el nombre del grupo"
        Remove-ADGroup -Identity $gru
}            
$salir = 0
while ($salir -eq "0"){
    Clear-Host
    Write-Host ""
    Write-Host ""
    Write-Host "Menu de José María Viúdez"
    Write-Host ""
    Write-Host "1.Crear nuevo grupo."
    Write-Host "2.Agregar un usuario a un grupo."
    Write-Host "3.Ver miembros de un grupo."
    Write-Host "4.Borrar usuarios de un grupo."
    Write-Host "5.Borrar un grupo."
    Write-Host "6.Salir"
    Write-Host ""
    Write-Host "Si ninguna de las opciones anteriores es la correcta es porque este script no es el que buscabas..."
    Write-Host ""
    Write-Host ""

    $respuesta = Read-Host "Opción"
    Write-Host ""

    switch ($respuesta){
        1 {creargru}
        2 {agregarusugru}
        3 {vergru}
        4 {borrarusugru}
        5 {borrargru}
        6 {Write-Output "Gracias por usar este programa"
            $salir=1
        }
    }
}
