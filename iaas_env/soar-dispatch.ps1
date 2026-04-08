$raw = [Console]::In.ReadLine()
if ([string]::IsNullOrWhiteSpace($raw)) { exit 2 }

$msg = $raw | ConvertFrom-Json
$arguments = @($msg.parameters.extra_args)
if (-not $arguments) { $arguments = @($msg.parameters.arguments) }
if ($arguments.Count -lt 1) { exit 3 }

$allowed = @{
    'host-reboot' = 'host_reboot.ps1'
    'auth-cache-invalidation' = 'auth_cache_invalidation.ps1'
    'credential-revocation' = 'credential_revocation.ps1'
    'file-eviction' = 'file_eviction.ps1'
    'lock-account' = 'lock_account.ps1'
    'unlock-account' = 'unlock_account.ps1'
    'reissue-credential' = 'reissue_credential.ps1'
    'session-termination' = 'session_termination.ps1'
    'process-termination' = 'process_termination.ps1'
}

$script = $allowed[$arguments[0]]
if (-not $script) { exit 4 }

$paramTokens = @($arguments | Select-Object -Skip 1)
$params = @{}

$i = 0
while ($i -lt $paramTokens.Count) {
    $token = [string]$paramTokens[$i]

    if ($token -notmatch '^-') { exit 5 }

    $name = $token.TrimStart('-')
    $i++

    $values = @()
    while ($i -lt $paramTokens.Count -and [string]$paramTokens[$i] -notmatch '^-') {
        $values += [string]$paramTokens[$i]
        $i++
    }

    if ($values.Count -eq 0) {
        $params[$name] = $true
    }
    elseif ($values.Count -eq 1) {
        $params[$name] = $values[0]
    }
    else {
        $params[$name] = [string[]]$values
    }
}

& (Join-Path $PSScriptRoot $script) @params
exit $LASTEXITCODE
