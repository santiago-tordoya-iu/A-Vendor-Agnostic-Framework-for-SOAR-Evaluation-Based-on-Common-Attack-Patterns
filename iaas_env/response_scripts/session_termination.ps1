param(
    [Parameter(Mandatory = $true)]
    [string]$LogonIdHex
)

$LogonIdHex = $LogonIdHex -replace '^0x', ''
$LogonIdDec = [Convert]::ToUInt64($LogonIdHex, 16).ToString()

$LogonSession = Get-CimInstance Win32_LogonSession -Filter "LogonId = '$LogonIdDec'"

$SessionId = Get-CimAssociatedInstance `
    -InputObject $LogonSession `
    -Association Win32_SessionProcess `
    -ResultClassName Win32_Process |
    Where-Object { $_.SessionId -gt 0 } |
    Select-Object -ExpandProperty SessionId -Unique |
    Select-Object -First 1

logoff $SessionId
