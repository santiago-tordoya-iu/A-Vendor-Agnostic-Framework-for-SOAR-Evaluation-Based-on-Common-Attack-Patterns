[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$TargetPath
)

$regExe =
    if ([Environment]::Is64BitOperatingSystem -and -not [Environment]::Is64BitProcess) {
        Join-Path $env:windir 'Sysnative\reg.exe'
    }
    else {
        Join-Path $env:windir 'System32\reg.exe'
    }

Write-Host "Using reg.exe: $regExe"
Write-Host "Deleting registry key: $TargetPath"

if ($TargetPath -match '^(HKU|HKLM|HKCU|HKCR|HKCC)\\') {
    & $regExe query "$TargetPath"
    if ($LASTEXITCODE -ne 0) {
        throw "Registry key not found in this view: $TargetPath"
    }

    & $regExe delete "$TargetPath" /f
    if ($LASTEXITCODE -ne 0) {
        throw "reg delete failed for: $TargetPath (exit $LASTEXITCODE)"
    }

    & $regExe query "$TargetPath" > $null 2>&1
    if ($LASTEXITCODE -eq 0) {
        throw "Registry key still exists after deletion: $TargetPath"
    }

    return
}

if (Test-Path -LiteralPath $TargetPath) {
    $Item = Get-Item -LiteralPath $TargetPath -ErrorAction Stop

    if ($Item.PSProvider.Name -eq 'FileSystem' -and $Item.PSIsContainer) {
        Get-ChildItem -LiteralPath $TargetPath -Force | Remove-Item -Recurse -Force -ErrorAction Stop
    }
    else {
        Remove-Item -LiteralPath $TargetPath -Recurse -Force -ErrorAction Stop
    }

    return
}

throw "TargetPath not found or unsupported: $TargetPath"
