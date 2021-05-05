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
Menu, Tray, Icon, D:\IconsPacks\G50\Lumicons\System\service.ico

; GLOBAL HOTKEYS
; Apps Launcher [ Win + ] Reserved h, y, l, c, v, e, r, g, q, a,
;vf::Run, C:\Program Files\Mozilla Firefox\firefox.exe
#j::Run, C:\Program Files\Mozilla Thunderbird\thunderbird.exe
#k::Run, D:\Apps\Portable\KeePass\KeePass.exe
#n::Run, C:\Program Files\Sublime Text 3\sublime_text.exe
#o::Run, osk.exe
#s::Run, C:\Program Files\Everything\Everything.exe
#t::Run, c:\Users\scudzy\WApps\Windows Terminal.lnk
#u::Run, c:\users\scudzy\wapps\Microsoft Store.lnk
#v::Run, C:\Users\scudzy\scoop\apps\vscode\current\Code.exe
#w::Run, D:\Apps\Portable\freetube\FreeTube.exe
#z::Run, C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe

; Apps Launcher [ Win + Alt + ]
#!a::Run, C:\Program Files\Microsoft Office\root\Office16\ONENOTE.EXE
;#!b::Run, C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe
#!c::Run, c:\Users\scudzy\WApps\Command Prompt.lnk
#!d::Run, C:\Program Files (x86)\Ditto\Ditto.exe
#!e::Run, C:\Program Files (x86)\ExpressVPN\expressvpn-ui\ExpressVPN.exe
#!f::Run, C:\Program Files\FreeFileSync\FreeFileSync.exe
#!g::Run, D:\Apps\Portable\HandBrake\HandBrake.exe
#!h::Run, c:\Users\scudzy\WApps\Hard Disk Sentinel.lnk
#!i::Run, C:\Program Files (x86)\Internet Download Manager\IDMan.exe
#!j::Run, C:\Program Files\GIMP 2\bin\gimp-2.10.exe
#!k::Run, D:\Apps\Portable\deemix-win-x64\deemix-pyweb.exe
#!l::Run, D:\Apps\Portable\LosslessCut-win32-x64\LosslessCut.exe
#!m::Run, C:\Program Files\Microsoft Office\root\Office16\WINWORD.EXE
#!n::Run, C:\Program Files\Microsoft Office\root\Office16\EXCEL.EXE
;#!o::Run, C:\Program Files\Oracle\VirtualBox\VirtualBox.exe
#!p::Run, D:\Apps\Portable\PApps\Start.exe
#!q::Run, C:\Program Files\Process Hacker 2\ProcessHacker.exe
#!r::Run, C:\Program Files\VS Revo Group\Revo Uninstaller Pro\RevoUninPro.exe
#!s::Run, C:\Program Files (x86)\KC Softwares\SUMo\SUMo.exe
#!t::Run, D:\Apps\Portable\putty\PUTTY.EXE
;#!u::Run, C:\Program Files\Virtual Machine USB Boot\Virtual Machine USB Boot.x64.exe
#!v::Run, C:\Program Files\VideoLAN\VLC\vlc.exe
#!w::Run, c:\Users\scudzy\WApps\Whatsapp
;#!x::Run, C:\Program Files (x86)\Wise\Wise Game Booster\WiseGameBooster.exe
#!y::Run, c:\Users\scudzy\WApps\Weather
#!z::Run, C:\Users\scudzy\AppData\Local\Programs\LNV\Stremio-4\stremio.exe

; [ Ctrl + Shift + ]
; Launcher F1 - F12
^+F1::Run, C:\Program Files (x86)\Dropbox\Client\Dropbox.exe /home
^+F2::Run, C:\Users\scudzy\AppData\Local\Microsoft\OneDrive\OneDrive.exe
^+F3::Run, C:\Program Files\Google\Drive File Stream\46.0.3.0\GoogleDriveFS.exe
;F4::
;F5::
;F6::
;F7::
;F8::
;F9::


; Control Panel Ctrl + F1 - F10
#F1::Run, C:\Program Files\AutoHotkey\AutoHotkey.chm
#F2::Run, control               ; Control Panel
#F3::Run, control ncpa.cpl      ; Network Adapter
#F4::Run, control appwiz.cpl    ; Add Remove Programs
#F5::Run, services.msc          ; Services
#F6::Run, control sysdm.cpl     ; System Properties
#F7::Run, taskschd.msc          ; Task Scheduler
#F8::Run, wf.msc                ; Windows Firewall
#F9::Run, regedit.exe           ; Registry
#F10::Run, gpedit.msc           ; Local Group Policy

; Close All Windows [ Ctrl + Numpad0 ]
^Numpad0::
    WinGet, id, list, , , Program Manager
    Loop, %id%
         {
         StringTrimRight, this_id, id%a_index%, 0
         WinGetTitle, this_title, ahk_id %this_id%
         winclose,%this_title%
         }
Return

^Numpad1::Shutdown, 0               ; Logoff
^Numpad2::Shutdown, 6               ; Restart & Force
^Numpad3::Shutdown, 9               ; Shutdown & Power off
^Numpad4::Run, D:\GitHub\Scripts\AHK\Shutdown-Timer v1.1.ahk       ; Shutdown Timer
ExitApp

;  HIDDEN FILES on/off Win + H
#h::
    RegRead, HiddenFiles_Status, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden
    If HiddenFiles_Status = 2
         {
         Progress, b w200, SHOWING FILES
         DllCall("Sleep","UInt",1000)
         Progress OFF
         RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 1
         }
    Else
         {
         Progress, b w200, HIDING FILES
         DllCall("Sleep","UInt",1000)
         Progress OFF
         RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 2
         }
    DllCall("Sleep","UInt",500)
    send {F5}
return

; FILE EXTENSIONS on/off Win + y
#y::
    RegRead, HiddenFiles_Status, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideFileExt
    If HiddenFiles_Status = 1
         {
         Progress, b w200, SHOWING EXTENSIONS
         DllCall("Sleep","UInt",1000)
         Progress OFF
         RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideFileExt, 0
         }
    Else
         {
         Progress, b w200, HIDING EXTENSIONS
         DllCall("Sleep","UInt",1000)
         Progress OFF
         RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideFileExt, 1
         }
    DllCall("Sleep","UInt",500)
    send {F5}
Return

; Porntime Keystrokes Launch Multiple Apps [ trl + Alt + Shift + V ]
#!+v::
    MsgBox The Ctrl+Alt+Shift+V hotkey was pressed.
    Gosub Porntime
return

Porntime:
    Run, C:\Program Files\VideoLAN\VLC\vlc.exe
    DllCall("Sleep","UInt",1000)
    Run, osk.exe
    DllCall("Sleep","UInt",1000)
    Run, C:\Program Files\Everything\Everything.exe
    DllCall("Sleep","UInt",1000)
return

; Empty trash Win + Delete
#Del::FileRecycleEmpty ; win + del
return

; MobaXterm Bypass Global Hotkey
#IfWinActive ahk_class TMobaXtermForm
#!t::
    ControlSend, ahk_parent, % SubStr(A_ThisHotkey, 2)
    DllCall("Sleep","UInt",300)
Return

; Toggle Bluetooth On Off
+F2::
    SendMode Input
    Run, ms-settings:bluetooth
    WinWaitActive, Settings
    DllCall("Sleep","UInt",300)
    Send,{Tab}{Space}
    WinClose, A
return

;#IfWinActive, ahk_exe WindowsTerminal.exe
;^+1::Send {LCtrl}+{LShift}+{1}
;return

