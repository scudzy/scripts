@echo off
SETLOCAL
echo.
echo.
color 1F

:: Get the date/time
FOR /f %%a in ('WMIC OS GET LocalDateTime ^| find "."') DO Set _DTS=%%a
Set timestamp=%_DTS:~6,2%%_DTS:~4,2%%_DTS:~0,4%-%_DTS:~8,2%%_DTS:~10,2%

:choice
choice /t 30 /c YN /d N /m "Compress Plug-ins?"
if errorlevel 2 goto :exit
if errorlevel 1 goto :Yes

:Yes
"C:\Program Files\7-Zip\7za" a -t7z -m0=lzma2 -mmt=2 -mx=9 -mfb=273 -md=96m -p065195 -mhe=on -ms=512m -bt "D:\Apps\Windows-Backup\Plugins-%timestamp%.7z" "D:\Apps\Windows-Backup\CloneApp\Plug-ins"
color 2f
pause
goto exit

:exit
exit /b