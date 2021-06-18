$inProcessPath = "E:\Random Videos\In Process\$env:username\"

$oldVideos = Get-ChildItem -Include @("*.mp4", "*.avi", "*.divx", "*.mov", "*.mpg", "*.wmv", "*.mkv") -Path $inProcessPath -Recurse;

Set-Location -Path 'E:\FFMPEG\bin\';

foreach ($oldVideo in $oldVideos) {
    $newVideo = [io.path]::ChangeExtension($oldSong.FullName, '.flv')

    # Declare the command line arguments for ffmpeg.exe
    $ArgumentList = '-i "{0}" -y -async 1 -b 2000k -ar 44100 -ac 2 -v 0 -f flv -vcodec libx264 -preset superfast "{1}"' -f $oldVideo, $newVideo;

    # Display the command line arguments, for validation
    Write-Host -ForegroundColor Green -Object $ArgumentList;
    # Pause the script until user hits enter
    $null = Read-Host -Prompt 'Press enter to continue, after verifying command line arguments.';

    # Kick off ffmpeg
    Start-Process -FilePath c:\path\to\ffmpeg.exe -ArgumentList $ArgumentList -Wait -NoNewWindow;
}