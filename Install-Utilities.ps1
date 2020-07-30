$ScriptItem = Get-Item $($MyInvocation.MyCommand.Path)
$ScriptPath = $ScriptItem.DirectoryName
Push-Location $ScriptPath

$Utilities = @(
 '.\cmtrace.exe'
 '.\DelProf2.exe'
 '.\MsiZap.exe'
)

Foreach($Utility in $Utilities){Copy-Item -Path $Utility -Destination "$Env:SystemRoot\System32\"}
Pop-Location