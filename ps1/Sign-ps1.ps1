$MyCertFromPfx = Get-PfxCertificate -FilePath D:\Documents\Cert\scudzy-signcertv1.pfx
$MyStrongPassword = ConvertTo-SecureString -String '3XlLQTUp4lUmgeD5' -Force -AsPlainText
Set-AuthenticodeSignature -PSPath "D:\Github\Scripts\psm1\MyFunction\MyFunction.psm1" -Certificate $MyCertFromPfx
Get-AuthenticodeSignature "D:\Github\Scripts\psm1\MyFunction\MyFunction.psm1"