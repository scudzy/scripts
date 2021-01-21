#requires -version 5.1
#requires -RunAsAdministrator

# Download-PSAboutHelp.ps1

<#
.Synopsis
Download About help topics from GitHub
.Description
You can use this command to download the About topics from the Microsoft
GitHub repository to your computer. The files will be downloaded and exported
as about topics to the default location based on the PowerShell version you
specify. Or you can specify an alternate location.

This command will install the Platyps module from the PowerShell Gallery if it
is not installed.

.Parameter AlternatePath
Specify an alternate path to for the About help files. The path must already exist.

.Example
PS C:\> c:\scripts\Download-PSAboutHelp.ps1

Download the About topics for PowerShell 5.1 and save them to the default location.

.Example
PS7 C:\> c:\scripts\Download-PSAboutHelp.ps1 -alternatepath C:\PS7\About

Download the About topics for PowerShell 7.0 and save to C:\PS7\About.

.Notes

This command uses the GitHub public API. It is possible that if you run this command
repeatedly in a short period of time that you might get an error regarding API limits.

This command has NOT been tested with PowerShell 6.x.

Learn more about PowerShell: http://jdhitsolutions.com/blog/essential-powershell-resources/

.Link
Get-Help
.Link
Update-Help
#>
[cmdletbinding(SupportsShouldProcess)]
Param(
    [Parameter(HelpMessage = "Specify an alternate path to for the About help files. The path must already exist.")]
    [string]$AlternatePath
)

#get the PowerShell version
$version = "{0}.{1}" -f $PSVersionTable.PSVersion.Major,$PSVersionTable.PSVersion.minor
#validate final Path

if ($AlternatePath) {
    Write-Verbose "Using alternate path $AlternatePath"
    $HelpPath = $AlternatePath
}
else {
    if ($version -eq "5.1") {
        $helpPath = "$PSHome\en-US"
    }
    else {
        if ($isWindows) {
            $helpPath = "D:\Documents\PowerShell\help\en-US\"
        }
        else {
            $helpPath = "~/.local/share/powershell/Help/en-US"
        }
    }
}

if (-Not (Test-Path $helpPath)) {
    Write-Warning "Failed to find the destination path $helpPath."
    #bail out
    return
}

#install Platyps if not found
if (-Not (Get-Module Platyps -ListAvailable)) {
    Write-Host "Installing the required Platyps module from the PowerShell Gallery" -ForegroundColor Yellow
    Try {
        Install-Module Platyps -force -errorAction Stop
    }
    Catch {
        #bail out if this fails
        Write-Warning "Failed to install Platyps. $($_.Exception.message)"
        return
    }
}
else {
    Import-Module Platyps
}

$base = "https://api.github.com"
$owner = "MicrosoftDocs"
$repo = "PowerShell-Docs"
$path = "reference/$version/Microsoft.PowerShell.Core/About"

Try {
    $r = Invoke-RestMethod -uri "$base/repos/$owner/$repo/contents/$path" -DisableKeepAlive -ErrorAction Stop
}
Catch {
    Write-Warning "Failed to download contents from $uri. $($_.exception.message)"
    #bail out
    return
}

#download file
$topics = $r | Where-Object name -ne "About.md"

if ($topics) {
    $count = $topics.count
    Write-Verbose "Found $count About topics"
`   $i = 0
    #Parameters for Write-Progress
    $progParam = @{
        Activity = $MyInvocation.MyCommand
        Status = "Downloading content"
        CurrentOperation = $null
        PercentComplete = 0
        ID = 1
    }

    #use the .NET framework for non-Windows systems which don't have $env:temp
    $destPath = Join-Path -path ([System.IO.Path]::GetTempPath()) -child AboutTmp
    if (-not (Test-Path $destPath)) {
        [void](New-Item $destPath -ItemType Directory)
    }

    foreach ($topic in $topics) {
        $i++
        [int]$pct = ($i/$count)*100
        $name = $topic.name.split(".")[0]
        Write-Verbose "Processing $($topic.name)"
        $dl = Join-Path -Path $destPath -ChildPath $topic.name
        Try {
            $progParam.currentOperation = $topic.download_url
            $progParam.percentcomplete = $pct
            Write-Progress @progParam

            if ($PSCmdlet.ShouldProcess($topic.name,"Download help content")) {
                Invoke-WebRequest -Uri $topic.download_url -OutFile $dl -UseBasicParsing -errorAction Stop
            }
        }
        Catch {
            Write-Warning "Failed to get $($topic.name). $($_.exception.message)"
        }

        $progParam.status = "Processing files"
        if (Test-Path $dl) {
            #strip off heading
            $progParam2 = @{
                Activity = "Reformatting content..."
                Status = $dl
                id = 2
                currentOperation = $topic.name
                ParentID = 1
            }
            Write-Progress @progParam2
            $content = Get-Content -Path $dl
            $content | Select-Object -skip 8 -first 2 | Set-Content -Path $dl -force
            #insert the about heading
            "## $name `n" | Add-Content -path $dl
            #insert the rest of the content
            $content | Select-Object -skip 10 | Add-Content -path $dl -Force
        }

    } #foreach topic

    $progParam.currentOperation = $null
    Write-Progress @progParam
    $progParam3 = @{
        Activity = "Generating external help"
        Status = $helpPath
        CurrentOperation = "...please wait"
        ID = 2
        ParentID = 1
    }

    Write-Progress @progParam3

    Write-Verbose "Generating help content to $helpPath ... please wait"
    if ($pscmdlet.ShouldProcess($destPath,"Create external help")) {
        New-ExternalHelp -Path $destPath -OutputPath $helpPath -Force
    }
    $progParam3.Completed = $True
    Write-Progress @progParam3

    #clean up
    if (Test-Path $destPath) {
        Write-Verbose "Cleaning up temporary download folder"
        Remove-Item -Path $destPath -Recurse -Force
    }
    Write-Host "You might need to start a new PowerShell session to see the new help." -ForegroundColor Green
}
else {
    Write-Warning "No about topics found"
}

<#
MIT License

Copyright (c) 2020 JDH Information Technology Solutions, Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:


The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.


THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
#>