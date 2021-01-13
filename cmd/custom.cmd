@echo off
SETLOCAL

:: Get the date/time
FOR /f %%a in ('WMIC OS GET LocalDateTime ^| find "."') DO Set _DTS=%%a
Set timestamp=%_DTS:~6,2%-%_DTS:~4,2%-%_DTS:~0,4%_%_DTS:~8,2%-%_DTS:~10,2%

7za a -t7z -m0=lzma2 -mmt=2 -mx=9 -mfb=273 -md=96m -p065195 -mhe=on -ms=512m -bt "target-%timestamp%.7z" "source"

pause