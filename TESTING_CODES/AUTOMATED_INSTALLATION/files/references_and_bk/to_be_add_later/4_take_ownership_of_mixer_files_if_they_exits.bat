@echo off

IF EXIST "files_to_be_deleted.txt" (
    for /f "tokens=*" %%i in (files_to_be_deleted.txt) do (
    :: Take ownership for Files:
    echo 'takeown /f "C:\Windows\System32\%%i" /r /d y'
    :: Take ownership for Files:
    echo 'takeown /f "C:\Windows\System32\%%i"'
    echo ""
    )
) ELSE (
    ECHO "files_to_be_deleted.txt" does not exist.
)
pause