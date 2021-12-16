#!/bin/sh
echo ::group::Downloading latest Rclone for macOS
aria2c -x 16 "https://downloads.rclone.org/rclone-current-osx-amd64.zip"
7z e rclone-current-osx-amd64.zip rclone -oRclone -r
rm rclone-current-osx-amd64.zip
echo ::endgroup::