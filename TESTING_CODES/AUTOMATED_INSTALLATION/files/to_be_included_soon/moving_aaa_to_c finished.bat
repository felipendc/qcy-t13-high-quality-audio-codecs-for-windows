:: Author: Felipe Ndc (VicyosLife)
:: Install the best QCY-T13 audio codecs for Windows!

@echo off
cd /d "%~dp0"



@REM Save the root of this directory.
set root_folder=%cd%

@REM Temp folder to house the aaa* files!
set "temp_audio_files=C:\audio_codecs_to_be_removed"




@REM Check if the folder "C:\audio_codecs_to_be_removed" already exists, if it does, rename it with + 1 
@REM If it doesn't exist, then create it in "C\:". 
@REM And move all the aaa* files to it.


setlocal EnableDelayedExpansion
set /a folder_counter=0
 

 
IF NOT EXIST "%temp_audio_files%" (
    mkdir %temp_audio_files%
    echo The folder "%temp_audio_files%" has been created.

    @REM Remove renamed_files_temp.txt to avoid problems.
    if EXIST "files\renamed_files_temp.txt" (del "files\renamed_files_temp.txt")

    @REM Find files and folder containing *aaa* in system32 folder and save their paths to a .txt file.
    cd C:\Windows\System32 && dir /s /b "*aaa_*" /b >> "%root_folder%\files\renamed_files_temp.txt"
    cd %root_folder%
    
    if EXIST "files\renamed_files_temp.txt" (
        for /f "tokens=*" %%i in (files\renamed_files_temp.txt) do (
            move "%%i" "%temp_audio_files%\"
        )
    )
    del "files\renamed_files_temp.txt"
) else (
    if exist "C:\folder_counter_temp.txt" (del "C:\folder_counter_temp.txt")
    
    @REM Find folders "audio_codecs_to_be_removed" in the current "C:\" directory and save them in a .txt file.
    cd C:\ && dir /b "*audio_codecs_to_be_removed*" /b >> "C:\folder_counter_temp.txt"
    cd %root_folder%

    for /f "tokens=*" %%i in (C:\folder_counter_temp.txt) do (
        set /a folder_counter+=1
    )

    mkdir %temp_audio_files%_!folder_counter! 
    echo The "%temp_audio_files%_!folder_counter!" directory has been created.
    if exist "C:\folder_counter_temp.txt" (
        del "C:\folder_counter_temp.txt" && echo File "C:\folder_counter_temp.txt" has been deleted.
    )

    @REM Remove renamed_files_temp.txt to avoid problems.
    if EXIST "files\renamed_files_temp.txt" (del "files\renamed_files_temp.txt")

    @REM Find files and folder containing *aaa* in system32 folder and save their paths to a .txt file.
    cd C:\Windows\System32 && dir /s /b "*aaa_*" /b >> "%root_folder%\files\renamed_files_temp.txt"
    cd %root_folder%
    
    if EXIST "files\renamed_files_temp.txt" (
        for /f "tokens=*" %%i in (files\renamed_files_temp.txt) do (
            move "%%i" "%temp_audio_files%_!folder_counter!\"
        )
    )
    del "files\renamed_files_temp.txt"
)





endlocal
pause
