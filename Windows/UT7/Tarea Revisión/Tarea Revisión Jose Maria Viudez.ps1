function mosrc{
        Write-Host "Has elegido la opción 1"
        Get-SmbShare 
        sleep 5 
}
function crerc{
        Write-Host "Has elegido la opción 2"
        Write-Host "Estos son los recursos compartidos:"
        Get-SmbShare | ft name
        $recurso = Read-Host "Introduzca el nombre del recurso compartido"
        $ruta = Read-Host "Introduzca la ruta donde desea crearlo"
        Get-ADUser -Filter *
        $usu1 = Read-Host "Introduzca el nombre del usuario que quieras que tenga control total para acceder al recurso compartido"
        $usu2 = Read-Host "Introduzca el nombre del usuario que quieras que tenga permiso para cambiar el recurso compartido"
        $usu3 = Read-Host "Introduzca el nombre del usuario que quieras que tenga permiso para leer el recurso compartido"
        New-SmbShare -Name $recurso -Path $ruta -FullAccess $usu1 -ChangeAccess $usu2 -ReadAccess $usu3
}
function modrc{
        Write-Host "Has elegido la opción 3"
        Write-Host "Estos son los recursos compartidos:"
        Get-SmbShare | ft name
        $recurso = Read-Host "Introduzca el nombre del recurso compartido"
        $desc = Read-Host "Introduzca la descripción del recurso compartido"
        $usucon = Read-Host "Introduzca el límite de usuarios conectados"
        Set-SmbShare -Name $recurso -Description "$desc" -ConcurrentUserLimit $usucon -Force
}
function verprc{
        Write-Host "Has elegido la opción 4"
        $recurso = Read-Host "Introduzca el nombre del recurso compartido a ver"
        Get-SmbShareAccess -Name $recurso
        sleep 5 
}
function añaprc{
        Write-Host "Has elegido la opción 5"
        $recurso = Read-Host "Introduzca el nombre del recurso compartido"
        Get-SmbShareAccess -Name $recurso
        Write-Host "Si el recurso compartido existe, habrá aparecido anteriormente"
        Write-Host "Por el contrario, deberá crearlo con antelación habiendo elegido la opción 2 del script"
        Get-ADUser -Filter *
        $usuario = Read-Host "Introduzca el nombre de la cuenta del usuario"
        $acceso = Read-Host "Introduzca el derecho del acceso"
        Grant-SmbShareAccess -Name $recurso -AccountName $usuario -AccessRight $acceso -Force
        sleep 5 
}
function eliprc{
        Write-Host "Has elegido la opción 6"
        $recurso = Read-Host "Introduzca el nombre del recurso compartido"
        Get-SmbShareAccess -Name $recurso
        Write-Host "Si el recurso compartido existe, habrá aparecido anteriormente"
        Write-Host "Por el contrario, deberá crearlo con antelación habiendo elegido la opción 2 del script"
        Get-ADUser -Filter *
        $usuario = Read-Host "Introduzca el nombre de la cuenta del usuario"
        Revoke-SmbShareAccess -Name $recurso -AccountName $usuario -Force
        sleep 5 
}
function añaprcba{
        Write-Host "Has elegido la opción 7"
        $recurso = Read-Host "Introduzca el nombre del recurso compartido"
        Get-SmbShareAccess -Name $recurso
        Write-Host "Si el recurso compartido existe, habrá aparecido anteriormente"
        Write-Host "Por el contrario, deberá crearlo con antelación habiendo elegido la opción 2 del script"
        Get-ADUser -Filter *
        $usuario = Read-Host "Introduzca el nombre de la cuenta del usuario"
        Block-SmbShareAccess -Name $recurso -AccountName $usuario -Force
        sleep 5 
}
function eliprcda{
        Write-Host "Has elegido la opción 8"
        $recurso = Read-Host "Introduzca el nombre del recurso compartido"
        Get-SmbShareAccess -Name $recurso
        Write-Host "Si el recurso compartido existe, habrá aparecido anteriormente"
        Write-Host "Por el contrario, deberá crearlo con antelación habiendo elegido la opción 2 del script"
        Get-ADUser -Filter *
        $usuario = Read-Host "Introduzca el nombre de la cuenta del usuario"
        Unblock-SmbShareAccess -Name $recurso -AccountName $usuario -Force
        sleep 5 
}
function elirc{
        Write-Host "Has elegido la opción 9"
        Write-Host "Estos son los recursos compartidos:"
        Get-SmbShare | ft name
        $recurso = Read-Host "Introduzca el nombre del recurso compartido"
        Remove-SmbShare -Name $recurso -Force
}
function creur{
        Write-Host "Has elegido la opción 10"
        Write-Host "Estas son las unidades de red, aunque a veces no aparecen los creados recientemente:"
        Get-PSDrive
        $unired = Read-Host "Introduzca el nombre de la unidad de red"
        $ruta = Read-Host "Introduzca la ruta donde desea crearla"
        $datos = Read-Host "Introduzca el nombre de la estructura de datos"
        New-PSDrive -Name $unired -PSProvider $datos -Root "$ruta"
        sleep 5
}
function eliur{
        Write-Host "Has elegido la opción 11"
        Write-Host "Estas son las unidades de red, aunque a veces no aparecen los creados recientemente:"
        Get-PSDrive
        $unired = Read-Host "Introduzca el nombre de la unidad de red"
        Remove-PSDrive -Name $unired
}
$salir = 0
while ($salir -eq "0"){
    Clear-Host
    Write-Host ""
    Write-Host ""
    Write-Host "MENU GESTIÓN DE PERMISOS DE RECURSOS COMPARTIDOS JOSE MARIA VIUDEZ"
    Write-Host ""
    Write-Host "1.Mostrar información de los recursos compartidos."
    Write-Host ""
    Write-Host "2.Crear un recurso compartido."
    Write-Host ""
    Write-Host "3.Modificar un recurso compartido."
    Write-Host ""
    Write-Host "4.Ver los permisos de un recurso compartido."
    Write-Host ""
    Write-Host "5.Añadir los permisos de un recurso compartido."
    Write-Host ""
    Write-Host "6.Eliminar los permisos de un recurso compartido."
    Write-Host ""
    Write-Host "7.Añadir los permisos denegar de un recurso compartido (bloquear el acceso)."
    Write-Host ""
    Write-Host "8.Eliminar los permisos denegar de un recurso compartido (desbloquear el acceso)."
    Write-Host ""
    Write-Host "9.Eliminar un recurso compartido."
    Write-Host ""
    Write-Host "10.Crear unidad de red."
    Write-Host ""
    Write-Host "11.Eliminar unidad de red."
    Write-Host ""
    Write-Host "12.Salir"
    Write-Host ""
    Write-Host "Si ninguna de las opciones anteriores es la correcta es porque este script no es el que buscabas..."
    Write-Host ""
    Write-Host ""

    $respuesta = Read-Host "Opción"
    Write-Host ""

    switch ($respuesta){
        1 {mosrc}
        2 {crerc}
        3 {modrc}
        4 {verprc}
        5 {añaprc}
        6 {eliprc}
        7 {añaprcba}
        8 {eliprcda}
        9 {elirc}
        10 {creur}
        11 {eliur}
        12 {Write-Output "Gracias por usar este programa"
            $salir=1
        }
    }
}