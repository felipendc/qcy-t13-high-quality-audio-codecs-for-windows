:: Author: Felipe Ndc (VicyosLife)

@echo off
cd /d "%~dp0"

@REM Save the root of this directory.
set root_folder=%cd%


if EXIST "files\mixer_files_and_folders_directories.txt" (
    del "files\mixer_files_and_folders_directories.txt"
    echo "Deleting files\mixer_files_and_folders_directories.txt to avoid duplicate codes"
)


    
@REM Find files and folder containing *mixer* in their names and save its paths to a .txt file.
cd C:\Windows\System32 && dir /s /b "*mixer*" /b >> "%root_folder%\files\mixer_files_and_folders_directories.txt"
cd %root_folder%



///////////////////////////////////////////
@REM Grant permission and take ownership of some folders:
takeown /f "C:\Windows\System32"
icacls "C:\Windows\System32" /grant "%USERNAME%":"(OI)(CI)F"
@REM icacls "C:\Windows\System32" /grant "%USERNAME%":F
///////////////////////////////////////////////


@REM Grant permission and take ownership of codec related folders:
takeown /f "C:\Windows\System32\migwiz"
icacls C:\Windows\System32\migwiz /grant "%USERNAME%":"(OI)(CI)F"
takeown /f "C:\Windows\System32\migwiz\replacementmanifests"
icacls C:\Windows\System32\migwiz\replacementmanifests /grant "%USERNAME%":"(OI)(CI)F"



@REM Grant permission and take ownership of codec related files:
for /f "tokens=*" %%i in (files\codecs_to_be_installed.txt) do (
    IF EXIST "C:\Windows\System32\%%i" (
        takeown "/f" "C:\Windows\System32\%%i"
        icacls C:\Windows\System32\%%i "/grant" "%USERNAME%":"(OI)(CI)F"
    )
)

for /f "tokens=*" %%i in (files\codecs_to_be_removed.txt) do (
    IF EXIST "C:\Windows\System32\%%i" (
        takeown /f "C:\Windows\System32\%%i"
        icacls C:\Windows\System32\%%i /grant "%USERNAME%":"(OI)(CI)F" 
    )
)

if EXIST "files\mixer_files_and_folders_directories.txt" (

    for /f "tokens=*" %%i in (files\mixer_files_and_folders_directories.txt) do (
        IF EXIST "%%i" (
            takeown /f "%%i"
            icacls %%i /grant "%USERNAME%":"(OI)(CI)F" 
        )
    )
)


pause