﻿# Function
function ivsa { Invoke-ScriptAnalyzer -Path . -Recurse }
function lg { lazygit }
function ll { Get-ChildItem -Path . @Args }
function lld { Get-ChildItem -Directory @Args }
function lda { Get-ChildItem -Directory -Force @Args }
function llf { Get-ChildItem -File @Args }
function lfa { Get-ChildItem -File -Force @Args }
function lsa { Get-ChildItem -Path . -Force @Args }
function lsm { Get-ChildItem | sort -property LastWriteTime }
function dirall { Get-ChildItem -Recurse | ?{ $_.PSIsContainer } | Select-Object FullName }
function ompv { oh-my-posh.exe -version }
function dieth { Disable-NetAdapter -Name "Ethernet" -ConfInvoke-RestMethod:$false }
function eneth { Enable-NetAdapter -Name "Ethernet" -ConfInvoke-RestMethod:$false }
function speed { speedtest --selection-details -v }
function gfunc { Get-ChildItem function:\ }
function galias { Get-ChildItem alias:\ }
function pyupg { pip freeze | %{$_.split('==')[0]} | %{pip install --upgrade $_} }
function gst { git status }
function gad { git add @Args }
function gaa { git add -all }
function gcom { git commit -m @Args }
function gcoma { git commit --amend -m @Args }
function gpu { git push }
function gdiff { git diff --color --diff-filter=d | delta }
function gitcm { git commit -m @Args }
function gitren { git commit --amend -m @Args }
function gitp { git push }
function gitpd { git push --dry-run }
function gitpsup { git push --set-upstream origin master }
function gitpu { git push upstream }
function gitrv { git remote -v }
function gitpl { git pull }
function gitf { git fetch }
function gitlog { git log --pretty=oneline }
function gitlg { git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit }
function gitlgg { git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(red)%h%C(r) —— %C(bold blue)%an%C(r): %C(white)%s%C(r) %C(dim white) %C(bold green)(%ar)%C(r) %C(bold yellow)%d%C(r)' --all }
function seno { Get-CimInstance win32_bios | select SerialNumber }
function bios { Get-CimInstance win32_bios | format-list * }
function ip3 { iperf3 -s 192.168.1.120 }
function scomp { powershell.exe -Command { scoop update oh-my-posh } }
function scu { powershell.exe -Command { scoop update @Args } }
function gcma { Get-Command -CommandType All -Module @Args }
function gcmaa { Get-Command -CommandType Alias -Module @Args }
function gcmf { Get-Command -CommandType Function -Module @Args }
function gcmc { Get-Command -CommandType Cmdlet -Module @Args }
function vw { pyvoc -w @Args }
function bg { Start-Process -NoNewWindow @Args }
function profiless { $PROFILE | Select-Object *Host* | Format-List }
function yga { yarn global add @Args }
function path {$ENV:PATH}                                                   # Path shortcut
function cd32 { Set-Location C:\Windows\System32 }                          # CD to System32 Directory
function src { . $profile }                                                 # Reload PowerShell
function chocou { choco upgrade all -y }
function csu { powershell.exe -Command { choco upgrade all -y; scoop update; scoop status } }
function ddown {Set-Location D:\Downloads\}
function cdst3 { Set-Location 'C:\Users\scudzy\AppData\Roaming\Sublime Text 3\Packages\User\' }
function notes { Set-Location D:\Github\Notes\ }
function scripts { Set-Location D:\Github\Scripts\ }
function wttr { Invoke-RestMethod 'http://wttr.in/Kuantan, Malaysia?0qTm' }
function wttr4 { Invoke-RestMethod 'http://wttr.in/Kuantan, Malaysia?m0Fq&format=4' }
function wsls { wsl --shutdown }
function wslreboot { Get-Service LxssManager | Restart-Service }

function find ($string) { 
    $env:path.Split(';') | select -Unique | ? {$_ -and (test-path $_)} | gci -Filter $string; 
}

function whereis ($string) { 
    $superpath = "$env:Path;C:\Program Files;C:\Program Files (x86);C:\Users\scudzy";
    (echo $superpath).Split(';') | Get-ChildItem -Recurse -Filter $string; 
}

# Home directory
function homescudzy { Set-Location $HOME }
Set-Alias ~ homescudzy

# Update-Help work around
function updatehelp { Update-Help -Verbose -ErrorAction SilentlyContinue -ErrorVariable UpdateErrors -UICulture en-US }
Set-Alias uhlp updatehelp

# List Env
function allenv { Get-Childitem -Path Env:* | Sort-Object Name }
Set-Alias envall allenv

# Rclone about G-Drive:
function rclonegdrive { rclone about G-Drive:; Write-Color -Text "Google Drive scudzys@yes.my" -Color DarkBlue -LinesAfter 1 -LinesBefore 1 }
Set-Alias rcl1 rclonegdrive

# Rclone about dbox-scudzy:
function rclonedbox { rclone about dbox-scudzy:; Write-Color -Text "Dropbox scudzy" -Color DarkBlue -LinesAfter 1 -LinesBefore 1 }
Set-Alias rcl2 rclonedbox

# Rclone about one-scudzy:
function rcloneone { rclone about one-scudzy:; Write-Color -Text "One Drive scudzy" -Color DarkBlue -LinesAfter 1 -LinesBefore 1 }
Set-Alias rcl3 rcloneone

# Rclone about mega-scudzy:
function rclonemega { rclone about mega-scudzy:; Write-Color -Text "Mega scudzy" -Color DarkBlue -LinesAfter 1 -LinesBefore 1 }
Set-Alias rcl4 rclonemega

# Rclone about G-scudzy:
function rclonegscudzy { rclone about G-scudzy:; Write-Color -Text "Google scudzy@gmail.com" -Color DarkBlue -LinesAfter 1 -LinesBefore 1 }
Set-Alias rcl5 rclonegscudzy

# Rclone about G-scudzy:
function rclonegmhmk { rclone about G-mhmk:; Write-Color -Text "Google mhmk220977@gmail.com" -Color DarkBlue -LinesAfter 1 -LinesBefore 1 }
Set-Alias rcl6 rclonegmhmk

# Rclone about G-halimi:
function rcloneghalimi { rclone about G-halimi:; Write-Color -Text "Google halimi@barikatech.com" -Color DarkBlue -LinesAfter 1 -LinesBefore 1 }
Set-Alias rcl7 rcloneghalimi

# Rclone reconnect dbox-scudzy:
function rclonercdbox { rclone config reconnect dbox-scudzy:; Write-Color -Text "Token successfully refresh" -Color Green -LinesAfter 1 -LinesBefore 1 }
Set-Alias rclrc rclonercdbox

# Alias
Set-Alias -Name edit -Value "C:\Program Files\Sublime Text 3\sublime_text.exe"
Set-Alias -Name umo -Value Uninstall-Module
Set-Alias -Name gimo -Value Get-InstalledModule
Set-Alias -Name ggs -Value Get-GitStatus
Set-Alias -Name umof -Value Update-Module -Force 