#!/bin/sh
set -eu
version=$(curl -s $GITHUB_API_URL/repos/rclone/rclone/releases/latest | jq -r .tag_name)
echo ::group::Downloading Rclone $version for Linux
aria2c -x 16 $GITHUB_SERVER_URL/rclone/rclone/releases/download/$version/rclone-$version-linux-amd64.zip
7z e rclone-$version-linux-amd64.zip rclone -oRclone -r
rm rclone-$version-linux-amd64.zip
echo ::endgroup::