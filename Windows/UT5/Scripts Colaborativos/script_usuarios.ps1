$tabla_usuario=@{
"Juan"=@{nombre="juan";cuenta="juan";contrasena="1234"};
"Ana"=@{nombre="Ana";cuenta="Ana";contrasena="1234"};
"Bryan"=@{nombre="Bryan";cuenta="Bryan";contrasena="1234"}
}
$valor=0
while ($valor -ne 5){
Write-Output "Menu de gestion de un usuario"
Write-Output "-----------------------------------------"
Write-Output " 1 Listar usuarios"
Write-Output " 2 Crear usuarios"
Write-Output " 3 Elimina usuarios"
Write-Output " 4 Modifica usuarios"
Write-Output " 5 Salir"
$valor=Read-Host
switch($valor){
1{
Write-Output " Mostar usuarios"
Write-Output "-----------------------------------------"
foreach($usuario in $tabla_usuario.GetEnumerator()){
Write-Output $usuario.key
write-output $($usuario.Value["cuenta"])
write-output $($usuario.Value["contrasena"])
Write-Output "-----------------------------------------"
}
}
2{ Write-Output " Crear usuario"
Write-Output "-----------------------------------------"
Write-Output "Introduce el nombre del usuario: "
$usuario=Read-Host
Write-Output "Introduce la cuenta de usuario:"
$cuenta=Read-Host
Write-Output "Introduce la contraseña de usuario:"
$contra=Read-Host
$tabla_usuario=@{$usuario=@{nombre=$usuario;cuenta=$cuenta;contrasena=$contra}}
}
3{ Write-Output " Borrar usuario"
Write-Output "-----------------------------------------"
write-output "Introduce el usuario que quieres eliminar."
$usuario= read-host
if($tabla_usuario.ContainsKey($usuario)) {
write-output " El usuario se ha eliminado:"
$tabla_usuario.Remove($usuario)
}
else{Write-Output "El usuario introducido no existe"
}
}
#4{ Write-Output " Mdificar el usuario"
#Write-Output "-----------------------------------------"
#$usuario= read-host
#$Password = Read-Host "INGRESE EL NUEVO PASSWORD" -AsSecureString
#$UserAccount = Get-LocalUser -Name $tabla_usuario
#$UserAccount | Set-LocalUser -Password $Password
#}
}
 Write-Output " Has salido del programa."
}