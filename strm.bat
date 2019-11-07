:: Strm.bat "String" [/GS "Offset" "Charnum"] [/RP "Original" "Replace"] [/HP]
@echo.
@if defined show_commands (@echo on) else (@echo off) && setlocal enableextensions enabledelayedexpansion

echo !time! - [STRM_1.0_1] INFO : Selected arguments : %* |find /I "/GS" && (
    echo !time! - [STRM_1.0_1] INFO : /GS option selected.
	goto gs
    )
echo !time! - [STRM_1.0_1] INFO : Selected arguments : %* |find /I "/RP" && (
    echo !time! - [STRM_1.0_1] INFO : /RP option selected.
	goto rp
    )
echo !time! - [STRM_1.0_1] INFO : Selected arguments : %* |find /I "/HP" && (
    echo !time! - [STRM_1.0_1] INFO : Displaying help message.
	goto hp
    )
echo !time! - [STRM_1.0_1] ERR : Invalid option selected.
endlocal && exit /b 1
:rp
if not "%~1" == "" set "string=%~1"
if not "%~3" == "" set "original_char=%~3"
if not "%~4" == "" set "replace_char=%~4"
set "string=!string:%original_char%=%replace_char%!"
echo !time! - [STRM_1.0_1] SUCCESS :  Modified string : !string!.
endlocal && exit /b 0
:gs
if not "%~1" == "" set "string=%~1"
if not "%~3" == "" set "offset=%~3"
if not "%~4" == "" set "charnum=%~4"
set "string=!string:~%offset%,%charnum%!"
echo !time! - [STRM_1.0_1] SUCCESS :  Modified string : !string!.
endlocal && exit /b 0
:hp
echo Usage / Syntax : %~nx0 "String" [/GS "Offset" "Charnum"] [/RP "Original" "Replace"] [/HP]
echo.
echo "String"       : Specifies the string to be used by an operation.
echo.
echo /GS            : Short for get string, gets letters in the string.
echo "Offset"       : The offset in the specified string to get characters from.
echo "Charnum"      : The number of characters to get after the offset.
echo.
echo /RP            : Short for replace, replaces letters in the string.
echo "Original"     : The original character to replace with another character.
echo "Replace"      : The character to replace the original character.
echo.
echo /HP            : Displays this help message.
endlocal && exit /b 0