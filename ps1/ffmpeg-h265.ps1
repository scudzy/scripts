#...............MP4 File Compression Script................
#..........................................................
#.Description:   This script is will compress your MP4
#                files using the H265 video codec. The
#                purpose is to aid with saving disk s-
#                pace while preserving the video qual-
#                ity and audio quality of the original
#                source file.
#..........................................................
#.How to:        Run the script & get prompted to inst-
#                all FFMPEG (hardcoded). If you need it
#                installed, click yes. The ZIP file is
#                extracted in C:\Program Files\FFMPEG.
#
#                Once installed, you are prompted to
#                select the root folder where your MP4
#                files are located. Copy/paste the path
#                in the PowerShell terminal and let the
#                script run.
#..........................................................
#.How it works:  The script will scan the root directory
#                recursively, & log all MP4 files to an
#                array. Then it will compress them one by
#                one using the H265 codec. Upon completion,
#                the compressed file will be analyzed to
#                determine if it is smaller than the source
#                file. If so, the source file is removed &
#                the compressed file is renamed to the same
#                name as the source file along with the
#                original timestamp.
#
#                A log file is created so you can review
#                how the script ran and how much disk space
#                you saved. The log file is hardcoded to
#                save to C:\Program Files\FFmpeg\Logs.
#..........................................................


#Set Global Variables used in the script
$path ='C:\Program Files\FFmpeg\'
$storage = 0
$storagestart = 0
$storageend = 0

#Function for converting the formatting for folder of file sizes
Function Format-FileSize() {
    Param ([int]$size)
    If ($size -gt 1TB) {[string]::Format("{0:0.00} TB", $size / 1TB)}
    ElseIf ($size -gt 1GB) {[string]::Format("{0:0.00} GB", $size / 1GB)}
    ElseIf ($size -gt 1MB) {[string]::Format("{0:0.00} MB", $size / 1MB)}
    ElseIf ($size -gt 1KB) {[string]::Format("{0:0.00} kB", $size / 1KB)}
    ElseIf ($size -gt 0) {[string]::Format("{0:0.00} B", $size)}
    Else {""}
}

#Function for creating a log file
Function Write-Log {
    [CmdletBinding()]
    Param(
    [Parameter(Mandatory=$False)]
    [ValidateSet("INFO","WARN","ERROR","FATAL","DEBUG")]
    [String]
    $Level = "INFO",

    [Parameter(Mandatory=$True)]
    [string]
    $Message,

    [Parameter(Mandatory=$False)]
    [string]
    $logfile
    )

    $Stamp = (Get-Date).toString("yyyy/MM/dd HH:mm:ss")
    $Line = "$Stamp $Level $Message"
    If($logfile) {
        Add-Content $logfile -Value $Line
    }
    Else {
        Write-Output $Line
    }
}

#install FFMPEG
#NOTE: After 9/18/2020, the source location for FFMPEG at https://ffmpeg.zeranoe.com may not be available
#      Make sure to address this if it poses any problems in the future.
$message  = 'Installation Prompt'
$question = 'Do you need to install FFmpeg?'
$choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))

$decision = $Host.UI.PromptForChoice($message, $question, $choices, 1)
if ($decision -eq 0) {
    $url = "https://ffmpeg.zeranoe.com/builds/win64/static/ffmpeg-20200831-4a11a6f-win64-static.zip"
    Write-Log -Level DEBUG -Message "Downloading $url to $path" -logfile $Logfile
    if (Test-Path $path) {
       # Create directory if it doesn't exist
       Remove-Item -Path $path -Recurse -Force -Confirm:$false
       Write-Log -Level DEBUG -Message "FFMPEG exists already, original install is being deleted." -logfile $Logfile
    }

    New-Item -Path $path -ItemType "directory"
    $output = $path +"ffmpeg.zip"
    Write-Log -Level INFO -Message "Downloading to file ffmpeg.zip..." -logfile $Logfile
    $start_time = Get-Date
    Invoke-WebRequest -Uri $url -OutFile $output
    Expand-Archive -Path $output -DestinationPath $path
    Remove-Item -Path "$path\ffmpeg.zip"

    #Moves ffmpeg folders to parent directory
    Get-ChildItem "$path\*\*" -Directory | Move-Item -Destination $path

    #Moves any files from $path to parent folder
    $files = Get-ChildItem "$path\ff*\*"
    Get-ChildItem $files | Move-Item -Destination { $_.Directory.Parent.FullName }

    #Removes empty folders
    Get-ChildItem -Path $path -Recurse -Force | Where-Object { $_.PSIsContainer -and (Get-ChildItem -Path $_.FullName -Recurse -Force | Where-Object { !$_.PSIsContainer }) -eq $null } | Remove-Item -Force -Recurse

    Write-Log -Level INFO -Message "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s) for ffmpeg installation" -logfile $Logfile
    }
    Write-Log -Level DEBUG -Message "FFMPEG intstallation task completed." -logfile $Logfile
    #install FFMPEG COMPLETE

