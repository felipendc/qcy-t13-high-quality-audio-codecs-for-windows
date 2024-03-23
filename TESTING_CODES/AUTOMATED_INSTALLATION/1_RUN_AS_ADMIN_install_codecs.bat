:: Author: Felipe Ndc (VicyosLife)
:: Install the best QCY-T13 audio codecs for Windows!

@echo off
cd /d "%~dp0"



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
        @REM takeown "/f" "C:\Windows\System32\%%i"
        icacls C:\Windows\System32\%%i "/grant" "%USERNAME%":"(OI)(CI)F"
    )
)

for /f "tokens=*" %%i in (files\codecs_to_be_removed.txt) do (
    IF EXIST "C:\Windows\System32\%%i" (
        @REM takeown /f "C:\Windows\System32\%%i"
        icacls C:\Windows\System32\%%i /grant "%USERNAME%":"(OI)(CI)F" 
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



@REM MOVE FILES TO SYSTEM32:
move "best_audio_codecs_for_windows_11\*" "C:\Windows\System32\"
move "best_audio_codecs_for_windows_11\migwiz\replacementmanifests\*" "C:\Windows\System32\migwiz\replacementmanifests\"

pause