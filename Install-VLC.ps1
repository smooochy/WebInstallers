$URI = 'https://download.videolan.org/vlc/last/win64'
$Installer = (Invoke-WebRequest -Uri $URI -UseBasicParsing).Links.href | Where-Object{$_ -like "*.msi"}

Start-BitsTransfer -Source "$URI/$Installer" -Destination "$Env:TEMP"

Start-Process -FilePath 'msiexec.exe' -ArgumentList "/i `"$Env:TEMP\$($Installer)`" /passive MSIFASTINSTALL=7" -Wait
Remove-Item "$Env:TEMP\$($Installer)" -Force