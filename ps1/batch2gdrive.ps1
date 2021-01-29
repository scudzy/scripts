Write-Color "Checking Dropbox Access Token" -ForegroundColor Cyan -LinesAfter 1 -LinesBefore 1
rclone config reconnect dbox-scudzy:
# dropbox
rclone --exclude-from=d:\files-exc.txt sync 'dbox-scudzy:/' 'G-Drive:/Cloud/Dropbox/' --transfers=8 --stats=1s --drive-chunk-size=128M --tpslimit=10 --tpslimit-burst=10 -u -P -v && Write-Color "Dropbox Sync Completed" -ForegroundColor Green -LinesAfter 1 || Write-Color "Dropbox Sync Failed" -ForegroundColor Red -LinesAfter 1
# onedrive
rclone --exclude-from=d:\files-exc.txt sync 'one-scudzy:/' 'G-Drive:/Cloud/OneDrive/' --transfers=8 --stats=1s --drive-chunk-size=128M --tpslimit=10 --tpslimit-burst=10 -u -P -v && Write-Color "OneDrive Sync Completed" -ForegroundColor Green -LinesAfter 1 || Write-Color "OneDrive Sync Failed" -ForegroundColor Red -LinesAfter 1
# d:\apps
rclone --exclude-from=d:\apps-exc.txt sync 'd:\apps' 'G-Drive:/Garbage/Apps' --transfers=8 --stats=1s --drive-chunk-size=128M --tpslimit=10 --tpslimit-burst=10 -u -P -v && Write-Color "G50 Apps Sync Completed" -ForegroundColor Green -LinesAfter 1 || Write-Color "G50 Apps Sync Failed" -ForegroundColor Red -LinesAfter 1
# d:\android
rclone --exclude-from=d:\android-exc.txt sync 'd:\Android' 'G-Drive:/Garbage/Android' --transfers=8 --stats=1s --drive-chunk-size=128M --tpslimit=10 --tpslimit-burst=10 -u -P -v && Write-Color "G50 Android Sync Completed" -ForegroundColor Green -LinesAfter 1 || Write-Color "G50 Android Sync Failed" -ForegroundColor Red -LinesAfter 1
# d:\music
#rclone --exclude-from=d:\music-exc.txt sync 'd:\Music' 'G-Drive:/Garbage/Music' --transfers=8 --stats=1s --drive-chunk-size=128M --tpslimit=10 --tpslimit-burst=10 -u -P -v && Write-Color "G50 Music Sync Completed" -ForegroundColor Green -LinesAfter 1 || Write-Color "G50 Music Sync Failed" -ForegroundColor Red -LinesAfter 1
# d:\Documents
rclone --exclude-from=d:\files-exc.txt sync 'd:\Documents' 'G-Drive:/Garbage/Documents' --transfers=8 --stats=1s --drive-chunk-size=128M --tpslimit=10 --tpslimit-burst=10 -u -P -v && Write-Color "G50 Docs Sync Completed" -ForegroundColor Green -LinesAfter 1 || Write-Color "G50 Docs Sync Failed" -ForegroundColor Red -LinesAfter 1
# d:\Projects
#rclone --exclude-from=d:\projects-exc.txt sync 'd:\Projects' 'G-Drive:/Garbage/Projects' --transfers=8 --stats=1s --drive-chunk-size=128M --tpslimit=10 --tpslimit-burst=10 -u -P -v && Write-Color "G50 Projects Sync Completed" -ForegroundColor Green -LinesAfter 1 || Write-Color "G50 Projects Sync Failed" -ForegroundColor Red -LinesAfter 1
# d:\IconPacks
#rclone --exclude-from=d:\files-exc.txt sync 'd:\IconsPacks' 'G-Drive:/Garbage/IconsPacks' --transfers=8 --stats=1s --drive-chunk-size=128M --tpslimit=10 --tpslimit-burst=10 -u -P -v && Write-Color "G50 IconsPacks Sync Completed" -ForegroundColor Green -LinesAfter 1 || Write-Color "G50 IconsPacks Sync Failed" -ForegroundColor Red -LinesAfter 1
Write-Color "Synchronization completed" -ForegroundColor Green -LinesAfter 1