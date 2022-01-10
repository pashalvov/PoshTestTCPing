
#
# Module manifest for module 'Test-TCPing'

@{

# Script module or binary module file associated with this manifest.
RootModule = 'PoshTestTCPing.psm1'

# Version number of this module.
ModuleVersion = '1.0.0'

# Supported PSEditions
# CompatiblePSEditions = @('Desktop', 'Core')

# ID used to uniquely identify this module
GUID = '030edd25-d040-4ca1-aba2-817862aa203a'

# Author of this module
Author = 'Pasha Lvov'

# Company or vendor of this module
CompanyName = 'NA'

# Copyright statement for this module
Copyright = 'Copyright (c) 2022 pashalvov'

# Description of the functionality provided by this module
Description = @'
A small module for checking the availability of a TCP port. It works much faster than its counterparts. It is used for mass multi-threaded checking in other scripts, for example, it is necessary to spill a package to thousands of machines in a short time.
ћаленький модуль дл€ проверки доступности TCP порта. –аботает значительно быстрее, чем его аналоги. »спользуетс€ дл€ массовой многопоточной проверки в других скриптах, например надо разлить пакет на тыс€чи машин за короткое врем€.
'@

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '5.1'

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
DotNetFrameworkVersion = '4.0'

# Minimum version of the common language runtime (CLR) required by this module
CLRVersion = '4.0'

# Processor architecture (None, X86, Amd64) required by this module
# Getting rid of the requirement of a 64-bit machine as this leads the module unusable on Linux/mac
# https://github.com/PowerShell/PowerShell/issues/6533
# The only cmdlet that does not work on a 32-bit OS is Invoke-Sqlcmd. Though on a 64-bit OS this cmdlet works as usual.
ProcessorArchitecture = 'None'

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @( )

# Script files (.ps1) that are run in the caller's environment prior to importing this module
# ScriptsToProcess = @()

# The type and format files are loaded explicitly in the SqlServer.psm1 file as these elements aren't supported on PS Core on linux/mac.
# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = 'sqlprovider.types.ps1xml'

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = 'sqlprovider.format.ps1xml'

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module
# FunctionsToExport = @()

# Cmdlets to export from this module
CmdletsToExport = @(
    'Test-TCPing'
    )

# Variables to export from this module
# VariablesToExport = @()

# Aliases to export from this module
# AliasesToExport = @()

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{


        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = 'Ping', 'TCP', 'Network', 'Multithreaded-helpers', 'TCP Port'

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/pashalvov/PoshTestTCPing/blob/master/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/pashalvov/PoshTestTCPing'

        # A URL to an icon representing this module.
        IconUri = 'https://zabbix.lvovpd.ru/assets/img/network.png'

        # ReleaseNotes of this module
        ReleaseNotes = @'
## v1.0.0
ѕервый релиз
'@
    } # End of PSData hashtable

 } # End of PrivateData hashtable

# HelpInfo URI of this module
HelpInfoURI = 'https://github.com/pashalvov/PoshTestTCPing/blob/master/README.md'

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''
}