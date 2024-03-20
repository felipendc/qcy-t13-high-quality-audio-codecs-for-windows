@echo off
cd /d "%~dp0"

@REM cd C:\Users\Felipe Ndc\OneDrive\17_CODE_TESTS\new && cmd.exe /k install_codecs.bat > output.txt 2>&1



@REM @REM Grant permission and take ownership of codec related files:
@REM for /f "tokens=*" %%i in (files\codecs_to_be_installed.txt) do (
@REM     IF EXIST C:\Windows\System32\%%i (
@REM         @REM takeown /f "C:\Windows\System32\%%i"
        
@REM         echo "C:\Windows\System32\%%i /grant "%USERNAME%":"(OI)(CI)F"
@REM     )
@REM )


@REM Grant permission and take ownership of codec related files:
for /f "tokens=*" %%i in (files\teste.txt) do (
    if exist "C:\%%i" (
        icacls C:\%%i /grant "%USERNAME%":"(OI)(CI)F"
    ) else (echo "O arquivo não foi encontrado!")
)

pause