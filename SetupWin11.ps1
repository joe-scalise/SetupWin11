$bloatwareList = @(
    "Microsoft.3DBuilder", "Microsoft.Microsoft3DViewer", "Microsoft.AppConnector",
    "Microsoft.BingFinance", "Microsoft.BingNews", "Microsoft.BingSports",
    "Microsoft.BingTranslator", "Microsoft.BingWeather", "Microsoft.BingFoodAndDrink",
    "Microsoft.BingHealthAndFitness", "Microsoft.BingTravel", "Microsoft.GetHelp",
    "Microsoft.Getstarted", "Microsoft.Messaging", "Microsoft.Microsoft3DViewer",
    "Microsoft.MicrosoftSolitaireCollection", "Microsoft.NetworkSpeedTest", "Microsoft.Office.Lens",
    "Microsoft.Office.Sway", "Microsoft.Office.OneNote", "Microsoft.OneConnect",
    "Microsoft.People", "Microsoft.Print3D", "Microsoft.SkypeApp",
    "Microsoft.Wallet", "Microsoft.WindowsAlarms", "Microsoft.windowscommunicationsapps",
    "Microsoft.WindowsFeedbackHub", "Microsoft.WindowsMaps", "Microsoft.WindowsPhone",
    "Microsoft.ConnectivityStore", "Microsoft.CommsPhone", "Microsoft.ScreenSketch",
    "Microsoft.ZuneMusic", "Microsoft.ZuneVideo", "Microsoft.YourPhone",
    "Microsoft.Getstarted", "Microsoft.MicrosoftOfficeHub", "*EclipseManager*",
    "*ActiproSoftwareLLC*", "*AdobeSystemsIncorporated.AdobePhotoshopExpress*",
    "*Duolingo-LearnLanguagesforFree*", "*PandoraMediaInc*", "*CandyCrush*",
    "*BubbleWitch3Saga*", "*Wunderlist*", "*Flipboard*", "*Twitter*",
    "*Facebook*", "*Royal Revolt*", "*Sway*", "*Speed Test*", "*Dolby*",
    "*Viber*", "*ACGMediaPlayer*", "*Netflix*", "*OneCalendar*",
    "*LinkedInforWindows*", "*HiddenCityMysteryofShadows*", "*Hulu*",
    "*HiddenCity*", "*AdobePhotoshopExpress*", "*HotspotShieldFreeVPN*",
    "*Microsoft.Advertising.Xaml*", "MicrosoftTeams*", "Microsoft.OneDriveSync",
    "Microsoft.Todos", "Microsoft.549981C3F5F10_8wekyb3d8bbwe", "Microsoft.Windows.PeopleExperienceHost"
)

# Uninstall Bloatware-Apps
foreach ($item in $bloatwareList) {
    Get-AppxPackage -Name $item
    #Get-AppxPackage -Name $item| Remove-AppxPackage
    #Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like $Bloat | Remove-AppxProvisionedPackage -Online
}
