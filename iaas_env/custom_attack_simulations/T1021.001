$Password = # Change me

Import-Module ActiveDirectory -ErrorAction SilentlyContinue

$Server = (Get-ADDomainController -Discover).HostName
$User = Join-Path $Env:USERDOMAIN $ENV:USERNAME

cmdkey /generic:TERMSRV/$Server /user:$User /pass:$Password

mstsc /v:$Server
