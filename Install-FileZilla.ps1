$Path = 'C:\Temp\FileZilla_latest_win64-setup.exe'
Start-BitsTransfer -Source 'https://download.filezilla-project.org/client/FileZilla_latest_win64-setup.exe' -Destination $Path

$ExitCode = (Start-Process -FilePath $Path -ArgumentList '/S /user=all' -Wait -PassThru).ExitCode

Remove-Item -Path $Path -Force

Return $ExitCode