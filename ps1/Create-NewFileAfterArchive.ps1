# Create-NewFileAfterArchive.ps1

# Full path of the file
$file = 'c:\temp\important_file.txt'

#Full path to the archiving folder
$archiveFolder = "c:\temp\archive_$(get-date -Format 'yyyy-MMM-dd_hh-mm-ss-tt')\"

# If the file exists, move it to the archive folder, then create a new file.
if (Get-Item -Path $file -ErrorAction Ignore) {
    try {
        ## If the Archive folder does not exist, create it now.
        if (-not(Test-Path -Path $archiveFolder -PathType Container)) {
            $null = New-Item -ItemType Directory -Path $archiveFolder -ErrorAction STOP
        }
        ## Move the existing file to the archive.
        Move-Item -Path $file -Destination $archiveFolder -Force -ErrorAction STOP
        Write-Host "The old file [$file] has been archived to [$archiveFolder]"
     } catch {
        throw $_.Exception.Message
     }
 }
 Create the new file
 try {
     $null = New-Item -ItemType File -Path $file -Force -ErrorAction Stop
     Write-Host "The new file [$file] has been created."
 } catch {
    Write-Host $_.Exception.Message
 }