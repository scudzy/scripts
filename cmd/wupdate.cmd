@echo off
net stop wuauserv
net stop cryptSvc
net stop bits
net stop msiserver
Ren C:WindowsSoftwareDistribution SoftwareDistribution.old
Ren C:WindowsSystem32catroot2 Catroot2.old
net start wuauserv
net start cryptSvc
net start bits
net start msiserver