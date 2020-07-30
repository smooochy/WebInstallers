$Site = 'https://github.com'
$Suffix = ([xml]((Invoke-WebRequest -Uri 'https://github.com/greenshot/greenshot/releases' -UseBasicParsing).Links.outerHTML | ?{$_ -like "*-RELEASE.exe*"})[0]).a.href

$URL = "$($Site)$($Suffix)"
$FileName = $URL.Split('/') | Select-Object -Last 1

Invoke-WebRequest -Uri $URL -OutFile "C:\Temp\$FileName" -UseBasicParsing