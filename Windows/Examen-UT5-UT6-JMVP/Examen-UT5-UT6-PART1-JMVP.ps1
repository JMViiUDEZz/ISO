function crearuo{
        Write-Host "Has elegido la opción 1"
        Write-Host ""
        Write-Host "A continuación, se mostrarán todas las unidades organizativas"
        sleep 5       
        Get-ADOrganizationalUnit -Filter *
        sleep 5
        $uo = Read-Host "Introduzca el nombre de la unidad organizativa"     
        New-ADOrganizationalUnit -Name $uo
}
function crearusuuo{
        Write-Host "Has elegido la opción 2"
        Write-Host ""
        Write-Host "A continuación, se mostrarán todos los usuarios"
        sleep 5
        Get-ADUser -Filter *
        sleep 5
        $usu = Read-Host "Introduzca el nombre del usuario"
        Write-Host "A continuación, se mostrarán todas las unidades organizativas"
        Get-ADOrganizationalUnit -Filter *
        sleep 5
        $uo = Read-Host "Introduzca el nombre de la unidad organizativa" 
        $d1 = Read-Host "Introduzca el primer nombre del dominio" 
        $d2 = Read-Host "Introduzca el segundo nombre del dominio"
        New-ADUser -Name $usu -Path “OU=$uo,DC=$d1,DC=$d2”

}
function borrarusu{
        Write-Host "Has elegido la opción 3"
        Write-Host ""
        Write-Host "A continuación, se mostrarán todos los usuarios"
        sleep 5
        Get-ADUser -Filter *
        sleep 5
        $usu = Read-Host "Introduzca el nombre del usuario"
        Remove-ADUser -Identity $usu
}
function creargrulocusu{
        Write-Host "Has elegido la opción 4" 
        Write-Host ""
        Write-Host "A continuación, se mostrarán todos los grupos"
        sleep 5
        Get-ADGroup -Filter *
        sleep 5
        $gru = Read-Host "Introduzca el nombre del grupo"
        New-ADGroup -Name $gru -GroupCategory Security -GroupScope DomainLocal
        Write-Host "A continuación, se mostrarán todos los usuarios"
        Get-ADUser -Filter *
        sleep 5
        $usu1 = Read-Host "Introduzca el nombre del primer usuario"
        $usu2 = Read-Host "Introduzca el nombre del segundo usuario"
        Add-ADGroupMember –Identity $gru –Members $usu1,$usu2
}
function borrargru{
        Write-Host "Has elegido la opción 5"   
        Write-Host ""
        Write-Host "A continuación, se mostrarán todos los grupos"
        sleep 5
        Get-ADGroup -Filter *
        sleep 5   
        $gru = Read-Host "Introduzca el nombre del grupo"
        Remove-ADGroup -Identity $gru
}
function ins{
        Write-Host "Has elegido la opción 6" 
        Write-Host ""  
        Write-Host "A continuación, se mostrarán las instrucciones:"
        Write-Host ""
        Write-Host "- Cada operación debe realizarse en una función"
        Write-Host "- Las distintas operaciones deben mostrarse en un menú"
        Write-Host "- El script debe repetirse mientras se elija una opción correcta"
        Write-Host "- Los nombres de unidades organizativas, usuarios y grupos se solicitarán y se
almacenarán en variables"
        sleep 10
}
$salir = 0
while ($salir -eq "0"){
    Clear-Host
    Write-Host ""
    Write-Host ""
    Write-Host "Menu Examen José María Viúdez"
    Write-Host ""
    Write-Host "1.Crear una unidad organizativa."
    Write-Host ""
    Write-Host "2.Crear un usuario y añadirlo a una unidad organizativa."
    Write-Host ""
    Write-Host "3.Borrar un usuario."
    Write-Host ""
    Write-Host "4.Crear un grupo de usuarios de dominio local y añadir 2 usuarios."
    Write-Host ""
    Write-Host "5.Borrar un grupo."
    Write-Host ""
    Write-Host "6.Mostrar las instrucciones utilizadas para crear el script."
    Write-Host ""
    Write-Host "7.Salir"
    Write-Host ""
    Write-Host "Si ninguna de las opciones anteriores es la correcta es porque este script no es el que buscabas..."
    Write-Host ""
    Write-Host ""

    $respuesta = Read-Host "Opción"
    Write-Host ""

    switch ($respuesta){
        1 {crearuo}
        2 {crearusuuo}
        3 {borrarusu}
        4 {creargrulocusu}
        5 {borrargru}
        6 {ins}
        7 {Write-Output "Gracias por usar este programa"
            $salir=1
        }
    }
}
