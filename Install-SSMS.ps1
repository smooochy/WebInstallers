#Initicialize Paths
$Source = 'https://aka.ms/ssmsfullsetup'
$Path = 'C:\Temp\SSMS-Setup_ENU.exe' 

#Download and Install
Start-BitsTransfer -Source $Source -Destination $Path -Priority Foreground
$ExitCode = (Start-Process -FilePath $Path -ArgumentList '/passive' -PassThru -Wait).ExitCode

#Cleanup and return
If($ExitCode -eq 0){Remove-Item $Path -Verbose}
Return $ExitCode