@echo off
SETLOCAL
rem color 5f
echo.
echo    1. Compress without delete the content of BACKUP
echo    2. Compress ^& delete the content of BACKUP
echo   ==================================================
echo.

:: Get the date/time
FOR /f %%a in ('WMIC OS GET LocalDateTime ^| find "."') DO Set _DTS=%%a
Set timestamp=%_DTS:~6,2%%_DTS:~4,2%%_DTS:~0,4%-%_DTS:~8,2%%_DTS:~10,2%

:loop
choice /t 30 /c 12c /d c /m "Selection? [C] Cancel"
if errorlevel 3 goto :exit
if errorlevel 2 goto :Label2
if errorlevel 1 goto :Label1

:Label1
"C:\Program Files\7-Zip\7za" a -t7z -m0=lzma2 -mmt=2 -mx=9 -mfb=273 -md=96m -p065195 -mhe=on -ms=512m -bt -xr!cache "D:\Apps\Windows-Backup\Backup-%timestamp%.7z" "D:\Apps\Windows-Backup\Backup\"
color 2f
echo.
echo Compress completed
pause
goto exit

:Label2
"C:\Program Files\7-Zip\7za" a -t7z -m0=lzma2 -mmt=2 -mx=9 -mfb=273 -md=96m -p065195 -mhe=on -ms=512m -bt -xr!cache "D:\Apps\Windows-Backup\Backup-%timestamp%.7z" "D:\Apps\Windows-Backup\Backup\"
color 2f
echo.
echo Compress completed
pause
echo.
echo Clean up Backup Folder
del /q D:\Apps\Windows-Backup\Backup\* && for /d %%x in (Backup\*) do @rd /s /q "%%x"
goto exit

:exit
exit /b