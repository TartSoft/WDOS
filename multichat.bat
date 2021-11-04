@echo off
:StartUp
mode con cols=40 lines=8
Chat.bat
 
echo %time%~%date%~%username%
echo -------------------------
pause
cls
start msging.bat
echo Loading Chat
ping localhost -n 3>nul
cls
if not exist chat.log goto md
goto as
:md
echo ------------>chat.log
(
echo n Data Log
echo e 000 000 23
echo 3 dke
echo application run code
echo errorlevel # 33317278
)Chat.dat
ren Chat.dat "chathelp.exe"
cls
goto as
 
:as
D:\Users\%username%\Desktop\logdata.log
cls
:a
cls
type chat.log
ping localhots -n 1>nul
goto a
 
:cls
cls
goto a