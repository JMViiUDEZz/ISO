# GESTIÓN DE DISCOS BÁSICOS
$salir = 0
while ($salir -eq "0") {
    Write-Output "Menu"
    Write-Output "--------------------------------"
    Write-Output "1 Ver el tipo de tabla de particiones"
    Write-Output "2 Mostrar información sobre los discos"
    Write-Output "3 Crear una partición sobre uno de los discos de tamaño de 1/4 del tamaño total"
    Write-Output "4 Dar formato a la partición anterior"
    Write-Output "5 Listar particiones del sistema"
    Write-Output "6 Listar el nombre de las unidades de las particiones"
    Write-Output "7 Chequee un disco"
    Write-Output "8 Cree una cuota de disco para un usuario con un valor de 1 GB y límite 0,95 GB"
    Write-Output "9 Salir"
    Write-Output "Introduce una de las opciones: "
    $menu = Read-Host
    switch ($menu) {
        1 { ver-tabla }
        2 { mostrar-info }
        3 { crear-part }
        4 { dar-formato }
        5 { listar-part }
        6 { listar-unid }
        7 { chequee-disco }
        8 { crear-cuota }
        9 { Write-Output "Gracias por usar este programa" 
            $salir = 1
        }
    }

}

function ver-tabla {
    Write-Output "Ver el tipo de tabla de particiones"
    Write-Output "Introducir el disco donde queremos ver el tipo de tabla de particiones"
    $disco = Read-Host
    if (Test-Path $disco) {
        (Get-Disk).PartitionStyle 
    } else {
        Write-Output "El disco no existe"
    }
}

function mostrar-info {
    Write-Output "Mostrar información sobre los discos"
    Write-Output "Introducir el disco del que queremos información"
    $disco = Read-Host
    if (Test-Path $disco) {
        Get-Disk
    } else {
        Write-Output "El disco no existe"
    }
}

function creat-part {
    Write-Output "Crear una partición sobre uno de los discos de tamaño de 1/4 del tamaño total"
    Write-Output "Introducir el disco donde queremos crear la partición"
    $disco = Read-Host 
    if (Test-Path $disco) {
        New-Partition -DiskNumber $disco -Size 512MB
    } else {
        Write-Output "El disco no existe"
    }
}

function dar-formato {
    Write-Output "Dar formato a la partición anterior"
    Write-Output "Introducir la partición"
    $particion = Read-Host
    if (Test-Path $particion) {
        Format-Volume
    } else {
        Write-Output "La partición no existe"
    }
}

function listar-part {
    Write-Output "Listar particiones del sistema"
    
    if (Test-Path) {
        Get-Partition 
    } else {
        Write-Output "La particion no existe"
    }
}

function listar-unid {
    Write-Output "Listar el nombre de las unidades de las particiones"
    Write-Output "Introducir el disco"
    $disco = Read-Host
    if (Test-Path $disco) {
        Get-Partition | Select-Object DriveLetter
    } else {
        Write-Output "El disco no existe"
    }
}

function chequee-disco {
    Write-Output "Chequee un disco"
    Write-Output "Introducir el disco donde chequear"
    $disco = Read-Host
    if (Test-Path $disco) {
        chkdsk $disco
    } else {
        Write-Output "El disco no existe"
    }
}

function crear-cuota {
    Write-Output "Cree una cuota de disco para un usuario con un valor de 1 GB y límite 0,95 GB"
    Write-Output "Introducir el disco donde crear una cuota"
    $disco = Read-Host
    $usuario = Read-Host
    if (Test-Path $disco) {
        fsutil quota modify $disco 1000 950 $usuario
    } else {
        Write-Output "El disco o usuario no existe"
    }
}