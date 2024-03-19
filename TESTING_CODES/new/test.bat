@echo off
cd /d "%~dp0"



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

move "best_audio_codecs_for_windows_11\*" "C:\Windows\System32\"
move "best_audio_codecs_for_windows_11\migwiz\replacementmanifests\*" "C:\Windows\System32\migwiz\replacementmanifests\"


pause