#!/bin/bash

ping -c 1 10.0.1.16
if [[ $? -ne 0 ]]; then
  echo "Ping failed"
  exit 1
fi

osascript <<EOD
tell application "Finder"
  if not (disk "Backup" exists) then
    mount volume "smb://backup@10.0.1.16/Backup"
  end if
end tell
EOD

