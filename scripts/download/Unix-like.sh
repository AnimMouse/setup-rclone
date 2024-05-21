#!/bin/sh
set -eu
echo ::group::Downloading Rclone $version for $RUNNER_OS $RUNNER_ARCH
if [ $RUNNER_OS = macOS ]; then os=osx; else os=linux; fi
if [ $RUNNER_ARCH = ARM64 ]; then arch=arm64; else arch=amd64; fi
wget -q $GITHUB_SERVER_URL/rclone/rclone/releases/download/$version/rclone-$version-$os-$arch.zip
unzip -jq rclone-$version-$os-$arch.zip */rclone -d Rclone
rm rclone-$version-$os-$arch.zip
echo ::endgroup::