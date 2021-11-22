@echo off
color 17
title Update Check 
echo UPDATE CHECKER
echo ---------------------------------
echo Welcome to WinDOS Update Checker!
echo We will get start now!
echo ---------------------------------
echo ---------------------------------
echo Press any key to continue...
echo ---------------------------------
pause > NUL
cls
echo Loading, please wait...
timeout 6 > NUL
cls
echo Checking the version...
timeout 3 > NUL
if EXIST "D:\Le Trieu Duong\Programming\WinDOS2\SYS\ver2.txt" (
   goto uptodate
)
if NOT exist "D:\Le Trieu Duong\Programming\WinDOS2\SYS\ver2.txt" (
   goto notuptodate
)
:uptodate
echo You are Up-to-dated!
echo.
echo -------------------------
echo Press any key to exit...
echo -------------------------
pause > NUL
exit 
:notuptodate
echo You are not Up-to-dated!
echo Downloading files needed...
$url = "https://github.com/duongletrieu/WiDOS/WinDOS2/SYS/ver2.txt"
$output = "D:\Le Trieu Duong\Programming\WinDOS2\SYS\ver2.txt"
$start_time = Get-Date

Invoke-WebRequest -Uri $url -OutFile $output
Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
echo Files Downloaded!
echo.
echo -------------------------
echo Press any key to exit...
echo -------------------------
pause > NUL
exit 
   
