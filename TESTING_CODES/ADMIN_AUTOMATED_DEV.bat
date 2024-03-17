@echo off
cd /d "%~dp0"



@REM ## Find files and folders named with "mixer*" and append their names to a text file:
dir "C:\Windows\System32\*mixer*" /b > files_to_be_deleted.txt

icacls "C:\aass" /grant *S-1-1-0:(d,wdac)

@REM ## Check if the "files_to_be_deleted.txt" file is empty based on its size, if so, delete it:

set "filename=files_to_be_deleted.txt"
set filesize=0 

for %%I in ("%filename%") do set /a filesize=%%~zI

if %filesize% EQU 0 (
    del %filename%
    echo There is no files and folders containing 'MIXER' in their name in the system32 folder... 
)

@REM ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
@REM ## Take ownership of some folders:


@REM takeown /f "C:\Windows\System32" /r /d y

for /f "tokens=*" %%i in (grant_permission_to_folders.txt) do (
  takeown /f "C:\Windows\System32\%%i" /r /d y
  icacls C:\Windows\System32\%%i /grant"*S-1-1-0:(F)"
)

for /f "tokens=*" %%i in (grant_permission_to_files.txt) do (
  takeown /f "C:\Windows\System32\%%i"
  icacls C:\Windows\System32\%%i /grant "*S-1-1-0:(F)"
  
)

IF EXIST "files_to_be_deleted.txt" (
    for /f "tokens=*" %%i in (files_to_be_deleted.txt) do (
    @REM Take ownership for Files:
    takeown /f "C:\Windows\System32\%%i" /r /d y
    
    @REM Take ownership for Files:
    takeown /f "C:\Windows\System32\%%i"
    icacls C:\Windows\System32\%%i /grant "*S-1-1-0:(F)"
    
    )
) ELSE (
    ECHO "files_to_be_deleted.txt" does not exist.
)

@REM ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

@REM RENAME THE AUDIO FILES:

setlocal EnableDelayedExpansion
set /a counter1=0

for /f "tokens=*" %%a in (grant_permission_to_files.txt) do (
    set /a counter1+=1
    ren "C:\Windows\System32\%%a" "aaa_!counter1!"
)



@REM RENAME THE AUDIO MIXER FILES AND FOLDERS:

IF EXIST "files_to_be_deleted.txt" (
    setlocal EnableDelayedExpansion
    set /a counter2=0

    for /f "tokens=*" %%a in (files_to_be_deleted.txt) do (
        set /a counter2+=1
        ren "C:\Windows\System32\%%a" "aaaa_!counter2!"
    )
) ELSE (
    ECHO "files_to_be_deleted.txt" does not exist.
)



@REM MOVE FILES TO SYSTEM32:

for /f "tokens=*" %%i in (grant_permission_to_files.txt) do (
  move "NEW_CODECS_EXTRACTED_FROM_22635.2915\%%i" "C:\Windows\System32\%%i"
)

@REM "NEW_CODECS_EXTRACTED_FROM_22635.2915\*" "C:\Windows\System32"

@REM move "C:\Windows\System32\aaa*" "C:\temp_aaa_files"
@REM Reboot the computer and then, delete the files from "C:\temp_audio_files"
@REM Remove all the permissions from the affected folders and files.

pause
