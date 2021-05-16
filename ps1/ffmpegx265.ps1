$originalVids = Get-ChildItem *.mp4 -Recurse

foreach ($inputVid in $originalVids) {
    $outputVid = [io.path]::ChangeExtension($inputVid.FullName, 'x265.mp4')
    ffmpeg.exe -i $inputVid.FullName -s 854x480 -c:v libx265 -vtag hvc1 -preset ultrafast -crf 25 -c:a aac -strict -2 -b:a 96k $outputVid
}