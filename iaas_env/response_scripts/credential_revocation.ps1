param(
    [Parameter(Mandatory = $true)]
    [string]$UserName
)

Import-Module ActiveDirectory

Remove-ADUser -Identity $UserName -Confirm:$false
