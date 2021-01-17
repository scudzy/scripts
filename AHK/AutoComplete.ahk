;------------------------------------------------------------------------------
; Settings
;------------------------------------------------------------------------------
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

;------------------------------------------------------------------------------
; AUto-COrrect TWo COnsecutive CApitals.
; Disabled by default to prevent unwanted corrections such as IfEqual->Ifequal.
; To enable it, remove the /*..*/ symbols around it.
; From Laszlo's script at http://www.autohotkey.com/forum/topic9689.html
;------------------------------------------------------------------------------
/*
; The first line of code below is the set of letters, digits, and/or symbols
; that are eligible for this type of correction.  Customize if you wish:
keys = abcdefghijklmnopqrstuvwxyz
Loop Parse, keys
    HotKey ~+%A_LoopField%, Hoty
Hoty:
    CapCount := SubStr(A_PriorHotKey,2,1)="+" && A_TimeSincePriorHotkey<999 ? CapCount+1 : 1
    if CapCount = 2
        SendInput % "{BS}" . SubStr(A_ThisHotKey,3,1)
    else if CapCount = 3
        SendInput % "{Left}{BS}+" . SubStr(A_PriorHotKey,3,1) . "{Right}"
Return
*/


;------------------------------------------------------------------------------
; Win+H to enter misspelling correction.  It will be added to this script.
;------------------------------------------------------------------------------
#+h::
; Get the selected text. The clipboard is used instead of "ControlGet Selected"
; as it works in more editors and word processors, java apps, etc. Save the
; current clipboard contents to be restored later.
AutoTrim Off  ; Retain any leading and trailing whitespace on the clipboard.
ClipboardOld = %ClipboardAll%
Clipboard =  ; Must start off blank for detection to work.
Send ^c
ClipWait 1
if ErrorLevel  ; ClipWait timed out.
    return
; Replace CRLF and/or LF with `n for use in a "send-raw" hotstring:
; The same is done for any other characters that might otherwise
; be a problem in raw mode:
StringReplace, Hotstring, Clipboard, ``, ````, All  ; Do this replacement first to avoid interfering with the others below.
StringReplace, Hotstring, Hotstring, `r`n, ``r, All  ; Using `r works better than `n in MS Word, etc.
StringReplace, Hotstring, Hotstring, `n, ``r, All
StringReplace, Hotstring, Hotstring, %A_Tab%, ``t, All
StringReplace, Hotstring, Hotstring, `;, ```;, All
Clipboard = %ClipboardOld%  ; Restore previous contents of clipboard.
; This will move the InputBox's caret to a more friendly position:
SetTimer, MoveCaret, 10
; Show the InputBox, providing the default hotstring:
InputBox, Hotstring, New Hotstring, Provide the corrected word on the right side. You can also edit the left side if you wish.`n`nExample entry:`n::teh::the,,,,,,,, ::%Hotstring%::%Hotstring%

if ErrorLevel <> 0  ; The user pressed Cancel.
    return
; Otherwise, add the hotstring and reload the script:
FileAppend, `n%Hotstring%, %A_ScriptFullPath%  ; Put a `n at the beginning in case file lacks a blank line at its end.
Reload
DllCall("Sleep","UInt",200) ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
MsgBox, 4,, The hotstring just added appears to be improperly formatted.  Would you like to open the script for editing? Note that the bad hotstring is at the bottom of the script.
IfMsgBox, Yes, Edit
return

MoveCaret:
IfWinNotActive, New Hotstring
    return
; Otherwise, move the InputBox's insertion point to where the user will type the abbreviation.
Send {HOME}
Loop % StrLen(Hotstring) + 4
    SendInput {Right}
SetTimer, MoveCaret, Off
return

#Hotstring R  ; Set the default to be "raw mode" (might not actually be relied upon by anything yet).

;---------
; Custom
;---------
;:*:rclo::rclone
:*:rclab::rclone about
:*:rclcf::rclone config
:*:rclcp::rclone copy -n -u -P -v --stats=1s
:*:rclsd::rclone lsd
:*:rclsl::rclone lsl
:*:rclrcd::rclone config reconnect dbox-scudzy:

:*:chocou::choco upgrade all -y
:*:scudzys@y::scudzys@yes.my
:*:scudzy@g::scudzy@gmail.com
:*:scudzy@o::scudzy@outlook.com
:*:scudzy.net::scudzy.net@outlook.com
:*:scudzy@i::scudzy@icloud.com
:*:halimi@l::halimi@live.com.my
:*:halimi@b::halimi@barikatech.com


:*:adbi::adb install -r
:*:wslshut::wsl --shutdown

:*:addpos::25200
:*:addcity::Kuantan
:*:addstate::Pahang
:*:add1::No 15, Lorong Bukit Setongkol 71
:*:add2::Taman LKNP

:*:mhmks::Mohd Halimi B. Mohd Khadri
:*:mhmkf::Mohamed Halimi Bin Mohamed Khadri
:*:digi014::014-9985814
:*:homeadd::No 15, Lorong Bukit Setongkol 71, Taman LKNP, 25200 Kuantan, Pahang.

:*:mbbwca::Maybank 556093702886
:*:mbbvisa::4283322042866614
