$ErrorActionPreference = 'Stop'
$keyPath = Join-Path $env:USERPROFILE '.ssh/jarvis_ovh_ed25519'
if (-not (Test-Path -LiteralPath $keyPath)) {
    throw "SSH key not found: $keyPath"
}

$listener = Get-NetTCPConnection -LocalPort 3100 -State Listen -ErrorAction SilentlyContinue
if (-not $listener) {
    $sshPath = (Get-Command ssh.exe -ErrorAction Stop).Source
    $process = Start-Process -FilePath $sshPath -WindowStyle Hidden -PassThru -ArgumentList @(
        '-i', ('"' + $keyPath + '"'),
        '-o', 'BatchMode=yes',
        '-o', 'IdentitiesOnly=yes',
        '-o', 'ExitOnForwardFailure=yes',
        '-o', 'ServerAliveInterval=30',
        '-o', 'ServerAliveCountMax=3',
        '-N', '-L', '127.0.0.1:3100:127.0.0.1:3100',
        'ubuntu@148.113.179.130'
    )
    Write-Host "Started SSH tunnel (process $($process.Id))."
}

for ($attempt = 0; $attempt -lt 15; $attempt++) {
    try {
        $health = Invoke-RestMethod -Uri 'http://localhost:3100/api/health' -TimeoutSec 3
        if ($health.status -eq 'ok') {
            Write-Host 'Paperclip is ready at http://localhost:3100'
            return
        }
    } catch {
        Start-Sleep -Seconds 1
    }
}
throw 'Paperclip is unreachable. Check SSH connectivity and whether port 3100 is occupied.'
