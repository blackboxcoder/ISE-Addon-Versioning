Import-Module "C:\Users\USERNAME\Documents\WindowsPowerShell\Modules\Save-NewVersion.psm1"
$MyMenu = $psISE.CurrentPowerShellTab.AddOnsMenu.Submenus.Add("Versioning",$null,$null)
$MyMenu.Submenus.Add("New-Version",{Save-NewVersion},"ctrl+Alt+V") | Out-Null