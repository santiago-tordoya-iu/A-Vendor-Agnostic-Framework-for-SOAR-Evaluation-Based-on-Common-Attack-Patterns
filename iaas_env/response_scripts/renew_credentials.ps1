param(
    [Parameter(Mandatory = $true)]
    [string]$UserName,

    [Parameter(Mandatory = $true)]
    [string]$Password,

    [Parameter(Mandatory = $true)]
    [string[]]$Groups
)

Import-Module ActiveDirectory

if ($Groups.Count -eq 1 -and $Groups[0] -match ",") {
    $Groups = $Groups[0] -split "\s*,\s*"
}

$SecurePassword = ConvertTo-SecureString $Password -AsPlainText -Force

New-ADUser `
    -Name $UserName `
    -SamAccountName $UserName `
    -AccountPassword $SecurePassword `
    -Enabled $true

Add-ADPrincipalGroupMembership `
    -Identity $UserName `
    -MemberOf $Groups
