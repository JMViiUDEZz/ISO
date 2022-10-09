function mover-di{
     Write-Output "Mover directorio" #Ejecuta la orden de mover directorio
     Write-Output "Introducir el directorio donde queremos mover"
     $directorio= Read-Host
     $directorioinicial= Get-Location #Donde se localiza el directorio
     if (Test-Path $directorio){     #Comprueba que existe el directorio
           cd $directorio
           Write-Output "Se ha movido al $directorio"
           cd $directorioinicial
     }
     else{
       Write-Output "El directorio no existe"
     }
}

function listar-di{
     Write-Output "listar directorio" #Ejecuta la orden de listar directorio
     Write-Output "Introducir el directorio donde queremos Listar"
     $directorio= Read-Host
     if (Test-Path $directorio){ #Comprueba que existe el directorio
           dir $directorio
     }
     else{
       Write-Output "El directorio no existe"
     }
}

function crear-di{
     Write-Output "crear directorio" #Ejecuta la orden de crear directorio
     Write-Output "Introducir el directorio donde queremos crear"
     $directorio= Read-Host
     if (Test-Path $directorio){ #Comprueba que el directorio existe
       Write-Output "El directorio existe"
     }
     else{
       New-Item $directorio -type d #Crea un nuevo directorio
     }
}

function borrar-di{
     Write-Output "borrar directorio" #Crea la función de borrar directorio
     Write-Output "Introducir el directorio donde queremos borrar"
     $directorio= Read-Host
     if (Test-Path $directorio){ #Comprueba que el directorio se ha borrado
           rmdir $directorio
           Write-Output "El directorio $directorio se ha borrado"
     }
     else{ #Comprueba que el directorio existe
       Write-Output "El directorio no existe"
     }
}

$salir=0
while ($salir -eq "0"){ #Muestra las órdenes que se quieren ejecutar
    write-output "Menu"
    write-output "----------------------------------"
    Write-Output "1 Crear directorio"
    Write-Output "2 Borrar directorio"
    Write-Output "3 listar directorio"
    Write-Output "4 salir"
    Write-Output "5 mover directorio"
    write-Output "Introduce una de las operaciones: "
    $menu= Read-host
    switch ($menu) {
        1 { crear-di }
        2 { borrar-di }
        3 { listar-di }
        4 { Write-Output "Gracias por usar este programa"
            $salir=1
        }
        5 { mover-di } 
    }
}


