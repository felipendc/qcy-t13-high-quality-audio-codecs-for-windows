:: Author: Felipe Ndc (VicyosLife)
:: Install the best QCY-T13 audio codecs for Windows: TESTING SCRIPT

@echo off
@REM Get the root of the directory where this file ".bat" is placed and set it as the root folder of this script.
cd /d "%~dp0"

@REM Save the root of this directory.
set root_folder=%cd%

@REM Find files and folder containing *mixer* in their names and save it to a .txt file.
cd C:\Windows\System32 && dir /s /b "*mixer*" /b >> "%root_folder%\mixer_files_and_folders_directories.txt"
cd %root_folder%

pause


