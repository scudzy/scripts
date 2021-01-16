# export app names to scoop-apps.txt
$timestamp = $((get-date).ToLocalTime()).ToString("dd-MM-yyyy-HHmm")
(scoop export) | sls '^([\w-]+)' |% { $_.matches.groups[1].value } > D:\Dropbox\Zip\Apps-Config\scoop-apps-$timestamp.txt