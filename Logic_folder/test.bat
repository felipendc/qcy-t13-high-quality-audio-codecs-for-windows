@echo off
cd /d "%~dp0"


for /f "tokens=*" %%i in (grant_permission_to_files.txt) do (
  move "NEW_CODECS_EXTRACTED_FROM_22635.2915\%%i" "C:\Windows\System32\%%i"
)

pause