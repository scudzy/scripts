Function Send-ToRecycleBin () {
    Param(
    [Parameter(Mandatory = $true,
    ValueFromPipeline = $true)]
    [alias('FullName')]
    [string]$FilePath
    )
    Begin{$shell = New-Object -ComObject 'Shell.Application'}
    Process{
    $Item = Get-Item $FilePath
    $shell.namespace(0).ParseName($item.FullName).InvokeVerb('delete')
    }
}