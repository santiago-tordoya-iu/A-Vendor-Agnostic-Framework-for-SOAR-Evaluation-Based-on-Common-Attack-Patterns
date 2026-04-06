param(
    [Parameter(Mandatory = $true)]
    [string]$UserName
)

Import-Module ActiveDirectory

Disable-ADAccount -Identity $UserName
