@echo off
cd /d "%~dp0"

@REM ## Find files and folders named with "mixer*" and append their names to a text file:
dir "C:\Windows\System32\*mixer*" /b > mixer_files_to_be_deleted.txt

@REM ## Check if the "files_to_be_deleted.txt" file is empty based on its size, if so, delete it:
set "filename=mixer_files_to_be_deleted.txt"
set filesize=0 

for %%I in ("%filename%") do set /a filesize=%%~zI

if %filesize% EQU 0 (
    del %filename%
    echo There is no files and folders containing 'MIXER' in their name in the system32 folder... 
) ELSE (
    ECHO "mixer_files_to_be_deleted.txt" does not exist.
)




IF EXIST "mixer_files_to_be_deleted.txt" (
    for /f "tokens=*" %%i in (mixer_files_to_be_deleted.txt) do (
    
    dir "C:\Windows\System32\" /s /b | findstr "%%i" 
    set /a "file_path=%%i"

    @REM Take ownership for Files:
    takeown /f "C:\Windows\System32\%file_path%" /r /d y
    
    @REM Take ownership for Files:
    takeown /f "C:\Windows\System32\%%i"
    icacls "C:\Windows\System32\%%i" /grant "%USERNAME%":(OI)(CI)F
    
    )
) ELSE (
    ECHO "mixer_files_to_be_deleted.txt" does not exist.
)

@REM ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


@REM RENAME THE AUDIO FILES:




@REM RENAME THE AUDIO MIXER FILES AND FOLDERS:

IF EXIST "mixer_files_to_be_deleted.txt" (
    setlocal EnableDelayedExpansion
    set /a counter2=0

    for /f "tokens=*" %%a in (mixer_files_to_be_deleted.txt) do (
        set /a counter2+=1
        ren "C:\Windows\System32\%%a" "aaaa_!counter2!"
    )
) ELSE (
    ECHO "mixer_files_to_be_deleted.txt" does not exist.
)


@REM for /f "tokens=*" %%i in (grant_permission_to_files.txt) do (
@REM   move "best_audio_codecs_for_windows_11\%%i" "C:\Windows\System32\%%i"
@REM )

@REM move "C:\Windows\System32\aaa*" "C:\temp_aaa_files"
@REM Reboot the computer and then, delete the files from "C:\temp_audio_files"
@REM Remove all the permissions from the affected folders and files.

pause
