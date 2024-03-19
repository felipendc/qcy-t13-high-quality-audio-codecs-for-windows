@echo off
cd /d "%~dp0"



setlocal EnableDelayedExpansion


for /f "tokens=*" %%a in (grant_permission_to_files.txt) do (
    dir C:\Windows\System32\ /s /b | findstr "%%a" >> path_of_files_to_be_deleted.txt
    echo dir C:\Windows\System32\ /s /b | findstr "%%a" 
)

pause