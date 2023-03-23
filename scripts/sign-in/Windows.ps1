$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest
Write-Host ::group::Signing in to Rclone using Rclone config
# This should use -Force, because gh runner might not be disposable instance (i.e. self-hosted)
# Relates to https://github.com/AnimMouse/tool-cache/issues/3
New-Item $env:APPDATA\rclone -ItemType Directory -Force
$rclone_config = [Convert]::FromBase64String($env:rclone_config)
[IO.File]::WriteAllBytes("$env:APPDATA\rclone\rclone.conf", $rclone_config)
Write-Host ::endgroup::
