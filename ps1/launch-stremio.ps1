Start-Process -FilePath "cmd.exe" -ArgumentList  "/c D:\Apps\Portable\Jackett\jackett_launcher.bat"
Start-Sleep -Seconds 5
Start-Process -FilePath "D:\Apps\Portable\Sonarr\Sonarr.exe"
Start-Sleep -Seconds 10
Set-Location D:\Documents\FlareSolverr\ && (npm run start&)
Start-Sleep -Seconds 10
Start-Process -FilePath "D:\Apps\Portable\PimpMyStremio\PimpMyStremio.exe"
Start-Sleep -Seconds 60
Start-Process -FilePath "C:\Users\scudzy\AppData\Local\Programs\LNV\Stremio-4\stremio.exe"
Start-Sleep -Seconds 10
Start-Process -FilePath "C:\Program Files\qBittorrent\qbittorrent.exe" -WindowStyle Minimized
