Clear-Host

$ManifestPath = Join-Path $PSScriptRoot 'PoshTestTCPing\PoshTestTCPing.psd1'

$Description = '
A small module for checking the availability of a TCP port. It works much faster than its counterparts. It is used for mass multi-threaded checking in other scripts, for example, it is necessary to spill a package to thousands of machines in a short time.
Маленький модуль для проверки доступности TCP порта. Работает значительно быстрее, чем его аналоги. Используется для массовой многопоточной проверки в других скриптах, например надо разлить пакет на тысячи машин за короткое время.
'

$ReleaseNotes = '
## v1.0.1
Баг: поправил файл psm1
'

$GUID = 'a326b8ec-edb5-48eb-a408-5335b212e6df'

New-ModuleManifest -Path $ManifestPath `
-Author 'Pasha Lvov' `
-Copyright '© 2022 pashalvov' `
-RootModule 'PoshTestTCPing.psm1' `
-Guid $GUID `
-ModuleVersion '1.0.1' `
-Description $Description `
-PowerShellVersion '5.1' `
-FileList 'PoshTestTCPing.deps.json','PoshTestTCPing.dll','PoshTestTCPing.Format.ps1xml','PoshTestTCPing.pdb','PoshTestTCPing.psm1','PoshTestTCPing.psd1' `
-CmdletsToExport 'Test-TCPing' `
-Tags 'Ping', 'TCP', 'Network', 'Multithreaded-helpers' `
-ProjectUri 'https://github.com/pashalvov/PoshTestTCPing' `
-LicenseUri 'https://github.com/pashalvov/PoshTestTCPing/blob/master/LICENSE' `
-IconUri 'https://zabbix.lvovpd.ru/assets/img/network.png' `
-HelpInfoUri 'https://github.com/pashalvov/PoshTestTCPing' `
-ReleaseNotes $ReleaseNotes

Test-ModuleManifest $ManifestPath