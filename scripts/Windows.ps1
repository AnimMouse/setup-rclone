aria2c -x 16 "https://downloads.rclone.org/rclone-current-windows-amd64.zip"
7z e rclone-current-windows-amd64.zip rclone.exe -oRclone -r
Remove-Item rclone-current-windows-amd64.zip