# ISE-Addon-Versioning
PowerShell ISE-Addon to have control over Versioning of Scripts in FileSystem

This little PowerShell ISE-Addon gives you the abbility to Create new Version-Folder of your Current Script-Folder

For Example, you have a folder containing a folder Version1 there lays your script:
Get-Samplescript\Version1\Get-Samplescript.ps1

you work hard on it - after a while you want to save it as a new version the addon will generate a new Folder incremented logically regarding of the actual folder Version1 a new folder under Get-Samplescript with the name Version2 and put ther your scriptfile Get-Samplescript.ps1 with the changes you have made:
Get-Samplescript\Version2\Get-Samplescript.ps1
