GroupAdd, vGroupFirefoxAndChrome, ahk_class MozillaWindowClass
GroupAdd, vGroupFirefoxAndChrome, ahk_class Chrome_WidgetWin_1

#IfWinActive, ahk_group vGroupFirefoxAndChrome
;^a::
;^b::
;^c::
;^d::
;^e::
;^f::
^+g::Run, https://www.google.com/
;^h::
;^i::
;^j::
;^k::
;^l::
;^m::
;^n::
;^o::
;^p::
;^q::
^+r::Run, http://www.reddit.com/
;^s::
;^t::
;^u::
;^v::
;^w::
;^x::
^y::Run, https://www.youtube.com/
;^z::
WinGet, hWnd, ID, A
WinGetClass, vWinClass, ahk_id %hWnd%
vLetter := SubStr(A_ThisHotkey, 1-1)
vNum := Asc(vLetter)-96

if (vWinClass = "MozillaWindowClass")
JEE_FirefoxFocusTabByNum(hWnd, vNum)
if (vWinClass = "Chrome_WidgetWin_1")
JEE_ChromeFocusTabByNum(hWnd, vNum)
Return
#IfWinActive

;==================================================

JEE_FirefoxGetTabNames(hWnd, vSep="`n")
{
oAcc := Acc_Get("Object", "4", 0, "ahk_id " hWnd)
Loop, % oAcc.accChildCount
if (oAcc.accName(A_Index) = "Browser tabs")
if (1, oAcc := Acc_Child(oAcc, A_Index))
break
oAcc := Acc_Child(oAcc, 1)

vOutput := ""
Loop, % oAcc.accChildCount
{
vTabText := oAcc.accName(A_Index)
if !(vTabText == "")
;if !(vTabText == "New Tab")
;if !(vTabText == "Open a new tab")
vOutput .= vTabText vSep
}
vOutput := SubStr(vOutput, 1, -StrLen(vSep)) ;trim right

oAcc := ""
Return vOutput
}

;==================================================

JEE_FirefoxFocusTabByNum(hWnd, vNum)
{
oAcc := Acc_Get("Object", "4", 0, "ahk_id " hWnd)
Loop, % oAcc.accChildCount
if (oAcc.accName(A_Index) = "Browser tabs")
if (1, oAcc := Acc_Child(oAcc, A_Index))
break
oAcc := Acc_Child(oAcc, 1)

vRet := 0
For each, oChild in Acc_Children(oAcc)
{
if (A_Index = vNum)
if (1, oChild.accDoDefaultAction(0), vRet := A_Index)
break
}

Return vRet
}

;==================================================

JEE_FirefoxFocusTabByName(hWnd, vTitle, vNum=1)
{
oAcc := Acc_Get("Object", "4", 0, "ahk_id " hWnd)
Loop, % oAcc.accChildCount
if (oAcc.accName(A_Index) = "Browser tabs")
if (1, oAcc := Acc_Child(oAcc, A_Index))
break
oAcc := Acc_Child(oAcc, 1)

vCount := 0
vRet := 0
For each, oChild in Acc_Children(oAcc)
{
vTabText := oChild.accName(0)
if (vTabText = vTitle)
vCount ++
if (vCount = vNum)
if (1, oChild.accDoDefaultAction(0), vRet := A_Index)
break
}

oAcc := ""
Return vRet
}

;==================================================

JEE_ChromeGetTabNames(hWnd, vSep="`n")
{
oAcc := Acc_ObjectFromWindow(hWnd)
oAcc := Acc_Child(oAcc, 1), oAcc := Acc_Child(oAcc, 2)
oAcc := Acc_Child(oAcc, 2), oAcc := Acc_Child(oAcc, 2)

vOutput := ""
For each, oChild in Acc_Children(oAcc)
{
vTabText := Acc_Child(oChild, 1).accName(0)
if !(vTabText == "")
vOutput .= vTabText vSep
}
vOutput := SubStr(vOutput, 1, -StrLen(vSep)) ;trim right

oAcc := ""
Return vOutput
}

;==================================================

JEE_ChromeFocusTabByNum(hWnd, vNum)
{
oAcc := Acc_ObjectFromWindow(hWnd)
oAcc := Acc_Child(oAcc, 1), oAcc := Acc_Child(oAcc, 2)
oAcc := Acc_Child(oAcc, 2), oAcc := Acc_Child(oAcc, 2)

vRet := 0
For each, oChild in Acc_Children(oAcc)
{
if (A_Index = vNum+1)
if (1, oChild.accDoDefaultAction(0), vRet := A_Index)
break
}

Return vRet
}

;==================================================

JEE_ChromeFocusTabByName(hWnd, vTitle, vNum=1)
{
oAcc := Acc_ObjectFromWindow(hWnd)
oAcc := Acc_Child(oAcc, 1), oAcc := Acc_Child(oAcc, 2)
oAcc := Acc_Child(oAcc, 2), oAcc := Acc_Child(oAcc, 2)

vCount := 0
vRet := 0
For each, oChild in Acc_Children(oAcc)
{
vTabText := oChild.accName(0)
if (vTabText = vTitle)
vCount ++
if (vCount = vNum)
if (1, oChild.accDoDefaultAction(0), vRet := A_Index)
break
}

oAcc := ""
Return vRet
}