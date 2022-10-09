Get-Command -Module GroupPolicy
New-GPO -Name "MyAsir7.com" -Comment "My GPO Asir7.com"
Set-GPRegistryValue -Name "MyAsir7.com" -Key "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" -ValueName ScreenSaveTimeOut -Type DWord -Value 900
New-GPLink -Name "MyAsir7.com" -Target "ou=1ºASIR,dc=Asir7,dc=com"

Get-GPO -Name "MyAsir7.com" | Get-GPOReport -ReportType HTML -Path $Home\report.html
Invoke-Item $Home\report.html

# Configure Advanced Settings
## Inherited Group Policies
Get-GPInheritance -Target "ou=1ºASIR,dc=Asir7,dc=com"

## Blocking inheritance
Set-GPInheritance -Target "ou=1ºASIR,dc=Asir7,dc=com" -IsBlocked 1

## Enforcing Group Policies
Set-GPLink -Name "Default Domain Policy" -Target "dc=Asir7,dc=com" -Enforced Yes

## Configure Security Settings
Set-GPPermission -Name "MyAsir7.com" -TargetName "Administrador" -TargetType User -PermissionLevel None
Set-GPPermission -Name "MyAsir7.com" -TargetName "Administrador" -TargetType User -PermissionLevel GPORead
Set-GPPermission -Name "MyAsir7.com" -TargetName "Administrador" -TargetType User -PermissionLevel GPOApply