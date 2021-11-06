@echo off
color 02
title WinDOS Print
:print
echo Type the path of the file you want to print here...
set /p path=
print %path% /c /d:lpt1
pause
goto print