function SelectShellType {
    DO {
        Clear-Host
        Write-Output "~~~~~~~~~~~~~~~~~~ Menu Title ~~~~~~~~~~~~~~~~~~" -ForegroundColor Cyan
        Write-Output "1: Enter 1 to select PowerShell"
        Write-Output "2: Enter 2 to select Bash"
        Write-Output
         
        $input = (Read-Host "Please make a selection").ToUpper()
        switch ($input) {
            '1' { $shellType = "/usr/bin/pwsh" }
            '2' { $shellType = "/bin/bash" }
        }
    } While ($input -NotIn 1..2)
    return $shellType
}

$results = $(docker ps -q --filter ancestor=mcr.microsoft.com/azure-cloudshell)
If ($results -ne $null) {
    Write-Output "container running..."
    Write-Output "connecting to container..."
    docker exec -it $results bash
}
Else {
    Write-Output "container not running"
    Write-Output "Updating container image..."
    Write-Output "Picking Shell Type"
    
    $StartShellType = SelectShellType
    $default = "E:\azrshell"
    if (!($ScriptsLocation = Read-Host "Enter the path where your local scripts are located. Press Enter to accept the default = [$default]")) { $ScriptsLocation = $default }
    Write-Output "updating container image..."
    docker pull mcr.microsoft.com/azure-cloudshell:latest
    Write-Output "Starting container and connecting your shell..."
    Write-Output "Mapping your scripts directory in the container home drive to " $ScriptsLocation "..."
    Write-Output
    Write-Output "___________________________________________________________"
    Write-Output
    docker run -it -v ""$ScriptsLocation':/usr/cloudshell/scripts'"" mcr.microsoft.com/azure-cloudshell $StartShellType
}