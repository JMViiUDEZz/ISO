function ver{
        Write-Host "Has elegido la opción 1"
        $ruta = Read-Host "Introduzca la ruta de la carpeta"
        Get-Acl -Path "$ruta" | Select-Object -ExpandProperty Access | ft -AutoSize
        sleep 5
}
function añadir{
        Write-Host "Has elegido la opción 2"
        $ruta = Read-Host "Introduzca la ruta de la carpeta"
        $usu = Read-Host "Introduzca el nombre del usuario"
        $permiso = Read-Host "Introduzca el permiso"
        $ACL = Get-Acl -Path "$ruta"
        $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule ("$usu","$permiso","Allow")
        $ACL.SetAccessRule($AccessRule)
        $ACL | Set-Acl -Path "$ruta"
}
function borrar{
        Write-Host "Has elegido la opción 3"
        $ruta = Read-Host "Introduzca la ruta de la carpeta"
        $usu = Read-Host "Introduzca el nombre del usuario"
        $permiso = Read-Host "Introduzca el permiso"
        $ACL = Get-Acl -Path "$ruta"
        $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule ("$usu","$permiso","Allow")
        $ACL.RemoveAccessRule($AccessRule)
        $ACL | Set-Acl -Path "$ruta"
}
function copiar{
        Write-Host "Has elegido la opción 4"
        $ruta1 = Read-Host "Introduzca la ruta de la carpeta de dónde desea copiarlos"
        $ruta2 = Read-Host "Introduzca la ruta de la carpeta a dónde desea pegarlos" 
        Get-Acl -Path "$ruta1" | Set-Acl -Path "$ruta2"
}
function deshabheren{
        Write-Host "Has elegido la opción 5"   
        $ruta = Read-Host "Introduzca la ruta de la carpeta"
        $ACL = Get-Acl -Path "$ruta"
        $ACL.SetAccessRuleProtection($true,$true)
        $ACL | Set-Acl -Path "$ruta"
        (Get-Acl -Path "$ruta").Access | Format-Table IdentityReference,FyleSystemRights,AccessControlType,IsInherited,InheritanceFlags -AutoSize
        sleep 5
}
function cambprop{
        Write-Host "Has elegido la opción 6" 
        $ruta = Read-Host "Introduzca la ruta de la carpeta"
        $usu = Read-Host "Introduzca el nombre del usuario"
        $ACL = Get-Acl -Path "$ruta"
        $User = New-Object System.Security.Principal.NTAccount ("$usu")
        $ACL.SetOwner($User)
        $ACL | Set-Acl -Path "$ruta"
}
$salir = 0
while ($salir -eq "0"){
    Clear-Host
    Write-Host ""
    Write-Host ""
    Write-Host "MENU ADMINISTRACIÓN DE PERMISOS SOBRE UNA CARPETA JOSE MARIA VIUDEZ"
    Write-Host ""
    Write-Host "1.Ver permisos."
    Write-Host ""
    Write-Host "2.Añadir permisos."
    Write-Host ""
    Write-Host "3.Borrar permisos."
    Write-Host ""
    Write-Host "4.Copiar permisos."
    Write-Host ""
    Write-Host "5.Deshabilitar herencia."
    Write-Host ""
    Write-Host "6.Cambiar propietario."
    Write-Host ""
    Write-Host "7.Salir"
    Write-Host ""
    Write-Host "Si ninguna de las opciones anteriores es la correcta es porque este script no es el que buscabas..."
    Write-Host ""
    Write-Host ""

    $respuesta = Read-Host "Opción"
    Write-Host ""

    switch ($respuesta){
        1 {ver}
        2 {añadir}
        3 {borrar}
        4 {copiar}
        5 {deshabheren}
        6 {cambprop}
        7 {Write-Output "Gracias por usar este programa"
            $salir=1
        }
    }
}
