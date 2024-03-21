@echo off
cd /d "%~dp0"

@REM cd C:\Users\Felipe Ndc\OneDrive\17_CODE_TESTS\new && cmd.exe /k install_codecs.bat > output.txt 2>&1


@REM @REM Grant permission and take ownership of some folders:
@REM takeown /f "C:\Windows\System32" /d y
@REM icacls "C:\Windows\System32" /grant "%USERNAME%":"(OI)(CI)F"



@REM @REM Grant permission and take ownership of codec related folders:
@REM takeown /f "C:\Windows\System32\migwiz" /d y
@REM icacls C:\Windows\System32\migwiz /grant "%USERNAME%":"(OI)(CI)F"
@REM takeown /f "C:\Windows\System32\migwiz\replacementmanifests" /d y
@REM icacls C:\Windows\System32\migwiz\replacementmanifests /grant "%USERNAME%":"(OI)(CI)F"



@REM @REM Grant permission and take ownership of codec related files:
@REM for /f "tokens=*" %%i in (files\codecs_to_be_installed.txt) do (
@REM     IF EXIST "C:\Windows\System32\%%i" (
@REM         takeown "/f" "C:\Windows\System32\%%i"
@REM         icacls C:\Windows\System32\%%i "/grant" "%USERNAME%":"(OI)(CI)F"
@REM     )
@REM )

@REM for /f "tokens=*" %%i in (files\codecs_to_be_removed.txt) do (
@REM     IF EXIST "C:\Windows\System32\%%i" (
@REM         takeown /f "C:\Windows\System32\%%i"
@REM         icacls C:\Windows\System32\%%i /grant "%USERNAME%":"(OI)(CI)F" 
@REM     )
@REM )



@REM ///////////////////////////////////////////////////////////////////////
@REM @REM Rename some files to aaa* to be able to remove them later on:
@REM for /f "tokens=*" %%i in (files\codecs_to_be_installed.txt) do (
@REM     setlocal EnableDelayedExpansion
@REM     set /a counter1=0
@REM     IF EXIST "C:\Windows\System32\%%i" (
@REM         set /a counter1+=1
@REM         ren "C:\Windows\System32\%%i" "aaa_!counter1!"
@REM     )
@REM )


@REM for /f "tokens=*" %%a in (files\codecs_to_be_removed.txt) do (
@REM     setlocal EnableDelayedExpansion
@REM     set /a counter2=0
@REM     IF EXIST "C:\Windows\System32\%%a" (
@REM         set /a counter2+=1
@REM         ren "C:\Windows\System32\%%a" "aaaa_!counter2!"        
@REM     )
@REM )



