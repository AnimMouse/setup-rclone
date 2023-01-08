#!/bin/sh
set -eu
if [ $RUNNER_OS = macOS ]; then os=osx; else os=linux; fi
echo ::group::Downloading Rclone $version for $os
aria2c -x 16 $GITHUB_SERVER_URL/rclone/rclone/releases/download/$version/rclone-$version-$os-amd64.zip
7z e rclone-$version-$os-amd64.zip rclone -oRclone -r
rm rclone-$version-$os-amd64.zip
echo ::endgroup::