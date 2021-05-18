@ECHO OFF
echo Simple Script to Reset / Clear Windows Update
echo.
PAUSE
echo.
attrib -h -r -s %windir%\system32\catroot2
attrib -h -r -s %windir%\system32\catroot2\*.*
net stop wuauserv
net stop CryptSvc
net stop BITS
ren %windir%\system32\catroot2 catroot2.old12
ren %windir%\SoftwareDistribution sold.old12
ren "%ALLUSERSPROFILE%\application data\Microsoft\Network\downloader" downloader.old12
net Start BITS
net start CryptSvc
net start wuauserv
echo.
echo Task completed successfully...
echo.
PAUSE