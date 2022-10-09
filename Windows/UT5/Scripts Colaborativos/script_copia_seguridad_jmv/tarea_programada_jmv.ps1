$user = Read-Host "Nombre de Usuario"
Copy-Item -Path "C:\Users\$user" -Destination "C:\backup"