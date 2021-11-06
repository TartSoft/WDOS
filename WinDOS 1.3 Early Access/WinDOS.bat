@echo off
color 02
title WinDOS 1.2
echo Loading, Please Wait... 
cls            
echo Login: 
set/p pass=
if %pass%==123@123 goto mainscr
pause
:mainscr
cls
echo Choose a program...
@Mode 48,15
@Title %~n0
Batbox /h 0

:Loop
Call Button  10 4 "Calculator" 24  4 " Command Prompt " 17  8 " Settings " # Press
Getinput /m %Press% /h 70

:: Check for the pressed button 
if %errorlevel%==1 (start Calculator.bat)
if %errorlevel%==2 (start CMD.bat)
if %errorlevel%==3 (start Settings.bat)
goto Loop
