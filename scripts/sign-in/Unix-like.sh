#!/bin/sh
set -eu
echo ::group::Signing in to Rclone using Rclone config
mkdir -p ~/.config/rclone
if [ "$disable_base64" = true ]
then
  echo "$rclone_config" > ~/.config/rclone/rclone.conf
else
  if [ "$zstd_config" = true ]
  then
    echo "$rclone_config" | base64 -d | zstd -dqo ~/.config/rclone/rclone.conf
  else
    echo "$rclone_config" | base64 -d > ~/.config/rclone/rclone.conf
  fi
fi
echo ::endgroup::