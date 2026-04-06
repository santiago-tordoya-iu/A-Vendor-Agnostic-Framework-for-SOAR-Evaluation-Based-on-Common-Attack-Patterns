klist sessions |
    Select-String '0x[0-9a-fA-F]+' |
    ForEach-Object { $_.Matches.Value } |
    ForEach-Object { klist purge -li $_ }
