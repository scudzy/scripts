param (
    [string]$filePath = $(throw "The -filePath argument is required"),
    [string]$folder = $( Read-Host "Please, specify the destination folder name" )
)
#$datetime = $(get-date -f "dd-MMM-yyyy-HHmm")
$string= $(get-date -f "dd-MMM-yyyy-HHmm")
$date= [DateTime] $string
$arg= -t7z -m0=lzma2 -mmt=2 -mx=9 -mfb=273 -md=96m -p065195 -mhe=on -ms=512m -bt
#$filename = { "$($_.BaseName) $(get-date -format "dd-MMM-yyyy-HHmm")$($_.extension) "  }
$path = $filePath, $filePath.lastIndexOf('\')
$command = "7za a '$arg' '$filePath-$date' '$path\$folder'"
$command1 = "7za h -scrcsha256 '$filename-$date'"
Invoke-Expression $command; Invoke-Expression $command1
