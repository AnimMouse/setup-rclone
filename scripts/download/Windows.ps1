$ErrorActionPreference = 'Stop'
$version = (Invoke-RestMethod https://api.github.com/repos/rclone/rclone/releases/latest).tag_name
Write-Host ::group::Downloading Rclone $version for Windows
aria2c -x 16 https://github.com/rclone/rclone/releases/download/$version/rclone-$version-windows-amd64.zip
7z e rclone-$version-windows-amd64.zip rclone.exe -oRclone -r
Remove-Item rclone-$version-windows-amd64.zip
Write-Host ::endgroup::