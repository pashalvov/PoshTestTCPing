#
# Script module for module 'PoshTestTCPing'
#
Set-StrictMode -Version Latest

# Set up some helper variables to make it easier to work with the module
$PSModule = $ExecutionContext.SessionState.Module
$PSModuleRoot = $PSModule.ModuleBase

# Import the appropriate nested binary module based on the current PowerShell version
$binaryModuleRoot = $PSModuleRoot

# Set FormatData and TypeData. This is being done explicitly because those attributes are not supported to be set in the manifest .psd1 file on linux/mac.
$formatFile = Join-Path -Path $PSModuleRoot -ChildPath "PoshTestTCPing.Format.ps1xml"
Update-FormatData -AppendPath $formatFile
#$typeFile = Join-Path -Path $PSModuleRoot -ChildPath "SQLProvider.Types.ps1xml"
#Update-TypeData -PrependPath $typeFile

if ([version]$PSVersionTable.PSVersion -ge "5.1")
{
    $moduleDLLs = @('PoshTestTCPing.dll')

    $importedModules = @()

    $moduleDLLs | ForEach-Object {
        $binaryModulePath = Join-Path -Path $binaryModuleRoot -ChildPath "$_"
        if (Test-Path -Path $binaryModulePath)
        {
            $binaryModule = Import-Module -Name $binaryModulePath -PassThru
            $importedModules += $binaryModule
        }
    }

    <# Load misc assemblies (from the local folder)
    $extraDLLS | ForEach-Object {
        $binaryPath = Join-Path -Path $binaryModuleRoot -ChildPath "$_"

        if (Test-Path -Path $binaryPath) {
            Add-Type -Path $binaryPath
        }
    }
    #>
}
else
{
    # Emit an error and remind user to upgrade...
    Write-Error "This module requires PowerShell 5.1+. Please, upgrade your PowerShell version."
    Exit 1
}

# When the module is unloaded, remove the nested binary module that was loaded with it
$PSModule.OnRemove = {
    Remove-Module -ModuleInfo $importedModules
}