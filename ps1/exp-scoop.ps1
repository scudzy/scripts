# export app names to scoop-apps.txt
$timestamp = $((get-date).ToLocalTime()).ToString("ddMMyyyy-HHmm")
(scoop export) | sls '^([\w-]+)' |% { $_.matches.groups[1].value } > D:\Dropbox\Zip\Apps-Config\cli\scoop-$timestamp.txt