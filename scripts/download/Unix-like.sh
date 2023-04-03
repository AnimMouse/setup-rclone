#!/bin/sh
set -eu
echo ::group::Downloading Rclone $version for $RUNNER_OS
if [ $RUNNER_OS = macOS ]; then os=osx; else os=linux; fi
wget -q $GITHUB_SERVER_URL/rclone/rclone/releases/download/$version/rclone-$version-$os-amd64.zip
unzip -jq rclone-$version-$os-amd64.zip */rclone -d Rclone
rm rclone-$version-$os-amd64.zip
echo ::endgroup::