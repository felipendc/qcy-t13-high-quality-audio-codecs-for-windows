@echo off

setlocal EnableDelayedExpansion
set /a counter1=0

for /f "tokens=*" %%a in (grant_permission_to_files.txt) do (
    set /a counter1+=1
    echo "C:\Windows\System32\%%a" "aaa_!counter1!"
    @REM ren "C:\Windows\System32\%%a" "aaa_!counter1!"
)


@REM ///////////////////

IF EXIST "files_to_be_deleted.txt" (
    setlocal EnableDelayedExpansion
    set /a counter2=0

    for /f "tokens=*" %%a in (files_to_be_deleted.txt) do (
        set /a counter2+=1
        echo "C:\Windows\System32\%%a" "aaaa_!counter2!"
        @REM ren "C:\Windows\System32\%%a" "aaaa_!counter2!"
    )
) ELSE (
    ECHO "files_to_be_deleted.txt" does not exist.
)

pause
