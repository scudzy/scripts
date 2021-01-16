; Ensure this is in the auto-execute section. If this is in a hotkey, this setting is applied only to the hotkey's thread, which does not extend to any Timers.
; If it is not in the auto-execute section, move the SetFormat command into the countdown label.
SetFormat, Float, 0.0 ; keep our numbers appearing as whole


Gui,+Border
Gui,Add,Edit,x50 y90 w50 h21 Limit Number v_Hs_,H
Gui,Add,Text,x110 y95 w30 h14,Hours
Gui,Add,Edit,x155 y90 w50 h21 Limit Number v_Ms_,M
Gui,Add,Edit,x260 y90 w50 h21 Number Limit v_Ss_,S
Gui,Add,Text,x210 y95 w40 h14,Minutes
Gui,Add,Text,x320 y95 w50 h13,Seconds
Gui,Show, w388 h197 Center,
Gui,Add,Button,x160 y120 w43 h23 gSubmission,Submit
Return

GuiClose:
;ExitApp
Return

Submission:
Gui, Submit

_Ht_ := (_Hs_ * 3600000)
_Mt_ := (_Ms_ * 60000)
_St_ := (_Ss_ * 1000)

_Total_ := _Ht_ + _Mt_ + _St_
Start:=A_TickCount

SetTimer, SDTimer, %_Total_%
SetTimer, countdown, 1000
return

SDTimer:
;Shutdown, 1
Msgbox, Shutdown
return

countdown:
Tooltip % (_Total_-(A_TickCount-Start))/1000 " seconds left"
return

^0::
toggle:=!toggle
If toggle
   SetTimer, countdown, Off
else
   SetTimer, countdown, 1000
return