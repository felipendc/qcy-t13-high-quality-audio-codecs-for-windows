@echo off
cd /d "%~dp0"


IF EXIST "extracted_files" (
  move "extracted_files" "extracted_files_BACKUP!"
  mkdir extracted_files
) ELSE (
  mkdir extracted_files
)

for /f "tokens=*" %%i in (codec_and_decode_files.txt) do (
  Xcopy "C:\Windows\System32\%%i" "extracted_files" /f /s
)

mkdir extracted_files\migwiz\replacementmanifests
move "extracted_files\msmpeg2vdec-migration-replacement.man" "extracted_files\migwiz\replacementmanifests"
pause