#Write-Color -Text "Checking Dropbox Access Token" -Color Cyan -LinesAfter 1 -LinesBefore 1
#rclone config reconnect dbox-scudzy:
# dropbox
Write-Color -Text "Syncing Dropbox" -Color Yellow -LinesAfter 1 -LinesBefore 1
rclone --exclude-from=d:\files-exc.txt sync 'D:\Dropbox' 'G-Drive:/Cloud/Dropbox' --track-renames --checkers=16 --transfers=16 --stats=1s --tpslimit=10 --tpslimit-burst=10 -u -P -v && Write-Color -Text "Dropbox Sync Completed" -Color Green -LinesAfter 1 || Write-Color -Text "Dropbox Sync Failed" -Color DarkRed -LinesAfter 1
# onedrive
Write-Color -Text "Syncing OneDrive" -Color Yellow -LinesAfter 1 -LinesBefore 1
rclone --exclude-from=d:\files-exc.txt sync 'D:\OneDrive' 'G-Drive:/Cloud/OneDrive' --track-renames --checkers=16 --transfers=16 --stats=1s --tpslimit=10 --tpslimit-burst=10 --create-empty-src-dirs -u -P -v && Write-Color -Text "OneDrive Sync Completed" -Color Green -LinesAfter 1 || Write-Color -Text "OneDrive Sync Failed" -Color DarkRed -LinesAfter 1
# d:\apps
Write-Color -Text "Syncing Apps" -Color Yellow -LinesAfter 1 -LinesBefore 1
rclone --exclude-from=d:\apps-exc.txt sync 'D:\Apps' 'G-Drive:/Garbage/Apps' --track-renames --checkers=16 --transfers=16 --stats=1s --tpslimit=10 --tpslimit-burst=10 -u -P -v && Write-Color -Text "G50 Apps Sync Completed" -Color Green -LinesAfter 1 || Write-Color -Text "G50 Apps Sync Failed" -Color DarkRed -LinesAfter 1
# d:\android
Write-Color -Text "Syncing Android" -Color Yellow -LinesAfter 1 -LinesBefore 1
rclone --exclude-from=d:\android-exc.txt sync 'D:\Android' 'G-Drive:/Garbage/Android' --track-renames --checkers=16 --transfers=16 --stats=1s --tpslimit=10 --tpslimit-burst=10 -u -P -v && Write-Color -Text "G50 Android Sync Completed" -Color Green -LinesAfter 1 || Write-Color -Text "G50 Android Sync Failed" -Color DarkRed -LinesAfter 1
# d:\music
Write-Color -Text "Syncing Music" -Color Yellow -LinesAfter 1 -LinesBefore 1
rclone --exclude-from=d:\music-exc.txt sync 'D:\Music' 'G-Drive:/Garbage/Music' --track-renames --checkers=16 --transfers=16 --stats=1s --tpslimit=10 --tpslimit-burst=10 -u -P -v && Write-Color -Text "G50 Music Sync Completed" -Color Green -LinesAfter 1 || Write-Color -Text "G50 Music Sync Failed" -Color DarkRed -LinesAfter 1
# d:\Documents
Write-Color -Text "Syncing Documents" -Color Yellow -LinesAfter 1 -LinesBefore 1
rclone --exclude-from=d:\files-exc.txt sync 'D:\Documents' 'G-Drive:/Garbage/Documents' --track-renames --checkers=16 --transfers=16 --stats=1s --tpslimit=10 --tpslimit-burst=10 -u -P -v && Write-Color -Text "G50 Docs Sync Completed" -Color Green -LinesAfter 1 || Write-Color -Text "G50 Docs Sync Failed" -Color DarkRed -LinesAfter 1
# d:\Projects
Write-Color -Text "Syncing Projects" -Color Yellow -LinesAfter 1 -LinesBefore 1
rclone --exclude-from=d:\projects-exc.txt sync 'D:\Projects' 'G-Drive:/Garbage/Projects' --track-renames --checkers=16 --transfers=16 --stats=1s --tpslimit=10 --tpslimit-burst=10 -u -P -v && Write-Color -Text "G50 Projects Sync Completed" -Color Green -LinesAfter 1 || Write-Color -Text "G50 Projects Sync Failed" -Color DarkRed -LinesAfter 1
# d:\IconPacks
Write-Color -Text "Syncing IconPacks" -Color Yellow -LinesAfter 1 -LinesBefore 1
rclone --exclude-from=d:\files-exc.txt sync 'D:\IconsPacks' 'G-Drive:/Garbage/IconsPacks' --track-renames --checkers=16 --transfers=16 --stats=1s --tpslimit=10 --tpslimit-burst=10 -u -P -v && Write-Color -Text "G50 IconsPacks Sync Completed" -Color Green -LinesAfter 1 || Write-Color -Text "G50 IconsPacks Sync Failed" -Color DarkRed -LinesAfter 1
# Github notes scripts
Write-Color -Text "Syncing Github" -Color Yellow -LinesAfter 1 -LinesBefore 1
rclone --exclude-from=d:\files-exc.txt sync 'D:\Github' 'G-Drive:/Garbage/Github' --track-renames --checkers=16 --transfers=16 --stats=1s --tpslimit=10 --tpslimit-burst=10 -u -P -v && Write-Color -Text "G50 Github Sync Completed" -Color Green -LinesAfter 1 || Write-Color -Text "G50 Github Sync Failed" -Color DarkRed -LinesAfter 1
#SnappyDriverInstaller
#rclone --exclude-from=d:\files-exc.txt sync 'D:\SnappyDriverInstaller' 'G-Drive:/Garbage/Drivers/SnappyDriverInstaller' --track-renames --checkers=16 --transfers=16 --stats=1s --tpslimit=10 --tpslimit-burst=10 -u -P -v && Write-Color -Text "G50 SnappyDriverInstaller Sync Completed" -Color Green -LinesAfter 1 || Write-Color -Text "G50 SnappyDriverInstaller Sync Failed" -Color DarkRed -LinesAfter 1
Write-Color -Text "Synchronization completed" -Color Blue -LinesAfter 1