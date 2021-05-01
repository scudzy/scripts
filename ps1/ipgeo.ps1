$ipaddress = $(Invoke-WebRequest ifconfig.me/ip).Content.Trim()
Invoke-RestMethod -Method Get -Uri "http://ip-api.com/json/$ipaddress"
Invoke-RestMethod -Method Get -Uri "http://xp5hx81e5m34qey52pc13rwtl575yhbe.edns.ip-api.com/"
