[Console]::OutputEncoding = [Text.Encoding]::UTF8
if (-not (Test-Path -LiteralPath 'C:\Users\scudz\Password.sec'))
{
    Read-Host -Prompt 'Enter rclone configuration password' -AsSecureString | ConvertFrom-SecureString | Out-File -LiteralPath 'C:\Path\To\Password.sec' -NoNewline
}
New-Object -TypeName System.Net.NetworkCredential -ArgumentList '', (Get-Content -LiteralPath 'C:\Users\scudz\Password.sec' -Raw | ConvertTo-SecureString) | Select-Object -ExpandProperty Password