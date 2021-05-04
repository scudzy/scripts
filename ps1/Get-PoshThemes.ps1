Get-ChildItem -Path "$(scoop prefix oh-my-posh)/themes/*" -Include '*.omp.json' | Sort-Object Name | ForEach-Object -Process {
    $esc = [char]27
    Write-Output ""
    Write-Output "$esc[1m$($_.BaseName)$esc[0m"
    Write-Output ""
    & "C:\Users\scudzy\scoop\apps\oh-my-posh\current\bin\oh-my-posh.exe" -config $($_.FullName) -pwd $PWD
    Write-Output ""
}