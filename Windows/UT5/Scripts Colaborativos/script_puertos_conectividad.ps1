Function mostrarMenu {
    Clear-Host
    Write-Host "Menú"
    Write-Host "1. Puertos"
    Write-Host "2. Conectividad"
    Write-Host "3. Salir"
}

Function permitirPuerto {
    $puerto = Read-Host -Prompt "Escribe el puerto para permitir"
    $tipoPuerto = Read-Host -Prompt "Escribe el tipo de puerto: TCP o UDP"
    New-NetFirewallRule -DisplayName "Permitir puerto $puerto $tipoPuerto" -Direction inbound -Profile Any -Action Allow -LocalPort $puerto -Protocol $tipoPuerto
    $puertosEscuchando = Get-NetTCPConnection -State Listen | Select-Object -Property LocalPort, State | Format-Table -AutoSize
    $puertosEscuchando
}

Function verConectividad {
    [uint16]$primerNumero = Read-Host -Prompt "Introduce el número final del rango IP 192.168.11" 
    [uint16]$ultimoNumero = Read-Host -Prompt "Introduce el número final del rango IP 192.168.11"
    Write-Host "------------------------------";
    Write-Host "Comprobando rango IPs 192.168.11.$primerNumero - 192.168.11.$ultimoNumero"
    while ($primerNumero -le $ultimoNumero) {
    Test-Netconnection -ComputerName 192.168.11.$primerNumero -Port 25
    $primerNumero++
    }

}
 
mostrarMenu
 
while(($seleccion = Read-Host -Prompt "Selecciona una opción") -ne "3"){
 
switch($seleccion){
        1 {
            Clear-Host
            Write-Host "------------------------------";
            Write-Host "Puertos"; 
            Write-Host "------------------------------";
            permitirPuerto
            pause;
            break
        }

        2 {
            Clear-Host
            Write-Host "------------------------------";
            Write-Host "Conectividad";
            Write-Host "------------------------------";
            verConectividad
            pause; 
            break
        }

        3 {"Exit"; break}
        default {Write-Host -ForegroundColor red -BackgroundColor white "Opción inválida"; pause}
        
    }

mostrarMenu
}