#Create Log File
if (!(test-path "$path\Logs")){
  New-Item -Path "$path" -ItemType directory -Name Logs
  } else {
  #do nothing
  }

#Start appending to the log file
$Logfile = "$path\Logs\$(gc env:computername)_VideoCompressions.log"
Write-Log -Level INFO -Message "." -logfile $Logfile
Write-Log -Level INFO -Message "********************" -logfile $Logfile
Write-Log -Level INFO -Message "SCRIPT RUN ON:" -logfile $Logfile
Write-Log -Level INFO -Message (Get-Date) -logfile $Logfile
Write-Log -Level INFO -Message "********************" -logfile $Logfile

#Get ROOT folder path - this section will collect the file info for MP4 files only
$fpath = Read-Host "Enter File Path (format example: C:\MY\FILE\PATH OR \\MY\FILE\PATH)"
if(Test-Path $fpath){
    $files = Get-ChildItem -Path $fpath -Recurse -Filter *.mp4
        Write-Log -Level INFO -Message "Getting all child items with file extension *.MP4 Recursively" -logfile $Logfile
    foreach ($file in $files) {
            Write-Log -Level DEBUG -Message "File being compressed: $file" -logfile $Logfile
        $compressedFile = Convert-Path -Path $file.FullName
            Write-Log -Level DEBUG -Message "Obtaining file path for file to be converted: $compressedFile" -logfile $Logfile
        $compressedFile = $compressedFile.Substring(0,($compressedFile.Length - 4))+ "_New.mp4"
            Write-Log -Level DEBUG -Message "Setting temporary file name for converted file: $compressedFile" -logfile $Logfile

        #Command to run FFMpeg to compress video files (feel free to change this to your desired settings if necessary)
        & "C:\Program Files\FFmpeg\bin\ffmpeg.exe" -i $file.Fullname -vcodec libx265 -crf 28 "$compressedFile"
            Write-Log -Level DEBUG -Message "Compression complete for $compressedFile" -logfile $Logfile

        (Get-Item $compressedFile).LastWriteTime = (Get-Item $file.FullName).LastWriteTime
            Write-Log -Level DEBUG -Message "Updating timestamp of: $compressedFile to match original file." -logfile $Logfile

        #Check if compression resulted in a smaller file size
        $originalSize = ((Get-Item $file.FullName).length)
        $compressSize = ((Get-Item $compressedFile).length)
        $deltaSize = $originalSize - $compressSize
        if($deltaSize -lt 0) {
            Remove-Item $compressedFile
            $deltaSize = $deltaSize * (-1)
            $delta = Format-FileSize $deltaSize
                Write-Log -Level INFO -Message "Compression of $file resulted in a larger file" -logfile $Logfile
                Write-Log -Level DEBUG -Message "Compressed file was $delta larger than the source file" -logfile $Logfile
            } else {
                Remove-Item $file.FullName
                Rename-Item $compressedFile -NewName $file.Name
                $delta = Format-FileSize $deltaSize
                    Write-Log -Level INFO -Message "Original file ($file) removed and compressed file ($compressedFile) renamed to original filename." -logfile $Logfile
                    Write-Log -Level DEBUG -Message "Compression of $file has saved $delta of space." -logfile $Logfile
                    $storagestart += $originalSize
                    $storageend += $compressSize
                    $storage += $deltaSize
                    }
    }
    #Calculate disk space usage for log file
    $delta = Format-FileSize $storage
    $start = Format-FileSize $storagestart
    $end = Format-FileSize $storageend
    $totalFiles=$files.count

    Write-Log -Level INFO -Message "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" -logfile $Logfile
    Write-Log -Level INFO -Message "ROOT FOLDER LOCATION......................: $fpath" -logfile $Logfile
    Write-Log -Level INFO -Message "ROOT FOLDER SIZE BEFORE COMPRESSION.......: $start" -logfile $Logfile
    Write-Log -Level INFO -Message "ROOT FOLDER SIZE AFTER COMPRESSION........: $end" -logfile $Logfile
    Write-Log -Level INFO -Message "TOTAL NUMBER OF FILES COMPRESSED..........: $totalFiles" -logfile $Logfile
    Write-Log -Level INFO -Message "DISK SPACE SAVED THROUGH FILE COMPRESSION.: $delta" -logfile $Logfile
    Write-Log -Level INFO -Message "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" -logfile $Logfile
    Write-Log -Level INFO -Message "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" -logfile $Logfile
} else {
    Write-Host "INVALID PATH" -ForegroundColor Red
        Write-Log -Level FATAL -Message "INVALID File path. $fpath does not exist. Exiting" -logfile $Logfile
        }
#Open log file upon completion of the script
Invoke-Item $Logfile