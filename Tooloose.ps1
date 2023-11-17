#NM

#Check if c:\temp folder exist - if not it will create the folder

$folderPath = "C:\temp"
if (!(Test-Path $folderPath -PathType Container)) {
    New-Item -ItemType Directory -Force -Path $folderPath
}
 
$Url = "https://aeimagesintune.blob.core.windows.net/backgroundimages/_AdminToolsV4.zip"

$DownloadZipFile = "C:\temp\" + $(Split-Path -Path $Url -Leaf)

$ExtractPath = "C:\temp\"

Invoke-WebRequest -Uri $Url -OutFile $DownloadZipFile

$ExtractShell = New-Object -ComObject Shell.Application 

$ExtractFiles = $ExtractShell.Namespace($DownloadZipFile).Items() 

$ExtractShell.NameSpace($ExtractPath).CopyHere($ExtractFiles) 

Start-Process $ExtractPath

Set-ExecutionPolicy -ExecutionPolicy bypass -Force

Set-Location C:\Temp\_AdminToolsV4

.\NicoAdminV2.ps1
