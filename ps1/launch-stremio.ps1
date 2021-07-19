Start-Process -FilePath "cmd.exe" -ArgumentList  "/c D:\Apps\Portable\Jackett\jackett_launcher.bat"
Start-Sleep -Seconds 5
Start-Process -FilePath "D:\Apps\Portable\Sonarr\Sonarr.exe"
Start-Sleep -Seconds 10
Start-Process -FilePath "D:\Apps\Portable\PimpMyStremio\PimpMyStremio.exe" && Start-Process -FilePath "C:\Users\scudzy\AppData\Local\Programs\LNV\Stremio-4\stremio.exe"
