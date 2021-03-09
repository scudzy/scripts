# Check these threads before proceeding:
# https://github.com/microsoft/WSL/discussions/5857
# https://github.com/microsoft/WSL/issues/5821
if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
  $CmdLine = "-File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
  Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList $CmdLine
  Exit
}
# Restart the Host Network Service
Restart-Service -Force -Name hns
# Restart the Windows Subsystem for Linux Manager
Restart-Service LxssManager
# Restart the WSL Network adapter
Restart-NetAdapter -Name "vEthernet (WSL)"