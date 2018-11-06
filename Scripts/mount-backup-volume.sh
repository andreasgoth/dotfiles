#!/bin/bash
osascript <<EOD
tell application "Finder"
	if not (disk "Backup" exists) then
		mount volume "smb://backup@10.0.1.16/Backup"
	end if
end tell
EOD
