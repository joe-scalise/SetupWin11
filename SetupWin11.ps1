<#
.Synopsis
Assist in setting up Windows 11.
#>

[CmdletBinding()]
param()

$bloatwareList = @(
	"Microsoft.BingNews"
	"Microsoft.BingWeather"
	"Microsoft.GetHelp"
	"Microsoft.Getstarted"
	"Microsoft.MicrosoftOfficeHub"
	"Microsoft.MicrosoftSolitaireCollection"
	"Microsoft.People"
	"Microsoft.PowerAutomateDesktop"
	"Microsoft.SecHealthUI"
	"Microsoft.Todos"
	"Microsoft.WindowsAlarms"
	"microsoft.windowscommunicationsapps"
	#"Microsoft.WindowsFeedbackHub"
	"Microsoft.WindowsMaps"
	"Microsoft.WindowsSoundRecorder"
	"Microsoft.YourPhone"
	"Microsoft.ZuneMusic"
	"Microsoft.ZuneVideo"
	"MicrosoftWindows.Client.WebExperience"
	"MicrosoftTeams"
	"*Dropbox*"
	"*Spotify*"
)

$originalErrorAction = $ErrorActionPreference
$ErrorActionPreference = "Stop"
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Warning "You do not have Administrator rights"
    exit
}

# Uninstall Bloatware Apps
Write-Information "Uninstalling bloatware apps" -InformationAction Continue
foreach ($item in $bloatwareList) {
	if (Get-AppXPackage -AllUsers -Name $item) {
		Write-Information "Removing $($item)" -InformationAction Continue
	    Get-AppxPackage -AllUsers -Name $item | Remove-AppxPackage
  	}
}

Write-Information "Installing scoop package manager" -InformationAction Continue
Invoke-RestMethod get.scoop.sh | Invoke-Expression

# Get the latest version of PowerShell installed
Write-Information "Installing latest version of PowerShell" -InformationAction Continue
Invoke-Expression "& { $(Invoke-RestMethod https://aka.ms/install-powershell.ps1) } -UseMSI -Quiet"

#Uninstall Norton
Write-Information "Uninstall Norton" -InformationAction Continue
Invoke-RestMethod https://norton.com/nrnr -OutFile .\NRnR.exe
Invoke-Expression .\NRnR.exe

# Install Visual Studio Code
Write-Information "Installing Visual Studio Code" -InformationAction Continue
Invoke-Expression -Command "scoop install visual"

# Enable Windows Subsystem for Linux
# https://docs.microsoft.com/en-us/windows/wsl/setup/environment#set-up-your-linux-username-and-password
Write-Information "Installing Windows Subsystem for Linux" -InformationAction Continue
Invoke-Expression -Command "wsl --install"

$ErrorActionPreference = $originalErrorAction
