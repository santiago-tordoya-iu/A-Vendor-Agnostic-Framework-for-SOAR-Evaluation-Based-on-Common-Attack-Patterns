[CmdletBinding(DefaultParameterSetName = 'Path')]
param(
    [Parameter(Mandatory = $true, ParameterSetName = 'Path')]
    [string]$TargetPath,

    [Parameter(Mandatory = $true, ParameterSetName = 'UserClsid')]
    [string]$UserName,

    [Parameter(Mandatory = $true, ParameterSetName = 'UserClsid')]
    [string]$Clsid
)

if ($PSCmdlet.ParameterSetName -eq 'UserClsid') {
    $ShortUserName = $UserName -replace '^.*\\', ''

    if ($Clsid -notmatch '^\{.*\}$') {
        $Clsid = "{${Clsid}}"
    }

    $UserSid = Get-ChildItem 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList' |
        ForEach-Object {
            $Profile = Get-ItemProperty $_.PSPath
            [pscustomobject]@{
                Sid = $_.PSChildName
                ProfileImagePath = $Profile.ProfileImagePath
            }
        } |
        Where-Object {
            $_.ProfileImagePath -match "\\$([regex]::Escape($ShortUserName))(\.[^\\]+)?$"
        } |
        Select-Object -ExpandProperty Sid -First 1

    $KeyPath = "Registry::HKEY_USERS\${UserSid}_Classes\CLSID\$Clsid"

    Remove-Item -LiteralPath $KeyPath -Recurse -Force -ErrorAction Ignore
}

if ($PSCmdlet.ParameterSetName -eq 'Path') {
    if (Test-Path -LiteralPath $TargetPath) {
        $Item = Get-Item -LiteralPath $TargetPath

        if ($Item.PSProvider.Name -eq 'FileSystem' -and $Item.PSIsContainer) {
            Get-ChildItem -LiteralPath $TargetPath -Force | Remove-Item -Recurse -Force -ErrorAction Ignore
        }
        else {
            Remove-Item -LiteralPath $TargetPath -Recurse -Force -ErrorAction Ignore
        }
    }
}
