$ScriptItem = Get-Item $($MyInvocation.MyCommand.Path)
$ScriptPath = $ScriptItem.DirectoryName
Push-Location $ScriptPath

(Start-Process -FilePath 'msiexec.exe' -ArgumentList '/i Teams_windows_x64.msi /q MSIFASTINSTALL=7 /l*v C:\Temp\Microsoft_Teams-install.log' -Wait -PassThru).ExitCode