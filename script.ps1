#If the file does not exist, create it.
if (-not(Test-Path -Path $PROFILE -PathType Leaf)) {
     try {
         Invoke-RestMethod https://github.com/NithinV404/powershell_script/raw/main/Microsoft.Powershell_profile.ps1 -o $PROFILE
         Write-Host "The profile @ [$PROFILE] has been created."
     }
     catch {
	  try { Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine }
	  catch { 
	  throw $_.Exception.Message }
     }
 }
# If the file already exists, show the message and do nothing.
 else {
		 Get-Item -Path $PROFILE | Move-Item -Destination oldprofile.ps1
		 Invoke-RestMethod https://github.com/NithinV404/powershell_script/raw/main/Microsoft.Powershell_profile.ps1 -o $PROFILE
		 Write-Host "The profile @ [$PROFILE] has been created and old profile removed."
 }
& $profile

# OMP Install
#
winget install -e --accept-source-agreements --accept-package-agreements JanDeDobbeleer.OhMyPosh

# Font Install
Invoke-RestMethod https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.0-RC/FiraCode.zip -o nerdfonts.zip

# Choco install
#
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

