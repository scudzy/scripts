# install apps from scoop-apps.txt
$apps = Get-Content scoop-apps.txt
scoop install @apps