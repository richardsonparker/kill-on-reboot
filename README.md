# kill-on-reboot

# Kill-on-Reboot Tool

A lightweight Windows batch script that schedules any file to be deleted at the next system boot using the `PendingFileRenameOperations` registry key.

## How It Works

This script adds a special entry to:
HKLM\SYSTEM\CurrentControlSet\Control\Session Manager

It uses a raw NT path format (`\??\`) to instruct Windows to delete a file **before any services, OneDrive, or antivirus tools lock it**.

## ⚠️ Warning
- This script **requires Administrator privileges**
- Be careful — files are deleted permanently after reboot

## ✅ Usage
Run from **an elevated CMD prompt**:
```cmd
kill-on-reboot.bat "C:\Path\To\LockedOrStuckFile.ext"

You’ll see confirmation if the registry edit was successful. 
The target file might still be visable - yet fully empty and deletable.

Example Use Cases
-Removing files stuck in OneDrive or locked by Explorer
-Cleaning up after malware sandbox runs
-Killing zombie artifacts from failed installers


Tested On
-Windows 10 Pro / Enterprise
-Windows 11 Pro
-FLARE-VM and forensic sandboxes
