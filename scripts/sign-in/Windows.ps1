$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest
Write-Host ::group::Signing in to Rclone using Rclone config
New-Item $env:APPDATA\rclone -ItemType Directory -Force
if ($env:disable_base64 -eq 'true') {
  Set-Content $env:APPDATA\rclone\rclone.conf $env:rclone_config
}
else {
  $rclone_config = [Convert]::FromBase64String($env:rclone_config)
  [IO.File]::WriteAllBytes("$env:APPDATA\rclone\rclone.conf", $rclone_config)
}
Write-Host ::endgroup::