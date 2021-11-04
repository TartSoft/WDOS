@echo off
set rr=2
mode con cols=25 lines=1
:an
set /p user=User:
set user=%user%
:a
cls
set /p log=^>^>
cls
echo %user%^>%log%>>chat.log
goto a
 