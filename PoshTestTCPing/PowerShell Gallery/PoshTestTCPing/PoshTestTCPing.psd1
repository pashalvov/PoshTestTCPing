#
# Манифест модуля для модуля "PoshTestTCPing".
#
# Создано: Pasha Lvov
#
# Дата создания: 10.01.2022
#

@{

# Файл модуля сценария или двоичного модуля, связанный с этим манифестом.
RootModule = 'PoshTestTCPing.psm1'

# Номер версии данного модуля.
ModuleVersion = '1.0.4'

# Поддерживаемые выпуски PSEditions
# CompatiblePSEditions = @()

# Уникальный идентификатор данного модуля
GUID = 'a326b8ec-edb5-48eb-a408-5335b212e6df'

# Автор данного модуля
Author = 'Pasha Lvov'

# Компания, создавшая данный модуль, или его поставщик
CompanyName = 'Неизвестно'

# Заявление об авторских правах на модуль
Copyright = '© 2022 pashalvov'

# Описание функций данного модуля
Description = '
A small module for checking the availability of a TCP port. It works much faster than its counterparts. It is used for mass multi-threaded checking in other scripts, for example, it is necessary to spill a package to thousands of machines in a short time.
Маленький модуль для проверки доступности TCP порта. Работает значительно быстрее, чем его аналоги. Используется для массовой многопоточной проверки в других скриптах, например надо разлить пакет на тысячи машин за короткое время.
'

# Минимальный номер версии обработчика Windows PowerShell, необходимой для работы данного модуля
PowerShellVersion = '5.1'

# Имя узла Windows PowerShell, необходимого для работы данного модуля
# PowerShellHostName = ''

# Минимальный номер версии узла Windows PowerShell, необходимой для работы данного модуля
# PowerShellHostVersion = ''

# Минимальный номер версии Microsoft .NET Framework, необходимой для данного модуля. Это обязательное требование действительно только для выпуска PowerShell, предназначенного для компьютеров.
# DotNetFrameworkVersion = ''

# Минимальный номер версии среды CLR (общеязыковой среды выполнения), необходимой для работы данного модуля. Это обязательное требование действительно только для выпуска PowerShell, предназначенного для компьютеров.
# CLRVersion = ''

# Архитектура процессора (нет, X86, AMD64), необходимая для этого модуля
# ProcessorArchitecture = ''

# Модули, которые необходимо импортировать в глобальную среду перед импортированием данного модуля
# RequiredModules = @()

# Сборки, которые должны быть загружены перед импортированием данного модуля
# RequiredAssemblies = @()

# Файлы сценария (PS1), которые запускаются в среде вызывающей стороны перед импортом данного модуля.
# ScriptsToProcess = @()

# Файлы типа (.ps1xml), которые загружаются при импорте данного модуля
# TypesToProcess = @()

# Файлы формата (PS1XML-файлы), которые загружаются при импорте данного модуля
# FormatsToProcess = @()

# Модули для импорта в качестве вложенных модулей модуля, указанного в параметре RootModule/ModuleToProcess
# NestedModules = @()

# В целях обеспечения оптимальной производительности функции для экспорта из этого модуля не используют подстановочные знаки и не удаляют запись. Используйте пустой массив, если нет функций для экспорта.
FunctionsToExport = '*'

# В целях обеспечения оптимальной производительности командлеты для экспорта из этого модуля не используют подстановочные знаки и не удаляют запись. Используйте пустой массив, если нет командлетов для экспорта.
CmdletsToExport = 'Test-TCPing'

# Переменные для экспорта из данного модуля
VariablesToExport = '*'

# В целях обеспечения оптимальной производительности псевдонимы для экспорта из этого модуля не используют подстановочные знаки и не удаляют запись. Используйте пустой массив, если нет псевдонимов для экспорта.
AliasesToExport = '*'

# Ресурсы DSC для экспорта из этого модуля
# DscResourcesToExport = @()

# Список всех модулей, входящих в пакет данного модуля
# ModuleList = @()

# Список всех файлов, входящих в пакет данного модуля
FileList = 'PoshTestTCPing.deps.json', 'PoshTestTCPing.dll', 
               'PoshTestTCPing.Format.ps1xml', 'PoshTestTCPing.pdb', 
               'PoshTestTCPing.psm1', 'PoshTestTCPing.psd1'

# Личные данные для передачи в модуль, указанный в параметре RootModule/ModuleToProcess. Он также может содержать хэш-таблицу PSData с дополнительными метаданными модуля, которые используются в PowerShell.
PrivateData = @{

    PSData = @{

        # Теги, применимые к этому модулю. Они помогают с обнаружением модуля в онлайн-коллекциях.
        Tags = 'Ping', 'TCP', 'Network', 'Multithreaded-helpers'

        # URL-адрес лицензии для этого модуля.
        LicenseUri = 'https://github.com/pashalvov/PoshTestTCPing/blob/master/LICENSE'

        # URL-адрес главного веб-сайта для этого проекта.
        ProjectUri = 'https://github.com/pashalvov/PoshTestTCPing'

        # URL-адрес значка, который представляет этот модуль.
        IconUri = 'https://zabbix.lvovpd.ru/assets/img/network.png'

        # Заметки о выпуске этого модуля
        ReleaseNotes = '
v1.0.4
Баг:
- Всегда возвращал True для недоступных узлов (https://github.com/pashalvov/PoshTestTCPing/issues/1)
v1.0.3
Баг:
- Забыл обновить xml для новой версии 1.0.2
'

    } # Конец хэш-таблицы PSData

} # Конец хэш-таблицы PrivateData

# Код URI для HelpInfo данного модуля
HelpInfoURI = 'https://github.com/pashalvov/PoshTestTCPing'

# Префикс по умолчанию для команд, экспортированных из этого модуля. Переопределите префикс по умолчанию с помощью команды Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

