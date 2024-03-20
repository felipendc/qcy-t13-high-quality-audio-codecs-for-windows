@echo off

cd /d "%~dp0"
for /f "tokens=*" %%i in (grant_permission_to_folders.txt) do (
  takeown /f "C:\Windows\System32\%%i" /r /d y
)

pause