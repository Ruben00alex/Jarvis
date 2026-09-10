$ErrorActionPreference = 'Stop'
$listeners = Get-NetTCPConnection -LocalPort 3100 -State Listen -ErrorAction SilentlyContinue
if (-not $listeners) {
    Write-Host 'No tunnel is listening on port 3100.'
    return
}

foreach ($ownerId in ($listeners.OwningProcess | Sort-Object -Unique)) {
    $process = Get-CimInstance Win32_Process -Filter "ProcessId = $ownerId"
    if ($process.Name -ne 'ssh.exe' -or
        $process.CommandLine -notmatch '(?:^|\s)ubuntu@148\.113\.179\.130(?:\s|$)' -or
        $process.CommandLine -notmatch '(?:^|\s)127\.0\.0\.1:3100:127\.0\.0\.1:3100(?:\s|$)') {
        throw "Port 3100 belongs to another process ($ownerId). It was not stopped."
    }
    Stop-Process -Id $ownerId -ErrorAction Stop
    Write-Host "Stopped the Paperclip SSH tunnel (process $ownerId)."
}
Write-Host 'Paperclip continues running on the VPS.'
