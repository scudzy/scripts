$ipaddress = $(Invoke-WebRequest ifconfig.me/ip).Content.Trim()
Invoke-RestMethod -Method Get -Uri "http://ip-api.com/json/$ipaddress"
Invoke-RestMethod -Method Get -Uri "http://edns.ip-api.com/json/"