function añadir{
        Write-Host "Has elegido la opción 1"
        $equipo = Read-Host "Introduzca el nombre del equipo"
        new-adcomputer -name $equipo
}
function eliminar{
        Write-Host "Has elegido la opción 2"
        $equipo = Read-Host "Introduzca el nombre del equipo"
        remove-adcomputer -identity $equipo
}
$salir = 0
while ($salir -eq "0"){
    Clear-Host
    Write-Host ""
    Write-Host ""
    Write-Host "MENU EQUIPOS DE DOMINIO JOSE MARIA VIUDEZ"
    Write-Host ""
    Write-Host "1.Añadir un equipo en un dominio."
    Write-Host ""
    Write-Host "2.Eliminar un equipo en un dominio."
    Write-Host ""
    Write-Host "3.Salir"
    Write-Host ""
    Write-Host "Si ninguna de las opciones anteriores es la correcta es porque este script no es el que buscabas..."
    Write-Host ""
    Write-Host ""

    $respuesta = Read-Host "Opción"
    Write-Host ""

    switch ($respuesta){
        1 {añadir}
        2 {eliminar}
        3 {Write-Output "Gracias por usar este programa"
            $salir=1
        }
    }
}