@REM ren "C:\Windows\System32\migwiz\replacementmanifests\msmpeg2vdec-migration-replacement.man" "aaa_1"
@REM ren "C:\Windows\System32\ChxDecoder.dll" "aaa_2"
@REM ren "C:\Windows\System32\DMRCDecoder.dll" "aaa_3"
@REM ren "C:\Windows\System32\DolbyDecMFT.dll" "aaa_4"
@REM ren "C:\Windows\System32\eqossnap.dll" "aaa_5"
@REM ren "C:\Windows\System32\jpndecoder.dll" "aaa_6"
@REM ren "C:\Windows\System32\l3codeca.acm" "aaa_7"
@REM ren "C:\Windows\System32\l3codecp.acm" "aaa_8"
@REM ren "C:\Windows\System32\mfAACEnc.dll" "aaa_9"
@REM ren "C:\Windows\System32\mfdvdec.dll" "aaa_10"
@REM ren "C:\Windows\System32\mfh264enc.dll" "aaa_11"
@REM ren "C:\Windows\System32\mibincodec.dll" "aaa_12"
@REM ren "C:\Windows\System32\mimofcodec.dll" "aaa_13"
@REM ren "C:\Windows\System32\MP3DMOD.DLL" "aaa_14"
@REM ren "C:\Windows\System32\MP43DECD.DLL" "aaa_15"
@REM ren "C:\Windows\System32\MP4SDECD.DLL" "aaa_16"
@REM ren "C:\Windows\System32\MPG4DECD.DLL" "aaa_17"
@REM ren "C:\Windows\System32\MSAC3ENC.DLL" "aaa_18"
@REM ren "C:\Windows\System32\MSAlacDecoder.dll" "aaa_19"
@REM ren "C:\Windows\System32\MSAlacEncoder.dll" "aaa_20"
@REM ren "C:\Windows\System32\MSAMRNBDecoder.dll" "aaa_21"
@REM ren "C:\Windows\System32\MSAMRNBEncoder.dll" "aaa_22"
@REM ren "C:\Windows\System32\MSAudDecMFT.dll" "aaa_23"
@REM ren "C:\Windows\System32\MSFlacDecoder.dll" "aaa_24"
@REM ren "C:\Windows\System32\MSFlacEncoder.dll" "aaa_25"
@REM ren "C:\Windows\System32\msmpeg2adec.dll" "aaa_26"
@REM ren "C:\Windows\System32\MSMPEG2ENC.DLL" "aaa_27"
@REM ren "C:\Windows\System32\msmpeg2vdec.dll" "aaa_28"
@REM ren "C:\Windows\System32\MSOpusDecoder.dll" "aaa_29"
@REM ren "C:\Windows\System32\MtfDecoder.dll" "aaa_30"
@REM ren "C:\Windows\System32\rtmcodecs.dll" "aaa_31"
@REM ren "C:\Windows\System32\UtcDecoderHost.exe" "aaa_32"
@REM ren "C:\Windows\System32\VBICodec.ax" "aaa_33"
@REM ren "C:\Windows\System32\WindowsCodecs.dll" "aaa_34"
@REM ren "C:\Windows\System32\WindowsCodecsExt.dll" "aaa_35"
@REM ren "C:\Windows\System32\WMADMOD.DLL" "aaa_36"
@REM ren "C:\Windows\System32\WMADMOE.DLL" "aaa_37"
@REM ren "C:\Windows\System32\wmcodecdspps.dll" "aaa_38"
@REM ren "C:\Windows\System32\WMSPDMOD.DLL" "aaa_39"
@REM ren "C:\Windows\System32\WMSPDMOE.DLL" "aaa_40"
@REM ren "C:\Windows\System32\WMVDECOD.DLL" "aaa_41"
@REM ren "C:\Windows\System32\WMVENCOD.DLL" "aaa_42"
@REM ren "C:\Windows\System32\WMVSDECD.DLL" "aaa_43"
@REM ren "C:\Windows\System32\WMVSENCD.DLL" "aaa_44"
@REM ren "C:\Windows\System32\WMVXENCD.DLL" "aaa_45"
@REM ren "C:\Windows\System32\WindowsCodecsRaw.dll" "aaa_46"
@REM ren "C:\Windows\System32\WindowsCodecsRaw" "aaa_47"
@REM ren "C:\Windows\System32\DolbyDAX2APOProp.dll" "aaa_48"
@REM ren "C:\Windows\System32\DolbyDAX2APOv211.dll" "aaa_49"
@REM ren "C:\Windows\System32\DolbyDecMFT.dll" "aaa_50"



takeown /f "C:\Windows\System32\DriverStore\FileRepository\t15plmwa.inf_amd64_f6d7a3cb50e65a52\DolbyDAX2APOv211.dll" /r /d y
icacls "C:\Windows\System32\DriverStore\FileRepository\t15plmwa.inf_amd64_f6d7a3cb50e65a52\DolbyDAX2APOv211.dll" /grant "%USERNAME%":"(OI)(CI)F"
takeown /f "C:\Windows\System32\DriverStore\FileRepository\t15plmwa.inf_amd64_f6d7a3cb50e65a52\DolbyDAX2APOProp.dll" /r /d y
icacls "C:\Windows\System32\DriverStore\FileRepository\t15plmwa.inf_amd64_f6d7a3cb50e65a52\DolbyDAX2APOProp.dll" /grant "%USERNAME%":"(OI)(CI)F"

ren "C:\Windows\System32\DriverStore\FileRepository\t15plmwa.inf_amd64_f6d7a3cb50e65a52\DolbyDAX2APOv211.dll" "aaa_51"
ren "C:\Windows\System32\DriverStore\FileRepository\t15plmwa.inf_amd64_f6d7a3cb50e65a52\DolbyDAX2APOProp.dll" "aaa_52"
@REM ///////////////////////////////////////////////////////////////////////


@REM @REM @REM MOVE FILES TO SYSTEM32:
move "best_audio_codecs_for_windows_11\*" "C:\Windows\System32\"
move "best_audio_codecs_for_windows_11\migwiz\replacementmanifests\*" "C:\Windows\System32\migwiz\replacementmanifests\"

pause

////////////////////////////////////
