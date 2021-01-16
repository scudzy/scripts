@echo off
set timestamp=%date:~4,2%-%date:~7,3%-%date:~11,2%20-%time:~0,2%%time:~3,2%
7za a -t7z -m0=lzma2 -mmt=2 -mx=9 -mfb=273 -md=96m -p065195 -mhe=on -ms=512m -bt "Win7PESE_x86.ISO-%timestamp%.7z" "Win7PESE_x86.ISO"
pause