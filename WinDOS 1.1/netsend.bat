@echo off
color 02
title NetSend
echo WinDOS NetSend 
:msgsend
echo Note : This program only be used for computers that in the current domain or workgroup
echo Type your messages down here if you have checked that your computer in the current domain or workgroup
set /p msg =
net send * %msg%
pause
echo You have send your messgae successfuly, now choose:
echo Type the number to choose an option...
echo [1] Continue to send
echo [2] Exit
set /p option =
if %option% = 1 goto msgsend
if %option% = 2 goto exit
:exit
pause
exit