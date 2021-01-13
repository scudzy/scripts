# Uncomment to install Chocolatey
# @powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%systemdrive%\chocolatey\bin

# https://http://chocolatey.org/packages/<name>

# Normal Programs
# cinst -y chromium
# cinst -y firefox
cinst -y GoogleChrome

# Creative Programs
cinst -y gimp
# cinst -y OpenOffice


$reply = Read-Host -Prompt "Is his a Dev Machine?[y/n]"
if ( $reply -match "[yY]" ) {
# Dev Tools
  cinst -y vscode
  cinst -y notepadplusplus
  cinst -y slack
  cinst -y discord
  cinst -y insomnia-rest-api-client
  cinst -y nodejs.install
  cinst -y git.install
$reply = Read-Host -Prompt "Is this for backend?[y/n]"
  if ( $reply -match "[yY]" ) {
    cinst -y sql-server-management-studio
    cinst -y visualstudio2017-installer
  }
}

# VM || PenTesting

$reply = Read-Host -Prompt "Will this be used for Pen testing or running VM's?[y/n]"
if ( $reply -match "[yY]" ) {
  cinst -y virtualbox
}

# File Managment
cinst -y filezilla
cinst -y hyper



# Video Service
cinst -y vlc

# Gaming
$reply = Read-Host -Prompt "Is this a gaming machine?[y/n]"
if ( $reply -match "[yY]" ) {
  cinst -y nvidia-display-driver
  cinst -y steam
}

# Gaming Laptop
$reply = Read-Host -Prompt "Is this a Razer?[y/n]"
if ( $reply -match "[yY]" ) {
  cinst -y razer-synapse-2
}


<#
    $reply = Read-Host -Prompt "Continue?[y/n]"
    if ( $reply -match "[yY]" ) {
    # Highway to the danger zone
    }
#>