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
	"Microsoft.Todos"
	"Microsoft.WindowsAlarms"
	"microsoft.windowscommunicationsapps"
	"Microsoft.WindowsMaps"
	"Microsoft.WindowsSoundRecorder"
	"Microsoft.YourPhone"
	"Microsoft.ZuneMusic"
	"Microsoft.ZuneVideo"
	"MicrosoftWindows.Client.WebExperience"
	"MicrosoftTeams"
)

if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Warning "You do not have Administrator rights"
    exit
}

$ErrorActionPreference = "Stop"

# Get the latest version of PowerShell installed
if ($PSVersionTable.PSVersion.Major -lt 7) {
    Invoke-Expression "& { $(Invoke-RestMethod https://aka.ms/install-powershell.ps1) } -UseMSI -Quiet"
}

# Uninstall Bloatware-Apps
foreach ($item in $bloatwareList) {
    Get-AppxPackage -Name $item | Select Name
    #Get-AppxPackage -Name $item| Remove-AppxPackage
    #Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like $Bloat | Remove-AppxProvisionedPackage -Online
}
