#!/bin/sh
set -eu
version=$(curl -s https://api.github.com/repos/rclone/rclone/releases/latest | jq -r .tag_name)
echo ::group::Downloading Rclone $version for Linux
aria2c -x 16 https://github.com/rclone/rclone/releases/download/$version/rclone-$version-linux-amd64.zip
7z e rclone-$version-linux-amd64.zip rclone -oRclone -r
rm rclone-$version-linux-amd64.zip
echo ::endgroup::