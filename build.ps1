 Write-Output $PSScriptRoot
$result = Invoke-Pester "$PSScriptRoot\Get-Planet.Tests.ps1"