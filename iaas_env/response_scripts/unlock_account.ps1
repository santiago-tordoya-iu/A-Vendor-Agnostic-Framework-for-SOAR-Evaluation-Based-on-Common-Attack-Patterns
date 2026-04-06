param(
    [Parameter(Mandatory = $true)]
    [string]$UserName
)

Import-Module ActiveDirectory

Enable-ADAccount -Identity $UserName
