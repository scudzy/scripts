workflow Uninstall-AzureModules
{
    $Modules = @()
    $Modules += (Get-Module -ListAvailable Azure*).Name
    $Modules += (Get-Module -ListAvailable Az.*).Name
    Foreach -parallel ($Module in ($Modules | Get-Unique))
    {
        Write-Output ("Uninstalling: $Module")
        Uninstall-Module $Module -Force
    }
}
Uninstall-AzureModules
Uninstall-AzureModules   #second invocation to truly remove everything
