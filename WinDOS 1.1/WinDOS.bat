@echo off
color 02
title WinDOS
:ldscr
echo Loading, Please Wait...
:loginscr
cls
echo Login:
echo Type your Password...
set /p pwd=
if %pwd%==123456 goto mainscr
if not %pwd%==%pwd% goto logout
:logout
echo Sorry, your password did not match our data
pause
exit
:mainscr
cls
echo Applications:
echo Settings
echo Minesweeper
echo NetSend (Only you have your current domain or workgroup)
echo Notepad
echo Calculator
echo -----------------------
echo Current time
echo Time: %time%
echo Date: %date%
echo ----------------------
echo System Accessories:
echo Run
echo -----------------------
echo What app do you want to open?
set /p app=
if %app%==Settings goto setting
if %app%==Minesweeper goto minesweeper
if %app%==NetSend goto netsend
if %app%==Notepad goto notepad
if %app%==Calculator goto calculator
if %app%==Run goto run
:setting
start setting.bat
:minesweeper
start minesweeper.bat
:netsend
start netsend.bat
:notepad
start notepad.bat
:calculator
start calculator.bat
:run
start msrun.bat

