$URI = ((Invoke-WebRequest -Uri (Invoke-WebRequest -UseBasicParsing -Uri 'https://notepad-plus-plus.org/downloads/' | Select-Object -ExpandProperty Links | Select-Object -ExpandProperty outerHTML | Where-Object {$_ -like "<a href=`"https://notepad-plus-plus.org*"} | Select-Object -First 1).Split("`n")[0].Replace('<a href=','').Replace('"','').Replace('>','') | Select-Object -ExpandProperty Links | Select-Object -ExpandProperty outerHTML).Split('"') | Where-Object {$_ -like "https://*"})[1]
$FileName = ($URI.Split('/')) | Select-Object -Last 1
$FilePath = "C:\Temp\"
Invoke-WebRequest -Uri $URI -PassThru -OutFile "$FilePath\$FileName"
$ExitCode = (Start-Process -FilePath "$FilePath\$FileName" -ArgumentList '/S' -Wait -PassThru).ExitCode
Remove-Item "$FilePath\$FileName"
Return $ExitCode