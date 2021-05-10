$myPfx = "D:\Documents\Cert\scudzy-signcertv1.pfx"
$MyStrongPassword = ConvertTo-SecureString -String "3XlLQTUp4lUmgeD5" -Force -AsPlainText 

#How to import your Self signed PFX
#Personal
Import-PfxCertificate -FilePath $myPfx -CertStoreLocation "cert:\LocalMachine\My" -Password $MyStrongPassword 
#TrustedPublisher
Import-PfxCertificate -FilePath $myPfx -CertStoreLocation "cert:\LocalMachine\Root" -Password $MyStrongPassword 
#Root
Import-PfxCertificate -FilePath $myPfx -CertStoreLocation "cert:\LocalMachine\TrustedPublisher" -Password $MyStrongPassword