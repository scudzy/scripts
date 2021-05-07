param (
    [string]$filePath = $(throw "The -filePath argument is required"),
    [string]$folder = $( Read-Host "Please, specify the destination folder name" )
)
$path = $filePath.Substring(0, $filePath.lastIndexOf('\'))
$command = "7za x '$filePath' -o'$path\$folder'"  
Invoke-Expression $command
