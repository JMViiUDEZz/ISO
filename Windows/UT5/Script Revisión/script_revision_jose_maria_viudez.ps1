function proceso{
        Write-Host "Has elegido la opción 1"
        Get-Process | more
        $proceso = Read-Host "Introduzca el proceso que desea parar"     
        Get-Process -Name $proceso | Stop-Process
}
function servicio{
        Write-Host "Has elegido la opción 2"
        Get-Service | more
        sleep 10
}
function red{
        Write-Host "Has elegido la opción 3"
        Get-NetIPConfiguration | more
        sleep 10
        Test-Connection www.google.es 
        sleep 10
} 
function puerto{
        Write-Host "Has elegido la opción 4"      
        Get-NetUDPEndpoint | Select-Object LocalPort
        sleep 10
        Get-NetTCPConnection | Select-Object LocalPort
        sleep 10
}
function usuario{
        Write-Host "Has elegido la opción 5"
        $nombre_usuario = Read-Host "Introduzca el nombre del usuario"
        $nombre_completo = Read-Host "Introduzca el nombre completo"
        $descripcion = Read-Host "Introduzca la descripción del usuario"
        $password= ConvertTo-SecureString –AsPlainText -Force -String kamisama123@@
        New-LocalUser -Name $nombre_usuario -Description $descripcion -FullName $nombre_completo -Password $password
}
function grupo{
        Write-Host "Has elegido la opción 6"
        $nombre_grupo = Read-Host "Introduzca el nombre del grupo"
        New-LocalGroup $nombre_grupo
}
function usugrupo{
        Write-Host "Has elegido la opción 7"
        Get-LocalUser| more
        $nombre_usuario1 = Read-Host "Indica el primer usuario a añadir"
        $nombre_usuario2 = Read-Host "Indica el segundo usuario a añadir"
        $nombre_grupo = Read-Host "Indica el grupo a asignar"
        Add-LocalGroupMember $nombre_grupo -Member $nombre_usuario1         
        Add-LocalGroupMember $nombre_grupo -Member $nombre_usuario2     
}              
function moverdi{
        Write-Host "Has elegido la opción 8"
        Write-Output "Introduzca el directorio donde queremos mover"
        $directorio= Read-Host
        $directorioinicial= Get-Location
        if (Test-Path $directorio){  
            cd $directorio
            Write-Output "Se ha movido al $directorio"
            cd $directorioinicial
     }
     else{
           Write-Output "El directorio no existe"
     }
}
function listardi{
       Write-Output "Has elegido la opción 9"
       Write-Output "Introduzca el directorio donde queremos listar"
       $directorio= Read-Host
       if (Test-Path $directorio){ 
           dir $directorio | more
           sleep 10
     }
     else{
       Write-Output "El directorio no existe"
     }
}
function fichero{
        Write-Host "Has elegido la opción 10"
        $nombre = Read-Host "Introduzca el nombre del archivo"
        $nombre_mayuscula = $nombre.ToUpper()
        New-Item -Path "C:\$nombre_mayuscula.txt" -ItemType File   
        $contenido = Read-Host "Añade contenido al archivo"
        Add-Content -Path "C:\$nombre_mayuscula.txt" -Value $contenido   
}
function rendimiento{
        Write-Host "Has elegido la opción 11"
        Get-CimInstance -ClassName Win32_ComputerSystem 
        sleep 10
        Get-Counter
        sleep 10
        Get-EventLog -List
        sleep 10

}
function disco{
        Write-Host "Has elegido la opción 12"      
        Get-Disk
        sleep 10     
        Get-Partition
        sleep 10
}
function copiacomprimida{
        Write-Host "Has elegido la opción 13"
        $nombre_directorio = Read-Host "Introduzca el nombre del directorio"     
        $usuario = Read-Host "Introduzca el nombre de usuario"
        Copy-Item -Path "C:\Users\$usuario\*" -Destination "C:\copias"
        Compress-Archive -Path "C:\copias" -DestinationPath "C:\copias\$nombre_directorio.zip"
}
$salir = 0
while ($salir -eq "0"){
    Clear-Host
    Write-Host ""
    Write-Host ""
    Write-Host "               Menu de José María Viúdez              "
    Write-Host ""
    Write-Host "1.Visualizar procesos y parar uno de ellos."
    Write-Host "2.Visualizar los servicios que están en ejecución."
    Write-Host "3.Visualizar la configuración de red y comprobar la conectividad a internet."
    Write-Host "4.Visualizar los puertos que estén abiertos."
    Write-Host "5.Crear un usuario y añadir una contraseña generada aleatoriamente."
    Write-Host "6.Crear un grupo."
    Write-Host "7.Asignarle 2 usuarios a un grupo."
    Write-Host "8.Moverser a un directorio."
    Write-Host "9.Visualizar su contenido de manera recursiva y volver al directorio inicial."
    Write-Host "10.Crear un fichero, añadir contenido al fichero y cambiarle el nombre todo a mayúsculas."
    Write-Host "11.Visualice el nombre del equipo, el rendimiento y los eventos."
    Write-Host "12.Mostrar la información de todos los discos y listar las particiones de cada uno."
    Write-Host "13.Crear una copia comprimida del directorio personal de cada usuario y almacenarla en un directorio llamado copias (estará localizado en C)."
    Write-Host "14.Salir"
    Write-Host ""
    Write-Host "Si ninguna de las opciones anteriores es la correcta es porque este script no es el que buscabas..."
    Write-Host ""
    Write-Host ""

    $respuesta = Read-Host "Opción"
    Write-Host ""

    switch ($respuesta){
        1 {proceso}
        2 {servicio}
        3 {red}
        4 {puerto}
        5 {usuario}
        6 {grupo}
        7 {usugrupo}
        8 {moverdi}
        9 {listardi}
        10 {fichero}
        11 {rendimiento}
        12 {disco}
        13 {copiacomprimida}
        14 {Write-Output "Gracias por usar este programa"
            $salir=1
        }
    }
}
