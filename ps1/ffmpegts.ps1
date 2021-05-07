$originalVids = Get-ChildItem *.ts -Recurse

foreach ($inputVid in $originalVids) {
    $outputVid = [io.path]::ChangeExtension($inputVid.FullName, '.mp4')
    ffmpeg.exe -i $inputVid.FullName -c copy $outputVid
    Get-ChildItem $inputVid | Send-ToRecycleBin
}