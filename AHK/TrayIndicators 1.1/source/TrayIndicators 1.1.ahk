#SingleInstance force
#NoEnv

IniRead, set_AlwaysON, config.ini, Settings, AlwaysON
IniRead, set_NumLockON, config.ini, Settings, NumLockON
IniRead, set_Pixels_size, config.ini, Settings, Pixels
IniRead, set_LEDcolor, config.ini, Settings, LEDcolor
Menu, Tray, NoStandard
Menu, Tray, Add, Exit, QuitScript

If set_Pixels_size = auto
{
	If A_ScreenDPI = 96
	{
		set_Pixels:= 16
	}
	If A_ScreenDPI = 120
	{
		set_Pixels:= 20
	}
	If A_ScreenDPI = 144
	{
		set_Pixels:= 24
	}
	If A_ScreenDPI = 168
	{
		set_Pixels:= 28
	}
	If A_ScreenDPI = 192
	{
		set_Pixels:= 32
	}
	If A_ScreenDPI = 240
	{
		set_Pixels:= 40
	}
	If A_ScreenDPI = 288
	{
		set_Pixels:= 48
	}
	If A_ScreenDPI != 96
	If A_ScreenDPI != 120
	If A_ScreenDPI != 144
	If A_ScreenDPI != 168
	If A_ScreenDPI != 192
	If A_ScreenDPI != 240
	If A_ScreenDPI != 288
	{
		set_Pixels:= 128
	}
}
Else
{
	set_Pixels:= set_Pixels_size
}
Loop
{
	GetKeyState, NumState, NumLock, T
	GetKeyState, CapsState, CapsLock, T
	GetKeyState, ScrollState, ScrollLock, T
	If set_AlwaysON=0
	If set_NumLockON=0
	If NumState = U
	If CapsState = U
	If ScrollState = U
	{
		Menu, Tray, NoIcon
	}
	If (set_AlwaysON=1 Or set_NumLockON=1)
	If NumState = U
	If CapsState = U
	If ScrollState = U
	{
		Menu, Tray, Icon, icons\%set_Pixels%\000.ico
		Menu, Tray, Icon
	}
	If set_AlwaysON=0	
	If set_NumLockON=1
	If NumState = D
	If CapsState = U
	If ScrollState = U
	{
		Menu, Tray, NoIcon
	}
	If (set_AlwaysON=1 Or set_NumLockON=0)
	If NumState = D
	If CapsState = U
	If ScrollState = U
	{
		Menu, Tray, Icon, icons\%set_Pixels%\%set_LEDcolor%\100.ico
		Menu, Tray, Icon
	}
	If NumState = U
	If CapsState = D
	If ScrollState = U
	{
		Menu, Tray, Icon, icons\%set_Pixels%\%set_LEDcolor%\010.ico
		Menu, Tray, Icon
	}
	If NumState = U
	If CapsState = U
	If ScrollState = D
	{
		Menu, Tray, Icon, icons\%set_Pixels%\%set_LEDcolor%\001.ico
		Menu, Tray, Icon
	}
	If NumState = D
	If CapsState = D
	If ScrollState = U
	{
		Menu, Tray, Icon, icons\%set_Pixels%\%set_LEDcolor%\110.ico
		Menu, Tray, Icon
	}
	If NumState = D
	If CapsState = U
	If ScrollState = D
	{
		Menu, Tray, Icon, icons\%set_Pixels%\%set_LEDcolor%\101.ico
		Menu, Tray, Icon
	}
	If NumState = U
	If CapsState = D
	If ScrollState = D
	{
		Menu, Tray, Icon, icons\%set_Pixels%\%set_LEDcolor%\011.ico
		Menu, Tray, Icon
	}
	If NumState = D
	If CapsState = D
	If ScrollState = D
	{
		Menu, Tray, Icon, icons\%set_Pixels%\%set_LEDcolor%\111.ico
		Menu, Tray, Icon
	}
	Sleep, 100
}

QuitScript:
ExitApp
return