Start-BitsTransfer -Source 'https://akamaicdn.webex.com/client/webexapp.msi' -Destination 'C:\Temp\' -Asynchronous
Start-BitsTransfer -Source 'https://akamaicdn.webex.com/upgradeserver/client/ptool/40.7.0/msi/webexplugin.msi' -Destination 'C:\Temp\'

Start-Process -FilePath 'msiexec.exe' -ArgumentList '/i C:\Temp\webexapp.msi MSIFASTINSTALL=7 /qb' -Wait -PassThru
Start-Process -FilePath 'msiexec.exe' -ArgumentList '/i C:\Temp\webexplugin.msi MSIFASTINSTALL=7 /qb' -Wait -PassThru
Remove-Item C:\Temp\webexapp.msi -Force
Remove-Item C:\Temp\webexplugin.msi -Force