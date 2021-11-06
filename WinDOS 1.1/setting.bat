@echo off
color 02
title Win/DOS Settings
echo Win/DOS Settings
echo --------------------------
echo To open an option please type a number...
echo --------------------------------------------------------------------
echo Options:
echo Check updates [1]
echo Personalized  [2]
echo Uninstall WinDOS  [3]
echo --------------------------------------------------------------------
set /p input=
if %input% == 1 goto chkupd
if %input% == 2 goto personalized  
if %input% == 3 goto uninst
:chkupd
echo Your devices are up-to date!
echo Visit FlyFar Github to Check for New Updates!
echo https://github.com/duongletrieu
:personalized
echo Type a command to change theme...
set /p theme=
if %theme% == $theme-black goto black
if %theme% == $theme-blue  goto blue
if %theme% == $theme-green  goto green
if %theme% == $theme-aqua  goto aqua
if %theme% == $theme-red  goto red
if %theme% == $theme-purple goto purple 
if %theme% == $theme-yellow goto yellow
if %theme% == $theme-white goto white 
if %theme% == $theme-gray goto gray
:black
color 0
:blue
color 1
:green
color 2
:aqua
color 3
:red
color 4
:purple
color 5
:yellow
color 6
:white
color 7
:gray 
color 8
:sys
echo Uninstall WinDOS
echo 2: [Uninstall WinDOS] [2]
echo ----------------------------------
set /p sysoptions =
if %sysoptions% = 2 goto uninst
:uninst
del D:\WinDOS


