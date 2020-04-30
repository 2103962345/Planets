Install-Module -Name Pester -Force

$result = Invoke-Pester "Get-Planet.Tests.ps1"

if ($result.TotalCount -lt 1) {
    $m = "No tests were run."

    if ($LocalBuild) {
        $m
        exit 9999
    }
    else {
        throw $m
    }
}

if ($result.FailedCount -gt 0) {
    $m = "$($result.FailedCount) tests did not pass."
    if ($LocalBuild) {
        $m
        exit $result.FailedCount
    }
    else {
        throw $m
    }
}