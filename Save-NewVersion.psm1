Function Save-NewVersion{
   $Version = Set-NewVersion
   $NewSavePath =  (Set-NewSavepath -Version $Version -CurrentDirectory (Get-CurrentPath)) 
   New-VersionDirectory -NewSavePath $NewSavePath
   Copy-NewVersion -NewSavePath $NewSavePath -FileName (Get-FileName)
    
}Export-Modulemember -Function Save-NewVersion


Function Get-Version{
    [void][Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')
    $Version = [Microsoft.VisualBasic.Interaction]::InputBox('Enter actual Version:', 'Version')
    return $Version
}
Function Get-CurrentPath{
    return $psISE.CurrentFile.FullPath
}
Function Set-NewSavepath{
    Param(
        [string] $Version,
        [string] $CurrentDirectory
    )
    $ParentDirectory = Split-Path(Split-Path $CurrentDirectory -Parent) -Parent
    $NewSavePath =  Join-Path -Path $ParentDirectory -ChildPath (-join("Version",$Version))
    return $NewSavePath
}
Function New-VersionDirectory{
    Param(
        [string] $NewSavePath
    )
    New-Item -ItemType Directory -Path $NewSavePath
}
Function Get-FileName{
    return (Split-Path $psISE.CurrentFile.FullPath -Leaf)
}
Function Copy-NewVersion{
    Param(
        [string] $NewSavePath,
        [string] $FileName
    )
    $NewFile = Join-Path -Path $NewSavePath -ChildPath $FileName
    $psISE.CurrentFile.SaveAs($NewFile)
}

Function Set-NewVersion{
    return [int]$Value = [int]((Split-Path (Split-Path -Parent -Path (Get-CurrentPath)) -Leaf).Replace("Version","")) +1
}