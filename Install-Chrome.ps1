Start-BitsTransfer `
    -Source 'https://dl.google.com/tag/s/appguid%3D%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D%26iid%3D%7BDF6CFA29-A9D9-D95A-3898-84021B7E8514%7D%26lang%3Den%26browser%3D4%26usagestats%3D0%26appname%3DGoogle%2520Chrome%26needsadmin%3Dtrue%26ap%3Dx64-stable-statsdef_0%26brand%3DGCEA/dl/chrome/install/googlechromestandaloneenterprise64.msi' `
    -Destination "C:\Temp\"

Start-Process -FilePath 'msiexec.exe' -ArgumentList '/i C:\Temp\googlechromestandaloneenterprise64.msi /qb MSIFASTINSTALL=7'