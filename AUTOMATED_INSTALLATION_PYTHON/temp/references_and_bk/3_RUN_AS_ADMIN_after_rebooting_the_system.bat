:: Author: Felipe Ndc (VicyosLife)
:: Deleting temp files after rebooting the computer!

@echo off
cd /d "%~dp0"

set "folder=C:\list_of_folders_to_be_deleted.txt"

@REM Deleting the "audio_codecs_to_be_removed" folders in "C:\".
if EXIST "C:\list_of_folders_to_be_deleted.txt" (del "C:\list_of_folders_to_be_deleted.txt")

cd C:\ && dir /b "*audio_codecs_to_be_removed*" /b >> "C:\list_of_folders_to_be_deleted.txt"

if EXIST "C:\list_of_folders_to_be_deleted.txt" (

    @REM Checking if the file "list_of_folders_to_be_deleted.txt" is empty by checking its size.
    @REM If it's empty, delete it!
    for %%A in ("%folder%") do set size=%%~zA

    if "%size%"=="" (
        del "C:\list_of_folders_to_be_deleted.txt"
        echo No "audio_codecs_to_be_removed" folder has been found!
    ) else (
        for /f "tokens=*" %%i in (C:\list_of_folders_to_be_deleted.txt) do (
            rmdir /S /Q C:\%%i
        )
        echo "audio_codecs_to_be_removed" folder or folders has been deleted successfully!

    )
) 



pause
