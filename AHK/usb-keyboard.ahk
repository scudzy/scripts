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

; Remap Key
RAlt::AppsKey                   ; Right Alt = Apps Key
RCtrl::Insert                   ; Right Ctrl = Insert

SC163 & Up::Send {PgUp}       ; FN + Up = Page Up
return

SC163 & Down::Send {PgDn}     ; FN + Down = Page Down
return

SC163 & Left::Send {Home}     ; FN + Left = Home
return

SC163 & Right::Send {End}     ; FN + Right = End
return

; Launcher F1 - F12
;F1::
;F2::
;F3::
;F4::
;F5::
;F6::
;F7::
;F8::
;F9::
<<<<<<< HEAD
+F3::Run, C:\Program Files\Google\Drive File Stream\44.0.14.0\GoogleDriveFS.exe
+F1::Run, C:\Program Files (x86)\Dropbox\Client\Dropbox.exe /home
+F2::Run, C:\Program Files (x86)\Microsoft OneDrive\OneDrive.exe
=======
F10::Run, C:\Program Files\Google\Drive File Stream\44.0.14.0\GoogleDriveFS.exe
F11::Run, C:\Program Files (x86)\Dropbox\Client\Dropbox.exe /home
F12::Run, C:\Program Files (x86)\Microsoft OneDrive\OneDrive.exe
>>>>>>> 43fb330f5dbe3870dcf1f6f3d89b2153f8720b6b
