@echo off
cls
echo Date format = %date%
echo dd = %date:~4,2%
echo mm = %date:~7,3%
echo yyyy = %date:~11,2%
echo.
echo Time format = %time%
echo hh = %time:~0,2%
echo mm = %time:~3,2%
echo.
echo Timestamp = %date:~4,2%-%date:~7,3%-%date:~11,2%20-%time:~0,2%%time:~3,2%
