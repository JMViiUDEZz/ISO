function copia{
        Write-Host "Has elegido la opcion 1. Crear una copia de un directorio"      
        $ruta = Read-Host "Direccion"
        $nombre_directorio = Read-Host "Nombre del directorio, es recomendable utilizar este formato: fecha-nombre_directorio"
        $nombre_mayuscula = $nombre_directorio.ToUpper()
        Copy-Item -Path "$ruta" -Destination "C:\backup"
        Compress-Archive -Path "C:\backup" -DestinationPath "C:\backup\$nombre_mayuscula.zip"
}
function restaurar{
        Write-Host "Has elegido la opcion 2. Restaurar la copia de un directorio"
        $rutadestino = Read-Host "Direccion de destino donde restaurar"
        $nombre_directorio = Read-Host "Nombre del directorio"
        $nombre_mayuscula = $nombre_directorio.ToUpper()
        Expand-Archive -LiteralPath "C:\backup\$nombre_mayuscula.zip" -DestinationPath "C:\backup\$nombre_mayuscula"
}
function copiaprogramada{
        Write-Host "Has elegido la opcion 3. Crear una tarea programada para realizar la copia"
        Write-Host "La ruta del script de la tarea programada, o debe tener una misma ruta o puedes modificarla a donde quieras tener tu el script."
        $action = New-ScheduledTaskAction -Execute "C:\Users\Viudez\Desktop\script_copia_seguridad_1_Jose_Maria_Viudez\tarea_programada_jmv.ps1" #La ruta se debe actualizar dependiendo de donde se ubique el segundo script en tu equipo.
        $trigger = New-ScheduledTaskTrigger -Weekly -WeeksInterval 1 -DaysOfWeek Sunday -At 2am
        $user = Read-Host "Nombre de Usuario"
        $settings = New-ScheduledTaskSettingsSet
        Register-ScheduledTask -Action $action -Trigger $trigger -User $user -TaskPath "Copia De Seguridad Programada" -Description "Realiza una tarea programada para que realice la copia del directorio de un usuario todos las semanas a las 2:00 "             
}

$salir = 0
while ($salir -eq "0"){
    Clear-Host
    Write-Host ""
    Write-Host ""
    Write-Host "       Menu Copias De Seguridad      "
    Write-Host ""
    Write-Host "1.Crear una copia de un directorio"
    Write-Host "2.Restaurar una copia de un directorio"
    Write-Host "3.Crear una tarea programada para realizar una copia del directorio de un usuario"
    Write-Host "4.Salir"
    Write-Host ""
    Write-Host "Si ninguna de las opciones anteriores es la correcta es porque este script no es el que buscabas"
    Write-Host ""
    Write-Host ""

    $respuesta = Read-Host "Opción"
    Write-Host ""

    switch ($respuesta){
        1 {copia}
        2 {restaurar}
        3 {copiaprogramada}
        4 {Write-Output "Gracias por usar este programa"
            $salir=1
        }
    }
}

