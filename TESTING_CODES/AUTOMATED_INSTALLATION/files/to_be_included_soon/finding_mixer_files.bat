:: Author: Felipe Ndc (VicyosLife)
:: Install the best QCY-T13 audio codecs for Windows!

@echo off
@REM Get the root of the directory where this file ".bat" is placed and set it as the root folder of this script.
cd /d "%~dp0"

@REM Save the root of this directory.
set root_folder=%cd%

@REM Find files and folder containing *mixer* in their names.
cd C:\Windows\System32 && dir /s /b "*mixer*"
cd %root_folder%


pause
