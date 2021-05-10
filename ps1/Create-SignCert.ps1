#requires -runasadministrator 

# Paolo Frigo, https://www.scriptinglibray.com

# This scripts generates a self-signed certificate for CodeSigning and exports to a PFX Format

#SETTINGS
$CertificateName = "scudzy's Signing Certificate"
$OutPutPFXFilePath = "D:\Documents\Cert\scudzy-signcertv1.pfx"
$MyStrongPassword = ConvertTo-SecureString -String '3XlLQTUp4lUmgeD5' -Force -AsPlainText 


New-SelfSignedCertificate -subject $CertificateName -Type CodeSigning  | Export-PfxCertificate -FilePath $OutPutPFXFilePath -password $MyStrongPassword 
Write-Output "PFX Certificate `"$CertificateName`" exported: $OutPutPFXFilePath"