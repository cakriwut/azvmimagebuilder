write-host 'AIB Customization: OS Optimizations for WVD'
 $appName = 'optimize'
 $drive = 'C:\'
 New-Item -Path $drive -Name $appName  -ItemType Directory -ErrorAction SilentlyContinue
 $LocalPath = $drive + '\' + $appName 
 set-Location $LocalPath
 $osOptURL = 'https://github.com/The-Virtual-Desktop-Team/Virtual-Desktop-Optimization-Tool/archive/master.zip'
 $osOptURLexe = 'VDI_Optimize-master.zip'
 $outputPath = $LocalPath + '\' + $osOptURLexe
 Invoke-WebRequest -Uri $osOptURL -OutFile $outputPath
 write-host 'AIB Customization: Starting OS Optimizations script'
 Expand-Archive -LiteralPath $outputPath -DestinationPath $Localpath -Force -Verbose
 Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force -Verbose 
 Set-Location -Path C:\\Optimize\\Virtual-Desktop-Optimization-Tool-main

 Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process -Force
 .\Windows_VDOT.ps1 -Optimizations Edge, All -AcceptEULA
