@echo off
sc config MpsSvc start= auto
sc config KeyIso start= auto
sc config BFE start= auto
sc config FwcAgent start= auto
net stop MpsSvc
net start MpsSvc
net stop KeyIso
net start KeyIso
net start Wlansvc
net start dot3svc
net start EapHostnet
net stop BFE
net start BFE
net start PolicyAgent
net start MpsSvc
net start IKEEXT
net start DcaSvcnet
net stop FwcAgent
net start FwcAgent