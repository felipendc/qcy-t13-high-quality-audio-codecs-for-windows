@echo off
cd /d "%~dp0"

@REM cd C:\Users\Felipe Ndc\OneDrive\17_CODE_TESTS\new && cmd.exe /k install_codecs.bat > output.txt 2>&1



@REM Grant permission and take ownership of codec related files:
for /f "tokens=*" %%i in (files\codecs_to_be_installed.txt) do (
    IF EXIST C:\Windows\System32\%%i (
        @REM takeown /f "C:\Windows\System32\%%i"
        
        icacls "C:\Windows\System32\%%i /grant "%USERNAME%"":(OI)(CI)F"
    )
)

pause