$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest
if ($env:version -eq 'latest') {
  $latest_version = (gh api repos/rclone/rclone/releases/latest -q .tag_name)
  Add-Content $env:GITHUB_OUTPUT version=$latest_version
}
else {
  Add-Content $env:GITHUB_OUTPUT version=$env:version
}