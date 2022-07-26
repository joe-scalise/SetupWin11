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

$Apps = @(
    # Default Windows 10+ apps
    "Microsoft.3DBuilder"                    # 3D Builder
    "Microsoft.Appconnector"
    "Microsoft.BingFinance"                  # Finance
    "Microsoft.BingFoodAndDrink"             # Food And Drink
    "Microsoft.BingHealthAndFitness"         # Health And Fitness
    "Microsoft.BingNews"                     # News
    "Microsoft.BingSports"                   # Sports
    "Microsoft.BingTranslator"               # Translator
    "Microsoft.BingTravel"                   # Travel
    "Microsoft.BingWeather"                  # Weather
    "Microsoft.CommsPhone"
    "Microsoft.ConnectivityStore"
    "Microsoft.GetHelp"
    "Microsoft.Getstarted"
    "Microsoft.Messaging"
    "Microsoft.Microsoft3DViewer"
    "Microsoft.MicrosoftOfficeHub"
    "Microsoft.MicrosoftPowerBIForWindows"
    "Microsoft.MicrosoftSolitaireCollection" # MS Solitaire
    "Microsoft.MixedReality.Portal"
    "Microsoft.NetworkSpeedTest"
    "Microsoft.Office.OneNote"               # MS Office One Note
    "Microsoft.Office.Sway"
    "Microsoft.OneConnect"
    "Microsoft.People"                       # People
    "Microsoft.MSPaint"                      # Paint 3D (Where every artist truly start as a kid, i mean, on original Paint, not this 3D)
    "Microsoft.Print3D"                      # Print 3D
    "Microsoft.SkypeApp"                     # Skype (Who still uses Skype? Use Discord)
    "Microsoft.Todos"                        # Microsoft To Do
    "Microsoft.Wallet"
    "Microsoft.Whiteboard"                   # Microsoft Whiteboard
    "Microsoft.WindowsAlarms"                # Alarms
    "microsoft.windowscommunicationsapps"
    "Microsoft.WindowsMaps"                  # Maps
    "Microsoft.WindowsPhone"
    "Microsoft.WindowsReadingList"
    "Microsoft.WindowsSoundRecorder"         # Windows Sound Recorder
    "Microsoft.XboxApp"                      # Xbox Console Companion (Replaced by new App)
    "Microsoft.YourPhone"                    # Your Phone
    "Microsoft.ZuneMusic"                    # Groove Music / (New) Windows Media Player
    "Microsoft.ZuneVideo"                    # Movies & TV

    # Default Windows 11 apps
    "MicrosoftWindows.Client.WebExperience"  # Taskbar Widgets
    "MicrosoftTeams"                         # Microsoft Teams / Preview

    # 3rd party Apps
    "*ACGMediaPlayer*"
    "*ActiproSoftwareLLC*"
    "*AdobePhotoshopExpress*"                # Adobe Photoshop Express
    "*Amazon.com.Amazon*"                    # Amazon Shop
    "*Asphalt8Airborne*"                     # Asphalt 8 Airbone
    "*AutodeskSketchBook*"
    "*BubbleWitch3Saga*"                     # Bubble Witch 3 Saga
    "*CaesarsSlotsFreeCasino*"
    "*CandyCrush*"                           # Candy Crush
    "*COOKINGFEVER*"
    "*CyberLinkMediaSuiteEssentials*"
    "*DisneyMagicKingdoms*"
    "*Dolby*"                                # Dolby Products (Like Atmos)
    "*DrawboardPDF*"
    "*Duolingo-LearnLanguagesforFree*"       # Duolingo
    "*EclipseManager*"
    "*Facebook*"                             # Facebook
    "*FarmVille2CountryEscape*"
    "*FitbitCoach*"
    "*Flipboard*"                            # Flipboard
    "*HiddenCity*"
    "*Hulu*"
    "*iHeartRadio*"
    "*Keeper*"
    "*LinkedInforWindows*"
    "*MarchofEmpires*"
    "*NYTCrossword*"
    "*OneCalendar*"
    "*PandoraMediaInc*"
    "*PhototasticCollage*"
    "*PicsArt-PhotoStudio*"
    "*Plex*"                                 # Plex
    "*PolarrPhotoEditorAcademicEdition*"
    "*RoyalRevolt*"                          # Royal Revolt
    "*Shazam*"
    "*Sidia.LiveWallpaper*"                  # Live Wallpaper
    "*SlingTV*"
    "*Speed Test*"
    "*Sway*"
    "*TuneInRadio*"
    "*Twitter*"                              # Twitter
    "*Viber*"
    "*WinZipUniversal*"
    "*Wunderlist*"
    "*XING*"
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
