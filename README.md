1. [PoshTestTCPing](#poshtesttcping)
   1. [Пример](#пример)
   2. [Установка](#установка)
   3. [Обновление](#обновление)
   4. [Удаление](#удаление)
   5. [Примеры использования](#примеры-использования)
      1. [Проверка локальной машины](#проверка-локальной-машины)
      2. [Проверка порта удалённой машины или сайта](#проверка-порта-удалённой-машины-или-сайта)
      3. [Проверка порта по списку, можно чередовать машины и сайты как угодно](#проверка-порта-по-списку-можно-чередовать-машины-и-сайты-как-угодно)
      4. [Пример тихой проверки, с выводом результата да/нет (bool)](#пример-тихой-проверки-с-выводом-результата-данет-bool)
      5. [Пример разливки папки на несколько машин](#пример-разливки-папки-на-несколько-машин)

# PoshTestTCPing
Маленький модуль для проверки доступности TCP порта. Работает значительно быстрее, чем его аналоги. Используется для массовой многопоточной проверки в других скриптах, например надо разлить пакет на тысячи машин за короткое время.

## Пример
```powershell
Clear-Host

$HostName = 'ya.ru'

$TestConnection = Measure-Command {
    Test-Connection -ComputerName $HostName -Count 1 -Quiet
}
("Test-Connection занял времени: " + $TestConnection.TotalMilliseconds + " мс. Но он не проверяет порт TCP")

$TestNetConnection = Measure-Command {
    Test-NetConnection -ComputerName $HostName -Port 443 -InformationLevel Quiet
}
("Test-NetConnection занял времени: " + $TestNetConnection.TotalMilliseconds + " мс")

$TestTCPing = Measure-Command {
    Test-TCPing -ComputerName $HostName -Port 443 -Quiet
}
("Test-TCPing занял времени: " + $TestTCPing.TotalMilliseconds + " мс")

### Результаты вывода
# Test-Connection занял времени: 17.5927 мс. Но он не проверяет порт TCP
# Test-NetConnection занял времени: 13.7518 мс
# Test-TCPing занял времени: 8.6522 мс
```
## Установка
```powershell
Install-Module -Name PoshTestTCPing
```
## Обновление
```powershell
Update-Module -Name PoshTestTCPing
```
## Удаление
```powershell
Uninstall-Module -Name PoshTestTCPing
```

## Примеры использования

### Проверка локальной машины
```powershell
Test-TCPing

### Результаты вывода
# ComputerName Port Ping Ping Time (ms) Description
# ------------ ---- ---- -------------- -----------
# MyLinux      135 True              0 Port is open
```
### Проверка порта удалённой машины или сайта
```powershell
Test-TCPing -ComputerName ya.ru -Port 443

### Результаты вывода
# ComputerName Port Ping Ping Time (ms) Description
# ------------ ---- ---- -------------- -----------
# ya.ru         443 True             65 Port is open
```
### Проверка порта по списку, можно чередовать машины и сайты как угодно
```powershell
$HostsList = 'google.ru','ya.ru','goog.ruu','github.com'
Test-TCPing $HostsList -Port 443

### Результаты вывода
# ComputerName Port Ping  Ping Time (ms) Description
# ------------ ---- ----  -------------- -----------
# google.ru     443 True              75 Port is open
# ya.ru         443 True              62 Port is open
# goog.ruu      443 False             84 Error: Этот хост неизвестен
# github.com    443 True             111 Port is open
```
### Пример тихой проверки, с выводом результата да/нет (bool)
```powershell
Test-TCPing -ComputerName ya.ru -Port 443 -Quiet

### Результаты вывода
# True

### Проверим тип объекта в ответе
#(Test-TCPing -ComputerName ya.ru -Port 443 -Quiet).GetType()
### Результаты вывода
# IsPublic IsSerial Name                                     BaseType
# -------- -------- ----                                     --------
# True     True     Boolean                                  System.ValueType
```
### Пример разливки папки на несколько машин
```powershell
Clear-Host

$HostNames = 'server01','server02','server03'

$Results = @()
foreach ($HostName in $HostNames)
{
    $IsPing = $null
    $IsPing = Test-TCPing -ComputerName $HostName -Port 445 -Quiet

    if ($IsPing)
    {
        $CopyFrom = 'C:\Distribs\DiagTools'
        $CopyTo = ("\\" + $HostName + "C$\Distribs\DiagTools")
        $ArgumentList = "`"$CopyFrom`" `"$CopyTo`" /ZB /E"
        $Robocopy = Start-Process robocopy -ArgumentList $ArgumentList -Wait -PassThru -WindowStyle Hidden
    }
    
    $HashTable = [ordered]@{
        'ComputerName' = $HostName
        'isPing' = $IsPing
        'Robocopy Exitcode' = $Robocopy.ExitCode
    }
    $Results += New-Object -TypeName PSObject -Property $HashTable
}

$Results
```