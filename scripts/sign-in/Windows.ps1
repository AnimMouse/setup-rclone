Write-Host ::group::Signing in to Rclone using Rclone config
New-Item $env:APPDATA\rclone\ -ItemType Directory
$rclone_config = [Convert]::FromBase64String($env:rclone_config)
[IO.File]::WriteAllBytes("$env:APPDATA\rclone\rclone.conf", $rclone_config)
Write-Host ::endgroup::