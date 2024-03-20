@echo off
cd /d "%~dp0"

@REM cd C:\Users\Felipe Ndc\OneDrive\17_CODE_TESTS\new && cmd.exe /k install_codecs.bat > output.txt 2>&1


@REM Grant permission and take ownership of some folders:
takeown /f "C:\Windows\System32" /r /d y
icacls "C:\Windows\System32" /grant "%USERNAME%":"(OI)(CI)F"



@REM Grant permission and take ownership of codec related folders:
takeown /f "C:\Windows\System32\migwiz" /r /d y
icacls C:\Windows\System32\migwiz /grant "%USERNAME%":"(OI)(CI)F"
takeown /f "C:\Windows\System32\migwiz\replacementmanifests" /r /d y
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



@REM Rename some files to aaa* to be able to remove them later on:
for /f "tokens=*" %%i in (files\codecs_to_be_installed.txt) do (
    setlocal EnableDelayedExpansion
    set /a counter1=0
    IF EXIST "C:\Windows\System32\%%i" (
        set /a counter1+=1
        ren "C:\Windows\System32\%%i" "aaa_!counter1!"
    )
)


for /f "tokens=*" %%i in (files\codecs_to_be_removed.txt) do (
    setlocal EnableDelayedExpansion
    set /a counter2=0
    IF EXIST "C:\Windows\System32\%%i" (
        set /a counter2+=1
        ren "C:\Windows\System32\%%i" "aaaa_!counter2!"        
    )
)



@REM @REM MOVE FILES TO SYSTEM32:
move "best_audio_codecs_for_windows_11\*" "C:\Windows\System32\"
move "best_audio_codecs_for_windows_11\migwiz\replacementmanifests\*" "C:\Windows\System32\migwiz\replacementmanifests\"

pause