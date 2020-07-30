$URI = 'https://download.videolan.org/vlc/last/win64'
$Installer = (Invoke-WebRequest -Uri $URI -UseBasicParsing).Links.href | Where-Object{$_ -like "*.msi"}

Invoke-WebRequest -Uri "$URI\$Installer" -OutFile "C:\Temp\$Installer" -PassThru

Start-Process -FilePath 'msiexec.exe' -ArgumentList "/i C:\Temp\$($Installer) /qb MSIFASTINSTALL=7" -Wait
Remove-Item "C:\Temp\$($Installer)" -Force