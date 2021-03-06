$max_jobs = 10
$tstart = get-date
$log = "c:\Logs\"

$src = Read-Host -Prompt 'Source path'
if(! ($src.EndsWith("\") )){$src=$src + "\"}
$dest = Read-Host -Prompt 'Destination path'
if(! ($dest.EndsWith("\") )){$dest=$dest + "\"}


if((Test-Path -Path $src ))
{
	if(!(Test-Path -Path $log )){New-Item -ItemType directory -Path $log}
	if((Test-Path -Path $dest)){
		robocopy $src $dest
		$files = ls $src
		
		$files | %{
			$ScriptBlock = {
			param($name, $src, $dest, $log)
			$log += "\$name-$(get-date -f yyyy-MM-dd-mm-ss).log"
			robocopy $src$name $dest$name /E /nfl /np /mt:16 /ndl > $log
			Write-Host $src$name " completed"
			 }
			$j = Get-Job -State "Running"
			while ($j.count -ge $max_jobs) 
			{
			 Start-Sleep -Milliseconds 500
			 $j = Get-Job -State "Running"
			}
			 Get-job -State "Completed" | Receive-job
			 Remove-job -State "Completed"
			Start-Job $ScriptBlock -ArgumentList $_,$src,$dest,$log
		}

		While (Get-Job -State "Running") { Start-Sleep 2 }
		Remove-Job -State "Completed" 
		  Get-Job | Write-host

		$tend = get-date
		Cls
		Echo 'Completed copy'
		Echo 'From: $src'
		Echo 'To: $Dest'
		new-timespan -start $tstart -end $tend
		
	} else {echo 'invalid Destination'}
}else {echo 'invalid Source'}
	