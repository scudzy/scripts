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
Menu, Tray, Icon, D:\IconsPacks\G50\File\Browser\ie.ico


; Google Search highlighted text [ Alt + Shift + j ]
#IfWinActive ahk_class Chrome_WidgetWin_1
!+j::
     {
     Send, ^c
     DllCall("Sleep","UInt",16.1)
     Run, https://duckduckgo.com/?q=%clipboard%+jav
     }
Return

; Edge Restart [ Alt + Shift + r ]
#IfWinActive, ahk_class Chrome_WidgetWin_1
!+r::
    DllCall("Sleep","UInt",1000)
    CoordMode, Mouse, Screen
    Click, 89, 94
return

; Edge url hotkeys [ Alt + f / r / y ]
#IfWinActive, ahk_class Chrome_WidgetWin_1
OpenURL(u) {
    WinActivate, Program Manager
    Run %u%
    return
    }
!f::OpenURL("https://feedly.com/i/latest")
!r::OpenURL("http://www.reddit.com/")
!y::OpenURL("https://www.youtube.com/")
return

; Edge Home [ Alt + Home ]
#IfWinActive, ahk_class Chrome_WidgetWin_1
!h::Send !{Home}
return
