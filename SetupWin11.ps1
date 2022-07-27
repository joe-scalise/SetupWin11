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

$ErrorActionPreference = "Stop"

if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Warning "You do not have Administrator rights"
    exit
}

# Get the latest version of PowerShell installed
Invoke-Expression "& { $(Invoke-RestMethod https://aka.ms/install-powershell.ps1) } -UseMSI -Quiet"

#Uninstall Norton
Invoke-RestMethod https://norton.com/nrnr -OutFile .\NRnR.exe
Invoke-Expression .\NRnR.exe

# Uninstall Bloatware-Apps
foreach ($item in $bloatwareList) {
	if (Get-AppXPackage -AllUsers -Name $item) {
		Write-Information "Removing $($item)" -InformationAction Continue
	    Get-AppxPackage -AllUsers -Name $item | Remove-AppxPackage
  	}
}
