Start-BitsTransfer -Source 'https://download.garmin.com/omt/express/GarminExpress.exe' -Destination 'C:\Temp\GarminExpress.exe'
Start-Process -FilePath 'C:\Temp\GarminExpress.exe' -ArgumentList '/quiet' -Wait -PassThru
Remove-Item C:\Temp\GarminExpress.exe -Force