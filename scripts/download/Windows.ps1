$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest
Write-Host ::group::Downloading Rclone $env:version for Windows
aria2c -x 16 $env:GITHUB_SERVER_URL/rclone/rclone/releases/download/$env:version/rclone-$env:version-windows-amd64.zip
7z e rclone-$env:version-windows-amd64.zip rclone.exe -oRclone -r
Remove-Item rclone-$env:version-windows-amd64.zip
Write-Host ::endgroup::