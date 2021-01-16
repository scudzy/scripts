@echo off
cls
echo Date format = %date%
echo dd = %date:~0,2%
echo mm = %date:~3,2%
echo yyyy = %date:~6,4%
echo.
echo Time format = %time%
echo hh = %time:~0,2%
echo mm = %time:~3,2%
echo ss = %time:~6,2%
echo.
echo Timestamp = %date:~6,4%-%date:~3,2%-%date:~0,2%-%time:~0,2%-%time:~3,2%-%time:~6,2%