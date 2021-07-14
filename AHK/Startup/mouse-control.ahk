#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
ListLines Off
Process, Priority, , H
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input
Menu, Tray, Icon, D:\IconsPacks\G50\Lumicons\System\device mouse.ico

; MOUSE CONTROL
; VLC
#IfWinActive, ahk_exe vlc.exe
XButton1::Left         ; Backward 15 sec
XButton2::!Right        ; Forward 30 sec
MButton::Right          ; Forward 15 sec
return

; Firefox
#IfWinActive, ahk_class MozillaWindowClass`
XButton1::^Left          ; Backward 30 sec
XButton2::^Right         ; Fast Forward 30 sec
return

; Edge
#IfWinActive, ahk_exe msedge.exe
XButton1::^Left          ; Backward 30 sec
XButton2::^Right         ; Fast Forward 30 sec
return

; Everything search
#IfWinActive, ahk_exe Everything.exe
XButton1::
XButton2::^a            ; Select all
return

; Sublime Text 3
#IfWinActive, ahk_exe sublime_text.exe
XButton1::^`            ; Console
XButton2::^+p           ; Command Pallette
return

; VS Code
#IfWinActive, ahk_exe Code.exe
XButton1::!+u           ; Sync with Github
XButton2::^+p           ; Command Pallette
return

; foobar2000
#IfWinActive, ahk_class #32770
XButton1::!+           ; Next track
XButton2::^+           ; Previous track
return

; dupeguru
#IfWinActive, ahk_exe dupeguru-win64.exe
XButton1::
XButton2::^Space      ; Selected as reference
return

; Stremio
#IfWinActive, ahk_class Qt5152QWindowOwnDCIcon
XButton1::Left          ; FF 20 sec
XButton2::Right         ; RW 20 sec
return
