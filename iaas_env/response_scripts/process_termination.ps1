param(
    [Parameter(Mandatory = $true)]
    [int]$ProcessId,

    [string[]]$TaskNames
)

if ($TaskNames.Count -eq 1 -and $TaskNames[0] -match ",") {
    $TaskNames = $TaskNames[0] -split "\s*,\s*"
}

if ($TaskNames) {
    foreach ($TaskName in $TaskNames) {
        schtasks /delete /tn $TaskName /f > $null 2>&1
    }
}

taskkill /pid $ProcessId /f > $null 2>&1
