:: ## Find files and folders named with "mixer*" and append their names to a text file:
dir "C:\Windows\System32\*mixer*" /b > files_to_be_deleted.txt

:: ## Check if the "files_to_be_deleted.txt" file is empty based on its size, if so, delete it:

@echo off
set "filename=files_to_be_deleted.txt"
set filesize=0 

for %%I in ("%filename%") do set /a filesize=%%~zI

if %filesize% EQU 0 (
    del %filename%
    echo There is no files and folders containing 'MIXER' in their name in the system32 folder...
   
)


pause