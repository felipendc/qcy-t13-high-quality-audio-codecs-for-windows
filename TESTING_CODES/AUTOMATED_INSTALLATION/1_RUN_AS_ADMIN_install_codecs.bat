:: Author: Felipe Ndc (VicyosLife)
:: Install the best QCY-T13 audio codecs for Windows!

@echo off
cd /d "%~dp0"

@REM Save the root of this directory.
set root_folder=%cd%

@REM Temp folder to house the aaa* files!
set "temp_audio_files=C:\audio_codecs_to_be_removed"



@REM Find files and folder containing *mixer* in their names and save its paths to a .txt file.
cd C:\Windows\System32 && dir /s /b "*mixer*" /b >> "%root_folder%\files\mixer_files_and_folders_directories.txt"
cd %root_folder%




@REM Grant permission and take ownership of some folders:
takeown /f "C:\Windows\System32"
icacls "C:\Windows\System32" /grant "%USERNAME%":"(OI)(CI)F"
@REM icacls "C:\Windows\System32" /grant "%USERNAME%":F



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



@REM Rename some files to aaa* to be able to remove them later on:
@REM Ending local "DelayedExpansion" first to prevent any errors:

endlocal
setlocal EnableDelayedExpansion
set /a counter1=0

for /f "tokens=*" %%i in (files\codecs_to_be_installed.txt) do (
    IF EXIST "C:\Windows\System32\%%i" (
        set /a counter1+=1
        ren "C:\Windows\System32\%%i" "aaa_!counter1!"
    )
)
endlocal

setlocal EnableDelayedExpansion
set /a counter2=0

for /f "tokens=*" %%a in (files\codecs_to_be_removed.txt) do (
    IF EXIST "C:\Windows\System32\%%a" (
        set /a counter2+=1
        ren "C:\Windows\System32\%%a" "aaaa_!counter2!"        
    )
)
endlocal

if EXIST "files\mixer_files_and_folders_directories.txt" (

    setlocal EnableDelayedExpansion
    set /a mixer_counter=0

    for /f "tokens=*" %%i in (files\mixer_files_and_folders_directories.txt) do (
        IF EXIST "%%i" (
            set /a mixer_counter+=1
            ren "%%i" "aaaaa_mixer_!mixer_counter!" 

        )
    )
    endlocal
    del "files\mixer_files_and_folders_directories.txt"
)


@REM MOVE FILES TO SYSTEM32:
move "best_audio_codecs_for_windows_11\*" "C:\Windows\System32\"
move "best_audio_codecs_for_windows_11\migwiz\replacementmanifests\*" "C:\Windows\System32\migwiz\replacementmanifests\"



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