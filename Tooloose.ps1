$Url = "https://aeimagesintune.blob.core.windows.net/backgroundimages/_AdminToolsV3.zip"

$DownloadZipFile = "C:\temp\" + $(Split-Path -Path $Url -Leaf)

$ExtractPath = "C:\temp\"

Invoke-WebRequest -Uri $Url -OutFile $DownloadZipFile

$ExtractShell = New-Object -ComObject Shell.Application 

$ExtractFiles = $ExtractShell.Namespace($DownloadZipFile).Items() 

$ExtractShell.NameSpace($ExtractPath).CopyHere($ExtractFiles) 

Start-Process $ExtractPath

Set-ExecutionPolicy -ExecutionPolicy bypass -Force

Set-Location C:\Temp\_AdminToolsV3

.\NicoAdminV2.ps1
