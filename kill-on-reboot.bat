@echo off
:: kill-on-reboot.bat
:: Schedules a file for deletion at next boot via PendingFileRenameOperations

if "%~1"=="" (
    echo Usage: %~nx0 "C:\Path\To\File.ext"
    exit /b 1
)

:: Add the registry entry for boot-time deletion
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" ^
 /v PendingFileRenameOperations ^
 /t REG_MULTI_SZ ^
 /d "\??\%~1" /f

if %errorlevel%==0 (
    echo [%~1] scheduled for deletion on next boot.
) else (
    echo Failed to add deletion entry. Are you running as Administrator?
)
pause
