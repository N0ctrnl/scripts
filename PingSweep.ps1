WorkFlow PingSweep {
  $ips = @()
  For($i = 1; $i -le 254; $i++){$ips += "192.168.1.$i"}
  ForEach -Parallel($ip in $ips){
    If(Test-Connection -ComputerName $ip -count 1 -Quiet){
      Write-Output -InputObject "$ip,ONLINE"
    }Else{
      Write-Output -InputObject "$ip,OFFLINE"
    }
  }
}

PingSweep | ForEach-Object {
  $ip = $_.Split(',')[0]
  $status = $_.Split(',')[1]
  If($status -eq 'ONLINE'){
    Write-Host "$ip" -ForegroundColor Green
  }Else{
    Write-Host "$ip" -ForegroundColor Red
  }
}
