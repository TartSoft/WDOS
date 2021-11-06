@ECHO OFF
color 02
title Win/DOS 
:loadscr
echo Loading Win/DOS, Please Wait...
start welcome.mp3 
:login
cls
echo Login:
set /p usn=
if %usn%==admin goto mainscr
if not %usn%==%usn% goto logout
:logout
echo Sorry, wrong username!
pause
exit 
:mainscr
cls
echo Curent Time:
echo Time: %time%
echo Date: %date% 
echo ------------------------
echo Applications:
echo Notepad
echo ChatRoom
echo Calculator
echo Minesweeper
echo Command Window 
echo -------------------------
echo Choose a program to open...
set /p prog=
if %prog%==Notepad goto npad
if %prog%==ChatRoom goto chatroom
if %prog%==Minesweeper goto minesweeper
if %prog%==Calculator goto calculator
if %prog%==Command Window goto cmw
:npad
start notepad.bat
:chatroom
start multichat.bat
:minesweeper
start minesweeper.bat
:calculator
start calculator.bat
:cmw
start commandcenter.bat