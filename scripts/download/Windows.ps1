$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
Set-StrictMode -Version Latest
Write-Host ::group::Downloading Rclone $env:version for Windows $env:RUNNER_ARCH
$arch = if ($env:RUNNER_ARCH -eq "ARM64") { "arm64" } else { "amd64" }
Invoke-WebRequest $env:GITHUB_SERVER_URL/rclone/rclone/releases/download/$env:version/rclone-$env:version-windows-$arch.zip -OutFile rclone-$env:version-windows-$arch.zip
Expand-Archive rclone-$env:version-windows-$arch.zip Rclone
Move-Item Rclone\rclone-$env:version-windows-$arch\* Rclone
Remove-Item rclone-$env:version-windows-$arch.zip, Rclone\rclone-$env:version-windows-$arch
Write-Host ::endgroup::