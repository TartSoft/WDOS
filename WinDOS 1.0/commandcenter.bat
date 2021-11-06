@echo off
color 02
title Command Window 
echo type HELP if you need read again commands...
echo Or type "no" if you don't need...
set /p ask=
if %ask%==HELP goto help
if %ask%==no goto continue
:help
echo Command list:
echo Power Options:
echo
echo power/shutdown
echo power/hibernate
echo power/restart 
echo
echo Net Options:
echo net/spdplan
echo net/wifiimpexp
echo
echo File/Folder Options:
echo file/tmpcln
echo 
:continue
echo Type your command...
set /p cmd=
if %cmd%==power/shutdown goto shut
if %cmd%==power/hibernate goto hibernate
if %cmd%==power/restart goto restart
if %cmd%==net/spdplan goto spdplan
if %cmd%==file/tmpcln goto tmpcln
if %cmd%==net/impexp goto wifiimpexp
:shut
shutdown /s
:hibernate
shutdown/h
:restart 
shutdown /r
:spdplan
netsh int tcp set heuristics disabled
netsh int tcp set global autotuninglevel=disabled
netsh int ip set global taskoffload=disabled
:tmpcln
start tmpcln.bat
:wifiimpexp
start wifiimpexp.bat
 




