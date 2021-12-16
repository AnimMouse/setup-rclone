#!/bin/sh
echo ::group::Downloading latest Rclone for Linux
aria2c -x 16 "https://downloads.rclone.org/rclone-current-linux-amd64.zip"
7z e rclone-current-linux-amd64.zip rclone -oRclone -r
rm rclone-current-linux-amd64.zip
echo ::endgroup::