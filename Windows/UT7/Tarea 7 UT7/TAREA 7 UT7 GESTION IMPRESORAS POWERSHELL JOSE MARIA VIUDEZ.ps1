function gpr{
        Write-Host "Has elegido la opción 1"
        Get-Printer | Format-List
        sleep 5
}
function gpd{
        Write-Host "Has elegido la opción 2"
        Get-PrinterDriver | Format-List
        sleep 5
}
function apd{
        Write-Host "Has elegido la opción 3"
        $driver = Read-Host "Introduzca el nombre del controlador de impresión"
        Add-PrinterDriver -Name "$driver"
}
function app{
        Write-Host "Has elegido la opción 4"
        $puerto = Read-Host "Introduzca el nombre del puerto de impresión"
        Add-PrinterPort -Name "$puerto"
}
function ap{
        Write-Host "Has elegido la opción 5"
        $impresora = Read-Host "Introduzca el nombre de la impresora"
        $driver = Read-Host "Introduzca el nombre del controlador de impresión"
        $puerto = Read-Host "Introduzca el nombre del puerto de impresión"
        Add-Printer -Name "$impresora" -DriverName "$driver" -PortName "$puerto"
}
function spr{
        Write-Host "Has elegido la opción 6"
        $propiedad = Read-Host "Introduzca el nombre de la propiedad de la impresora"
        Set-Printer -Name "$propiedad" -KeepPrintedJobs $True
}
function rpr{
        Write-Host "Has elegido la opción 7"
        $impresora = Read-Host "Introduzca el nombre de la impresora"
        Remove-Printer -Name "$impresora"
}
function rpd{
        Write-Host "Has elegido la opción 8"
        $driver = Read-Host "Introduzca el nombre del controlador de impresora"
        Remove-PrinterDriver -Name "$driver"
}
function rpp{
        Write-Host "Has elegido la opción 9"
        $puerto = Read-Host "Introduzca el nombre del puerto de impresora"
        Remove-PrinterPort -Name "$puerto"
}
$salir = 0
while ($salir -eq "0"){
    Clear-Host
    Write-Host ""
    Write-Host ""
    Write-Host "MENU GESTIÓN DE IMPRESORAS JOSE MARIA VIUDEZ"
    Write-Host ""
    Write-Host "1.Mostrar las impresoras instaladas en el equipo."
    Write-Host ""
    Write-Host "2.Mostrar los controladores de impresión instalados."
    Write-Host ""
    Write-Host "3.Instalar un controlador de impresión."
    Write-Host ""
    Write-Host "4.Instalar un puerto de impresión."
    Write-Host ""
    Write-Host "5.Instalar una impresora."
    Write-Host ""
    Write-Host "6.Modificar/actualizar una propiedad de la impresora."
    Write-Host ""
    Write-Host "7.Eliminar una impresora."
    Write-Host ""
    Write-Host "8.Eliminar un controlador de impresora."
    Write-Host ""
    Write-Host "9.Eliminar un puerto de impresora."
    Write-Host ""
    Write-Host "10.Salir"
    Write-Host ""
    Write-Host "Si ninguna de las opciones anteriores es la correcta es porque este script no es el que buscabas..."
    Write-Host ""
    Write-Host ""

    $respuesta = Read-Host "Opción"
    Write-Host ""

    switch ($respuesta){
        1 {gpr}
        2 {gpd}
        3 {apd}
        4 {app}
        5 {ap}
        6 {spr}
        7 {rpr}
        8 {rpd}
        9 {rpp}
        10 {Write-Output "Gracias por usar este programa"
            $salir=1
        }
    }
}