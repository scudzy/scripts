F11::
  AdjustScreenBrightness(-5)
  Return

F12::
  AdjustScreenBrightness(5)
  Return

AdjustScreenBrightness(step) {
    service := "winmgmts:{impersonationLevel=impersonate}!\\.\root\WMI"
    monitors := ComObjGet(service).ExecQuery("SELECT * FROM WmiMonitorBrightness WHERE Active=TRUE")
    monMethods := ComObjGet(service).ExecQuery("SELECT * FROM wmiMonitorBrightNessMethods WHERE Active=TRUE")
    minBrightness := 5  ; level below this is identical to this

    for i in monitors {
        curt := i.CurrentBrightness
        break
    }
    if (curt < minBrightness)  ; parenthesis is necessary here
        curt := minBrightness
    toSet := curt + step
    if (toSet > 100)
        return
    if (toSet < minBrightness)
        toSet := minBrightness



    for i in monMethods {
        i.WmiSetBrightness(1, toSet)
        break
    }
}