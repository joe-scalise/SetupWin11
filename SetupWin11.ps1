<#
.Synopsis
Assist in setting up Windows 11.
#>

[CmdletBinding()]
param()

$bloatwareList = @(
    "Microsoft.BingNews",
    "Microsoft.BingWeather",
    "Microsoft.GetHelp",
    "Microsoft.Getstarted",
    "Microsoft.MicrosoftSolitaireCollection",
    "Microsoft.People",
    "Microsoft.WindowsAlarms",
    "microsoft.windowscommunicationsapps",
    "Microsoft.WindowsFeedbackHub",
    "Microsoft.WindowsMaps",
    "Microsoft.ScreenSketch",
    "Microsoft.ZuneMusic",
    "Microsoft.ZuneVideo",
    "Microsoft.YourPhone",
    "MicrosoftTeams",
    "Microsoft.OneDriveSync",
    "Microsoft.Todos",
    "Microsoft.Windows.PeopleExperienceHost"    
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
