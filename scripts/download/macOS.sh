#!/bin/sh
version=$(curl -s https://api.github.com/repos/rclone/rclone/releases/latest | jq -r '.tag_name')
echo ::group::Downloading Rclone $version for macOS
aria2c -x 16 https://github.com/rclone/rclone/releases/download/$version/rclone-$version-osx-amd64.zip
7z e rclone-$version-osx-amd64.zip rclone -oRclone -r
rm rclone-$version-osx-amd64.zip
echo ::endgroup::