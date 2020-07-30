$URI = "https://nmap.org/npcap/$((Invoke-WebRequest -Uri 'https://nmap.org/npcap/#download' | Select -ExpandProperty Links | ?{$_.innerText -like "*Installer"}).href)"
$NPCAPFileName = $URI.Split('/') | Select-Object -Last 1

Start-BitsTransfer -Source "https://nmap.org/npcap/$((Invoke-WebRequest -Uri 'https://nmap.org/npcap/#download' | Select -ExpandProperty Links | ?{$_.innerText -like "*Installer"}).href)" -Destination "C:\Temp\"
Start-BitsTransfer -Source "https://1.na.dl.wireshark.org/win64/Wireshark-win64-latest.msi" -Destination "C:\Temp\"

Start-Process -FilePath 'msiexec.exe'  -ArgumentList '/i C:\Temp\Wireshark-win64-latest.msi /q MSIFASTINSTALL=7'
Start-Process -FilePath "C:\Temp\$NPCAPFileName"