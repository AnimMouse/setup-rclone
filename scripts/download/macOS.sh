#!/bin/sh
set -eu
version=$(gh api repos/rclone/rclone/releases/latest -q .tag_name)
echo ::group::Downloading Rclone $version for macOS
aria2c -x 16 $GITHUB_SERVER_URL/rclone/rclone/releases/download/$version/rclone-$version-osx-amd64.zip
7z e rclone-$version-osx-amd64.zip rclone -oRclone -r
rm rclone-$version-osx-amd64.zip
echo ::endgroup::