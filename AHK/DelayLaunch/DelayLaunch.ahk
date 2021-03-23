#SingleInstance, Force
#NoTrayIcon
Menu, Tray, Icon , C:\WINDOWS\system32\moricons.dll, 114

;---------------------------------------------------------
;------ DelayLaunch.ini should look like the following:
;---------------------------------------------------------
;[DelayLaunch]
;CmdToRun=cmd /k Testing
;SecondsToWait=10
;---------------------------------------------------------

IniRead, CmdToRun, %A_WorkingDir%\DelayLaunch.ini, DelayLaunch, CmdToRun, %A_Space%
IniRead, SecondsToWait, %A_WorkingDir%\DelayLaunch.ini, DelayLaunch, SecondsToWait, %A_Space%
;CmdToRun = %1% ; this would enable to pass the Cmd via command-line parameter instead of INI file

Gui, Margin, 6, 6
Gui, Font, S10, Verdana
Gui, Add, Text, ,Command To Launch:
Gui, Font, S10, Lucida Console
Gui, Add, Edit, x6 r6 w788 ReadOnly, %CmdToRun%
Gui, Font, S20, Verdana
Gui, Add, Button, w600 h40 +Default gBtnLaunchNow vBtnLaunchNow, &Launch Now
Gui, Font, S26, Verdana
Gui Add, Text, yp x742 w52 vdisp cRed
GuiControl, Focus, BtnLaunchNow ;To be effective, the window generally must not be minimized or hidden.
Gui Show, yp w800 Center Minimize, DelayLaunch

SetTimer, ShowTimer, 1000
Gosub ShowTimer

Return	; end of auto execute

ShowTimer:
  SecondsToWait--
  IfEqual, SecondsToWait, 0
  {
    SetTimer ShowTimer,Off
    Gosub, BtnLaunchNow
  }
  Else
  {
    GuiControl, Text, disp, %SecondsToWait%
	}
Return

BtnLaunchNow:
	Run, %CmdToRun%, ,Min
	ExitApp
Return
