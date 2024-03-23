@echo off
cd /d "%~dp0"

@REM RESTORE:
icacls C:\Windows\System32\ /restore files\restore_permission_NOT_THE_DEFAULT_ONE\system32_default_permissions_backup.txt /c


@REM BACKUP:
@REM icacls "C:\Windows\System32\*" /save files\restore_permission_NOT_THE_DEFAULT_ONE\system32_default_permissions_backup.txt /t

pause