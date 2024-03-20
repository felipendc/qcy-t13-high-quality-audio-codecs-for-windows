@echo off

cd /d "%~dp0"
for /f "tokens=*" %%i in (grant_permission_to_files.txt) do (
  takeown /f "C:\Windows\System32\%%i.txt"
)

pause