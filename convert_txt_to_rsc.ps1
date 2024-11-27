"/ip firewall address-list" | Out-File ./emerging-Block-IPs.rsc
Get-Content .\emerging-Block-IPs.txt | Where-Object { $_ -notmatch '#' } | ? {$_.trim() -ne "" } | ForEach-Object{ 'add address=' + ($_ -split "\s+")[0] + ' comment="Bot block list" list=BlockList'} | Add-content ./emerging-Block-IPs.rsc
