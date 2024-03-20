@echo off
cd /d "%~dp0"

@REM RESTORE:
icacls C:\Windows\System32\ /restore bk_test_not_original\system32_default_permissions_backup.txt /c


@REM BACKUP:
@REM icacls "C:\Windows\System32\*" /save bk_test_not_original\system32_default_permissions_backup.txt /t

pause