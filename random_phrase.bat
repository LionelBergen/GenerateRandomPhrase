@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
SET file=%~dp0\text.txt
SET /a lineCount=0
SET /a lines
SET /a randomNumber=-1

for /F "tokens=*" %%A IN (%file%) DO (
	SET /a lineCount=lineCount+1
	SET lines[!lineCount!]=%%A
)

CALL :randomNumber 1 %lineCount% randomNumber
ECHO Random Number Generated: %randomNumber%
ECHO %file% has %lineCount% lines.

ECHO !lines[%randomNumber%]!

REM Set the line of test to the clipboard
ECHO|set /p=!lines[%randomNumber%]!|clip

GOTO:EOF

:randomNumber
	SET /a minValue = %~1
	SET /a maxValue = %~2

	REM SET /A %~3=!RANDOM! * (%maxValue% - %minValue% + 1) / 32768 + %minValue%
	SET /A %~3=(!random! %%!maxValue!) + %minValue%
GOTO:EOF