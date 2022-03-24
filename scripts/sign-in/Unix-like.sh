#!/bin/sh
set -eu
echo ::group::Signing in to Rclone using Rclone config
mkdir ~/.config/rclone/
echo $rclone_config | base64 -d > ~/.config/rclone/rclone.conf
echo ::endgroup::