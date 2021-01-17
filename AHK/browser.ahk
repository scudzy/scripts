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

; Google Search highlighted text [ Ctrl + Shift + j ]
#IfWinActive ahk_class Chrome_WidgetWin_1
^+j::
     {
     Send, ^c
     DllCall("Sleep","UInt",16.1)
     Run, https://www.google.com/search?q=%clipboard%+jav
     }
Return

; Edge Restart
#IfWinActive, ahk_class Chrome_WidgetWin_1
!+r::
    DllCall("Sleep","UInt",1000)
    CoordMode, Mouse, Screen
    Click, 89, 94
return

; Edge url hotkeys
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

; Edge Home
#IfWinActive, ahk_class Chrome_WidgetWin_1
!h::Send !{Home}        ; Alt + Home
return
