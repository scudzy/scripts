@echo off
SETLOCAL
echo.
color 1F

:: Get the date/time
FOR /f %%a in ('WMIC OS GET LocalDateTime ^| find "."') DO Set _DTS=%%a
Set timestamp=%_DTS:~6,2%%_DTS:~4,2%%_DTS:~0,4%-%_DTS:~8,2%%_DTS:~10,2%

:choice
choice /t 30 /c YN /d N /m "Compress foobar2000?"
if errorlevel 2 goto :exit
if errorlevel 1 goto :Yes

:Yes
del D:\Dropbox\Zip\Archived\foobar2000-*.7z
"C:\Program Files\7-Zip\7za" a -t7z -m0=lzma2 -mmt=2 -mx=9 -mfb=273 -md=96m -p065195 -mhe=on -ms=512m -bt "D:\Dropbox\Zip\Archived\foobar2000-v165-%timestamp%.7z" "D:\Apps\Portable\foobar2000"
color 2f
echo.
echo Compress completed
pause
goto exit

:exit
exit /b