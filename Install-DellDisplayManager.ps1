Get-Process ddmsetup | Stop-Process -Force
Remove-Item 'C:\Temp\ddmsetup.exe' -Force
Start-BitsTransfer -Source 'https://www.delldisplaymanager.com/ddmsetup.exe' -Destination "C:\Temp\"
Get-Process ddm | Stop-Process -Force
(Start-Process -FilePath "C:\Temp\ddmsetup.exe" -ArgumentList '/VERYSILENT /CLOSEAPPLICATIONS /SUPPRESSMSGBOXES' -Wait -PassThru).ExitCode