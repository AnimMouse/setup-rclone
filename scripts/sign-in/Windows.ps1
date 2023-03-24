$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest
Write-Host ::group::Signing in to Rclone using Rclone config
New-Item $env:APPDATA\rclone -ItemType Directory -Force
$rclone_config = [Convert]::FromBase64String($env:rclone_config)
[IO.File]::WriteAllBytes("$env:APPDATA\rclone\rclone.conf", $rclone_config)
Write-Host ::endgroup::