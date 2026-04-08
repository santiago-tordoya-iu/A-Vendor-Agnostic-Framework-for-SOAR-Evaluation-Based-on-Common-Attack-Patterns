$raw = [Console]::In.ReadLine()
if ([string]::IsNullOrWhiteSpace($raw)) { exit 2 }

$msg = $raw | ConvertFrom-Json
$args = @($msg.parameters.extra_args)
if (-not $args) { $args = @($msg.parameters.arguments) }
if ($args.Count -lt 1) { exit 3 }

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

$script = $allowed[$args[0]]
if (-not $script) { exit 4 }

& (Join-Path $PSScriptRoot $script) @($args | Select-Object -Skip 1)
exit $LASTEXITCODE
