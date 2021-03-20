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