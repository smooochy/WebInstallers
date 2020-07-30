$ScriptItem = Get-Item $($MyInvocation.MyCommand.Path)
$ScriptPath = $ScriptItem.DirectoryName
Push-Location $ScriptPath

Start-BitsTransfer -Source http://live.sysinternals.com/Files/SysinternalsSuite.zip -Destination C:\Temp\ -Verbose
Expand-Archive -Path C:\Temp\SysinternalsSuite.zip -DestinationPath "$Env:SystemRoot\System32" -Force -Verbose

Remove-Item -Path C:\Temp\SysinternalsSuite.zip -Force -Verbose
Pop-Location