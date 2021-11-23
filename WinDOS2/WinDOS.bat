@echo off
color 02
set ver=2
title WinDOS%ver%
echo Loading, Please Wait...
timeout 3 > NUL
echo Checking files... 
If exist "D:\Le Trieu Duong\Programming\WinDOS2\SYS\BOOT.ini" (
    msg * Files existed...
) 
if NOT exist "D:\Le Trieu Duong\Programming\WinDOS2\SYS\BOOT.ini" (
   cd "D:\Le Trieu Duong\Programming\WinDOS2\SYS"
   start errscr.bat
   exit  
)
:login
cls            
echo ---------------------------
echo Login: 
echo Type your password...
echo ---------------------------
set/p pass=
if %pass%==183456 goto mainscr
if not %pass%==%pass% goto error
:error
msg * Your password is not correct. Please try again
goto login
:mainscr
cls
echo ---------------------------------------------
echo Type a number to open a program...
echo ---------------------------------------------
echo Copyright 2021-2021 CoreSoft, All Right Reserved
echo.
echo.
echo 1.Calculator 
echo 2.Notepad
echo 3.Minesweeper
echo 4.Deal or no Deal 
echo 5.Command Prompt
echo. 
echo -------------------
echo Curent time:
echo Time: %time%
echo Date: %date%
echo --------------------
echo.
echo --------------------
echo Help [Type 7]
echo --------------------
echo.
set /p input= 
if %input%==1 goto calc 
if %input%==2 goto notepad
if %input%==3 goto minesweeper
if %input%==4 goto dealornodeal
if %input%==5 goto commandprompt
if %input%==7 goto helpme
:calc
cls
TITLE Calculator
ECHO OFF
CLS
ECHO WinDOS Calculator
:TOP
color 3f
Cls
ECHO ----------------------------------------------------
ECHO[
ECHO               Win/DOS CALCULATOR
ECHO[
ECHO ----------------------------------------------------
ECHO[
ECHO[
ECHO    + = Sum
ECHO[
ECHO    - = Sub
ECHO[
ECHO    / = Division
ECHO[
ECHO    * = Multiply
ECHO[
ECHO    ~ = Exit
ECHO[
ECHO[
ECHO ----------------------------------------------------
ECHO[
SET/P ch=" Enter Symbol "
IF %ch% EQU + GOTO:SUM
IF %ch% EQU - GOTO:SUB
IF %ch% EQU / GOTO:DIV
IF %ch% EQU * GOTO:MUL
IF %ch% EQU ~ GOTO:EXI
IF %ch% GTR . GOTO:Hel
:SUM
CLS
ECHO ---------------------------------------------------
ECHO[
ECHO                         SUM
ECHO[
ECHO ---------------------------------------------------
ECHO[
set /p A=" Enter First Number = "
ECHO[
set /p B=" Enter Second Number = "
SET /A C=A+B
ECHO[
ECHO ---------------------------------------------------
ECHO %A%+%B%=%C%
PAUSE
GOTO:TOP
:SUB
CLS
ECHO ---------------------------------------------------
ECHO[
ECHO                     SUBTRACTION
ECHO[
ECHO ---------------------------------------------------
ECHO[
set /p A=" Enter First Number = "
ECHO[
set /p B=" Enter Second Number = "
SET /A C=A-B
ECHO[
ECHO ---------------------------------------------------
ECHO %A%-%B%=%C%
PAUSE
GOTO:TOP
:DIV
CLS
ECHO ----------------------------------------------------
ECHO[
ECHO                      DIVISION
ECHO[
ECHO -----------------------------------------------------
ECHO[
set /p A=" Enter First Number = "
ECHO[
set /p B=" Enter Second Number = "
SET /A C=A/B
ECHO[
ECHO -----------------------------------------------------
ECHO %A%/%B%=%C%
PAUSE
GOTO:TOP
:MUL
CLS
ECHO ---------------------------------------------------
ECHO[
ECHO                    MULTIPICATION
ECHO[
ECHO ----------------------------------------------------
ECHO[
set /p A=" Enter First Number = "
ECHO[
set /p B=" Enter Second Number = "
SET /A C=A*B
ECHO[
ECHO ----------------------------------------------------
ECHO %A%*%B%=%C%
PAUSE
GOTO:TOP
:EXI
EXIT
:HEL
CLS
ECHO --------------------------------------------------
ECHO[
ECHO                         HELP
ECHO[
ECHO --------------------------------------------------
ECHO Press (+) For Sum, (-) For Sub, (/) for Division, (*) for Multiply.
PAUSE
GOTO:TOP
:notepad
cls
color 0a
set name=United
title %name% - Win/DOS Notepad
:options
cls
echo ________________________________________
echo.
echo             Win/DOS Notepad
echo ________________________________________
echo - %name%
echo.
echo Press 0 to edit a document that already exists.
echo Press 1 to edit the name of your document.
echo Press 2 to edit the contents of your document.
echo Press 3 for help.
echo Press 4 to exit.

set /p you=">"
if %you%==1 goto 1
if %you%==2 goto 2
if %you%==3 goto help
if %you%==4 goto 4
if %you%==0 goto 0

cls
echo *********************************
echo Sorry, invalid number!
echo *********************************
ping localhost -n 2 >nul
goto options

:1
cls
echo ________________________________________
echo.
echo             Win/DOS Notepad
echo ________________________________________
echo - %name%
echo. 
echo Name Your Document .. eg. 'anyname.txt' or 'anyname.bat'
set /p name=">"
title %name% - Win/DOS Notepad

goto options

:2
cls
echo ________________________________________
echo.
echo             Win/DOS Notepad
echo ________________________________________
echo - %name%
echo. 
echo To add another line to your text press enter .. To stop editing press the big 
echo red X in the corner of this screen.
echo.
echo Cannot use symbols:"   > < |   " If you use any of them 3 symbols it closes!
echo.
set /p content=">"
echo %content%>>%name%
cls
echo Save Successful!
ping localhost -n 2 >nul
goto 2

:help
cls
echo ________________________________________
echo.
echo             Win/DOS Notepad
echo ________________________________________
echo - %name%
echo. 
echo.
pause
goto options

:4
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo __Win/DOS Notepad_________________________
echo.
echo             Win/DOS Notepad
echo ________________________________________
ping localhost -n 5 >nul
exit

:0
cls
echo ________________________________________
echo.
echo             Win/DOS Notepad
echo ________________________________________
echo - %name%
echo. 
echo Type in the name eg. 'anyname.txt' or 'anyname.bat'
echo The file has to be in the same directory as the Win/DOS Notepad Folder!
set /p edit=">"
edit %edit%
goto options
:minesweeper 
@echo off
setlocal enabledelayedexpansion
title Win/DOS Minesweeper

call :userInterface
if "!exit!"=="true" exit /b

echo.
echo Loading grid...
call :setupGrid

echo Loading display variables...
call :setupDisplayVariables

echo Laying mines...
call :setupMines

call :gameLoop
goto main
exit /b


:userInterface
::A function to provide the main menu for the player.

::Clears the screen and gives the player the options.
cls
echo 1. Play a game with begginer difficulty
echo 2. Play a game with intermediate difficulty
echo 3. Play a game with advanced difficulty
echo 4. Play a game with custom difficulty
echo 5. Exit
echo.
echo.

::Clears the menuChoice and requests the player's input.
set menuChoice=
set /p menuChoice="Enter the number of your choice - "

::The following IF statements check the player's input, setting the appropriate difficultly level and the
::right amount of space between the edge of the screen and the start of the board.

if "!menuChoice!"=="1" (
set difficulty=begginer
set displaySpacer=
exit /b
)

if "!menuChoice!"=="2" (
set difficulty=intermediate
set displaySpacer=
exit /b
)

if "!menuChoice!"=="3" (
set difficulty=advanced
set displaySpacer=
echo.
echo To view the advanced game properly the window must be resized. Right click the
echo CMD icon at the top left of the window, click properties and on the LAYOUT tab,
echo change the width to a minimum of 95.
echo Press enter once changed to refresh the display.
echo.
pause
exit /b
)

if "!menuChoice!"=="4" (
cls
call :getCustomDimensions
exit /b
)
if "!menuChoice!"=="5" (
set exit=true
exit /b
)
goto userInterface


:getCustomDimensions
::A function to recieve custom dimensions from the user and check they are within sensible limits.

set /p xDimension="Enter the width [1-30] - "
if !xDimension! gtr 30 (
echo The maximum width is 30.
goto getCustomDimensions
)
if !xDimension! lss 1 (
echo The minimum width is 1.
goto getCustomDimensions

)
echo.
set /p yDimension="Enter the height [1-30] - "

if !yDimension! gtr 30 (
echo The maximum height is 30.
goto getCustomDimensions
)
if !yDimension! lss 1 (
echo The minimum height is 1.
goto getCustomDimensions

)

::The maximum number of mines is 80% of the squares on the grid.
::The practical maximum number of mines (before causing stack overflow) is 499.
echo.
set /a maxMines= !xDimension! * !yDimension! - !xDimension! * !yDimension! / 5
if /i %maxMines% geq 500 (
set maxMines=499
)

::The practical minimum number of mines is 1. The minimum for a given board is 1/12th of the
::total number of squares on the grid. This prevents stack overflow on the largest grids.
set /a minMines= 1 + !xDimension! * !yDimension! / 12
if /i maxMines geq 500 (
set maxMines=499
)

set /p mineCount="Enter the number of mines [%minMines%-%maxMines%] - "

if !mineCount! lss %minMines% (
echo The minimum number of mines is %minMines%.
goto getCustomDimensions

)
if !mineCount! gtr %maxMines% (
echo The maximum number of mines for this board size is %maxMines%.
goto getCustomDimensions

)

::The space between the edge of the screen and the start of the board is adjusted depending on the size of the board.
::This just makes it look more central.
if !xDimension! leq 10 (
set displaySpacer=
) else (
if !xDimension! leq 17 (
set displaySpacer=
) else (
if !xDimension! leq 22 (
set displaySpacer=
) else (
set displaySpacer=
if !xDimension! gtr 24 (
echo To view large games properly the window must be resized. Right click the
echo CMD icon at the top left of the window, click properties and on the LAYOUT tab,
echo change the width. A width of 95 will encorporate all possible game sizes.
echo Press enter once changed to refresh the display.
echo.
pause
)
)
)
)

::Sets the difficulty variable.
set difficulty=custom

exit /b

:setupGrid

::Sets up the display grid to the correct dimensions, each position on the grid initally containing just a space.
::Variables in the 'D_Grid' (display grid) have the format DX_Y where X and Y are coordinates along the X and Y axes respectively.

::Sets the appropriate dimensions and number of mines to lay based on the difficulty.

if "%difficulty%"=="begginer" (
set xDimension=9
set yDimension=9
set mineCount=10
)

if "%difficulty%"=="intermediate" (
set xDimension=16
set yDimension=16
set mineCount=40
)

if "%difficulty%"=="advanced" (
set xDimension=30
set yDimension=16
set mineCount=99
)

::The number of mine 'flags' placed by the player is zero at the start of the game.
set flaggedCount=0

::Ensures the list of flagged coordinates is empty.
set flaggedCoordinateList=

::Ensures the finalOutcome variable is undefined, it is defined only when a player wins or loses.
set finalOutcome=

::Creates two grids of the appropriate dimensions. The D_grid is the grid displayed to the user, the G_grid is the grid containing all the mines and numbers.

for /l %%I in (1,1,%xDimension%) do (
for /l %%J in (1,1,%yDimension%) do (
set D%%I_%%J= 
set G%%I_%%J=0
)
)
exit /b


:setupDisplayVariables

::Creates a number of variables corresponding to the number of rows in the grid.
::Each variable contains the variable names of all the display grid locations on that row, each surround by percentage signs.
::This allows easy display of the grid, because 'CALL ECHO'ing these variables displays the value of all the display grid loactions on that row.
::Doing it this way means each line of display doesn't have to be generated every time the board is displayed.

::Sets pipe to the pipe character, this is just to draw the grid around the numbers.
set pipe=^^^|

::First section of this for command is just placing the y coordinate and a couple of spaces at the start of each display line, forming the 'y axis label'.
::If the number is single digit (i.e. less than 10) one extra space is put in so everything lines up.
::The second bit builds the rest of the line by simply adding each grid entry one by one, surrounded by pipe characters to give a grid-look.

for /l %%I in (1, 1, %yDimension%) do (
if %%I lss 10 (
set displayLine%%I=%%I  
) else (
set displayLine%%I=%%I 
)
for /l %%J in (1, 1, %xDimension%) do (
set displayLine%%I=!displayLine%%I!%%pipe%%%%D%%J_%%I%%%%pipe%%
)
)

::This for look is devoted to setting up the x axis label line.
::It starts off with an x and a couple of spaces, then just writes each number underneath the corresponding line on the grid.
::No need for the fancy delayed-expansion of the variables using %% or CALL ECHO, this line is fixed and won't change.
::Once again the number of spaces after each number is dictated by whether the number is one- or two-digit to keep it all in line.

set displayLineBottom=  x 
set rowDivider=    
for /l %%J in (1, 1, %xDimension%) do (
if %%J lss 10 (
set displayLineBottom=!displayLineBottom!%%J  
) else (
set displayLineBottom=!displayLineBottom!%%J 
)
set rowDivider=!rowDivider!-  
)
exit /b



:setupMines

::Lays the number of mines appropriate for this difficulty level.

set minesToPlant=%mineCount%
set mineCoOrdinateList=

::Calculates a random position on the G_grid (game grid, containing all the mines and numbers),
::Sets Gcurrent to the value of the G_grid at these coordinates.
::Checks a mine has not already been planted here (it will have value 'MINE' if a mine has already been planted at this location).
::If the location has already been planted, add 1 to the failedMineCount.
::If the space has not already been planted, set that G_grid value to 'MINE' and call the updateG_grid function

:layMines
set failedMineCount=0
for /l %%I in (1,1,%minesToPlant%) do (

set /a xMine= 1 + !random! %% %xDimension%
set /a yMine= 1 + !random! %% %yDimension%

call set Gcurrent=%%G!xMine!_!yMine!%%

if NOT "!Gcurrent!" == "MINE" (
set G!xMine!_!yMine!=MINE
set F!xMine!_!yMine!=*

set mineCoOrdinateList=!mineCoOrdinateList!!xMine!_!yMine!,

call :updateG_grid !xMine! !yMine!
) else (
set /a failedMineCount= !failedMineCount! + 1
)
)

::Calls layMines again if any mines failed to plant, specifying that minesToPlant is the number of failed mines.

if NOT %failedMineCount%==0 (
set minesToPlant=%failedMineCount%
goto layMines
)
exit /b



:updateG_grid

::A function to update the values of the G_grid when a mine is planted, so all the sqaures around it show the correct number.
::Each time a mine is planted, this function is called. All the sqaures adjacent to the mine, assuming they are not mines, have their G-grid value increased by 1.
::When all the mines are laid, the value of the G_grid for each square contains the number of adjacent mines, which is how minesweeper works.

::These 8 pairs x and y values correspond to the 8 ADJacent squares.

set /a adj1X=%1 + 1
set /a adj1y=%2 + 1

set /a adj2X=%1
set /a adj2y=%2 + 1

set /a adj3X=%1 - 1
set /a adj3y=%2 + 1

set /a adj4X=%1 + 1
set /a adj4y=%2 - 1

set /a adj5X=%1
set /a adj5y=%2 - 1

set /a adj6X=%1 - 1
set /a adj6y=%2 - 1

set /a adj7X=%1 + 1
set /a adj7y=%2

set /a adj8X=%1 - 1
set /a adj8y=%2

::This FOR command cycles through the eight ADJacent squares, and, if they are not mines, increases their G_grid value by 1.

for /l %%I in (1,1,8) do (
call set squareValue=%%G!adj%%IX!_!adj%%Iy!%%
if NOT "!squareValue!"=="MINE" (
set /a G!adj%%IX!_!adj%%Iy!= !squareValue! + 1
)
)
exit /b


:gameLoop
::A function to recieve user input, evaluate it, adjust the necessary grids. Repreats until game is won or lost.

::Displays the board.

call :displayBoard

::ECHOs the infoMessage. This is only defined if the user's input was invalid. Otherwise this is just an empty line.
echo.%infoMessage%
echo Flagged %flaggedCount%/%mineCount%
echo.

set infoMessage=

::Clears the input variable, then requests the user's input.
set input=
set /p input="Enter your move or type HELP for help [x y [*]] - "

::Gives help if the user typed help.

if /i "!input!"=="help" (
echo To reveal a square with coordinates x,y type: x y 
echo To flag a sqaure with coordinates x,y as a mine, type: x y *
echo To unflag a square that has already been flagged with coordinates x,y just type: x y *
echo Type EXIT to end the game immediately.
pause
goto gameLoop
)

if /i "!input!"=="exit" (
exit /b
)

::Checks the input is valid, in the format "x y".
::The FOR command splits up the user's input into three parts, the x, the y and the *. The * may or may not have been entered.
::Checks that each x and y coordinate is within the bounds of the grid size.
::Checks if the * is present. If so, calls flagSquare, else calls revealSquare.

for /f "tokens=1,2,3 delims=-, " %%I in ("!input!") do (

if NOT %%I leq %xDimension% (
set infoMessage=Input must be in the form "x y" where x is a number from 1 to %xDimension%.
goto gameLoop
)
if NOT %%I gtr 0 (
set infoMessage=Input must be in the form "x y" where x is a number from 1 to %xDimension%.
goto gameLoop
)
if NOT %%J gtr 0 (
set infoMessage=Input must be in the form "x y" where y is a number from 1 to %yDimension%.
goto gameLoop
)
if NOT %%J leq %yDimension% (
set infoMessage=Input must be in the form "x y" where y is a number from 1 to %yDimension%.
goto gameLoop
)
if NOT "%%K"=="" (
if NOT "%%K"=="*" (
set infoMessage=Input must be in the form "x y" or "x y *".
goto gameLoop
) else (
call :flagSquare %%I %%J
)
) else (
call :revealSquare %%I %%J
)
)

::If the flagging of the or the revealing of the square resulted in a win or lose, exit this function.

if defined finalOutcome (
exit /b
)

::Otherwise, loop round again for another turn.
goto gameLoop


:displayBoard
::A function to clear the screen then display the updated board. 'CALL ECHO's the variables set up in the setupDisplayVariables function.

cls
for /l %%I in (%yDimension%, -1, 1) do (
echo.%displaySpacer%%rowDivider%
call echo.%displaySpacer%!displayLine%%I!
)
echo.%displaySpacer%y
echo.%displaySpacer%%displayLineBottom%
echo.
exit /b


:revealSquare
::Recieves the arguments %1=x and %2=y
::A function to reveal a square.

::Checks if the mine is flagged as a mine, if so, does not reveal it.
::Otherwise checks if the square is a mine, if so asserts LOSE.
::Else just sets the D_grid display variable to the previously hidden G_grid value.
::If the square was a zero, calls the revealZeros function.

if NOT "!D%1_%2!"=="*" (
if "!G%1_%2!"=="MINE" (
set finalOutcome=LOSE
call :generateLoseGrid
) else (
if "!G%1_%2!"=="0" (
set adjacentZeroList=%1_%2,
call :revealZeros %1 %2
) else (
set D%1_%2=!G%1_%2!
)
)
) else (
set infoMessage=That square is flagged as a mine! To reveal it, unflag it first.
)
exit /b


:revealZeros
::A function to reveal the G_grid values of all the squares around a zero. If another zero is found, repeat this funtion for that square.

::Sets the display grid value of the zero-value square to zero.
set D%1_%2=0

::These 8 pairs x and y values correspond to the 8 ADJacent squares.

set /a adj1X=%1 + 1
set /a adj1y=%2 + 1

set /a adj2X=%1
set /a adj2y=%2 + 1

set /a adj3X=%1 - 1
set /a adj3y=%2 + 1

set /a adj4X=%1 + 1
set /a adj4y=%2 - 1

set /a adj5X=%1
set /a adj5y=%2 - 1

set /a adj6X=%1 - 1
set /a adj6y=%2 - 1

set /a adj7X=%1 + 1
set /a adj7y=%2

set /a adj8X=%1 - 1
set /a adj8y=%2


::This FOR loop retrieves the G_grid and D_grid values of each of the adjacent squares.
::If the D_grid is *, the square has been flagged by the player and is not altered
::If the G_grid is zero, that square is added to the adjacentZeroList so that this function is repeated for that square.
::Otherwise the G_grid value for the square is revealed in the D_grid.

for /l %%I in (1,1,8) do (
call set Gadj=%%G!adj%%Ix!_!adj%%Iy!%%
call set Dadj=%%D!adj%%Ix!_!adj%%Iy!%%
if NOT "!Dadj!"=="*" (
if "!Gadj!"=="0" (
if NOT "!Dadj!"=="0" (
set adjacentZeroList=!adjacentZeroList!!adj%%Ix!_!adj%%Iy!,
)
) else (
set D!adj%%Ix!_!adj%%Iy!=!Gadj!
)
)
)

::Remove the square that has just been processed from the list of squares due for processing.

set adjacentZeroList=!adjacentZeroList:%1_%2,=!

::Call the revealZeros function on the next adjacent zero in the list. If the list is empty this FOR command will do nothing.

for /f "tokens=1,2 delims=,_" %%I in ("!adjacentZeroList!") do (
call :revealZeros %%I %%J
)

exit /b


:flagSquare
::A function to flag or unflag a square.
::Recieves the arguments %1=x and %2=y

::If the square is unmarked and unrevealed, simply mark the square as a mine, increment the flaggedCount and add its coordinates
::to the flaggedCoordinateList.
::If the mine is already flagged with a *, unflag the mine and decrement the flaggedCount.
::Otherwise the square has already been revealed and cannot be flagged.

if "!D%1_%2!"==" " (
set D%1_%2=*
set /a flaggedCount+=1
set flaggedCoordinateList=!flaggedCoordinateList!%1_%2,
) else (
if "!D%1_%2!"=="*" (
set D%1_%2= 
set /a flaggedCount-=1

REM :: Remove the square being unflagged from the flaggedCoOrdinateList variable.
set flaggedCoOrdinateList=!flaggedCoOrdinateList:%1_%2,=!
) else (
set infoMessage=That square can't be flagged, it is already revealed.
)
)

::The player is notified if too many mines have been flagged.
if %flaggedCount% gtr %mineCount% (
set infoMessage=You have flagged too many mines; not all are correct. To remove a flag, type "x y *" for an already flagged square.
)

::If the flaggedCount is equal to the number of mines planted, the solution must be checked to see if it is correct.

if %flaggedCount%==%mineCount% (
call :checkSolution !flaggedCoordinateList!
)
exit /b






:checkSolution
::A function to check if all the mines flagged by the player are correct.
::This function is only called when exactly the right number of mines are flagged.
::Receives argument %* containing flaggedCoOrdinateList

::Sets the number of flags verified to be correct to 0 and calls the checkSolutionLoop, passing the flaggedCoOrdinateList (%*)
set correctFlags=0

call :checkSolutionLoop %*

::If the player has flagged all mines correctly, the number of correct flags is equal to the number of mines originally planted.
if "%correctFlags%"=="%mineCount%" (
set finalOutCome=WIN
echo Congratulations you've identified all the mines^^^!
pause
)
exit /b


:checkSolutionLoop
::A function to increment the correctFlags variable every time a flag turns out to be correct. Execution stops if an incorrect mine is found.
::Receives argument %* containing a list of flagged coordinates that haven't been checked yet.
::Only called by checkSolution.

::This FOR /F command takes the first element of the list of flagged coordinates passed as an argument
::and checks that the flagging is correct i.e. the G-grid value is MINE.
::If the flag was correct, the correctFlags variable is incremented and the loop is called again with the remaining elements of the list.
::If the flag was incorrect, the loop sets the infoMessage and exits.

for /f "tokens=1* delims=," %%I in ("%*") do (
if "!G%%I!"=="MINE" (
set /a correctFlags= !correctFlags! + 1
call :checkSolutionLoop %%J
) else (
set infoMessage=All flagged squares aren't correct! To remove a flag, type "x y *" for an already flagged square.
)
)
exit /b






:generateLoseGrid
::A function to set up the final grid shown to the player. This function is only called after the player has lost.
::The lose grid is just a moified D_grid (display grid).
::The only changes made are that unflagged mines are marked with ! and incorrectly flagged are marked as X.

::Sets excl to the exclamation mark character, for use in marking the unflaggedMines.
set excl=^^^!

call :markIncorrectFlagLoop !flaggedCoordinateList!
call :markUnflaggedMinesLoop !mineCoordinateList!
call :displayBoard

echo.
echo Sorry you lost the game!excl! The board above shows unidentified mines as !excl! and incorrectly flagged mines as X.
pause
exit /b

:markIncorrectFlagLoop
::A function to change incorrect flags with a ! correct flags are left as *.
::Argument %* contains the list of flagged coordinates.
::Only called by generateLoseGrid.

for /f "tokens=1* delims=," %%I in ("%*") do (
if NOT "!G%%I!"=="MINE" (
set D%%I=X
)
call :markIncorrectFlagLoop %%J
)
exit /b

:markUnflaggedMinesLoop
::A function to change incorrect flags with a ! correct flags are left as *.
::Argument %* contains the list of flagged coordinates
::Only called by generateLoseGrid.

for /f "tokens=1* delims=," %%I in ("%*") do (
if NOT "!D%%I!"=="*" (
set D%%I=!excl!
)
call :markUnflaggedMinesLoop %%J
)
exit /b

:delorrnodeal
@echo off
echo Loading...
setlocal enabledelayedexpansion
set dealdone=0
set Spaces=                                           

for /l %%I in (1,1,22) do set gapline%%I= ___________ 

set amount1=1
set amount2=10
set amount3=50
set amount4=100
set amount5=500
set amount6=1000
set amount7=5000
set amount8=10000
set amount9=25000
set amount10=50000
set amount11=75000
set amount12=100000
set amount13=300000
set amount14=500000
set amount15=1000000
set amount16=1500000
set amount17=2000000
set amount18=3500000
set amount19=5000000
set amount20=7500000
set amount21=10000000
set amount22=25000000



set famount1=$0.01
set famount2=$0.1
set famount3=$0.50
set famount4=$1
set famount5=$5
set famount6=$10
set famount7=$50
set famount8=$100
set famount9=$250
set famount10=$500
set famount11=$750
set famount12=$1,000
set famount13=$3,000
set famount14=$5,000
set famount15=$10,000
set famount16=$15,000
set famount17=$20,000
set famount18=$35,000
set famount19=$50,000
set famount20=$75,000
set famount21=$100,000
set famount22=$250,000




set Damount1={___$0.01___}
set Damount2={____$0.1___}
set Damount3={____$0.5___}
set Damount4={_____$1____}
set Damount5={_____$5____}
set Damount6={____$10____}
set Damount7={____$50____}
set Damount8={____$100___}
set Damount9={____$250___}
set Damount10={____$500___}
set Damount11={____$750___}
set Damount12={___$1000___}
set Damount13={___$3000___}
set Damount14={___$5000___}
set Damount15={___$10000__}
set Damount16={___$15000__}
set Damount17={___$20000__}
set Damount18={___$35000__}
set Damount19={___$50000__}
set Damount20={___$75000__}
set Damount21={__$100000__}
set Damount22={__$250000__}




for /l %%I in (1,1,22) do set boxtop%%I= _____ 
for /l %%I in (1,1,22) do set boxlid%%I=[_____]
for /l %%I in (1,1,9) do set boxmid%%I=[  %%I  ]
for /l %%I in (10,1,22) do set boxmid%%I=[ %%I  ]
for /l %%I in (1,1,22) do set boxbot%%I=[_____]

for /l %%I in (23,1,24) do set boxtop%%I=       
for /l %%I in (23,1,24) do set boxlid%%I=       
for /l %%I in (23,1,24) do set boxmid%%I=       
for /l %%I in (23,1,24) do set boxbot%%I=       

for /l %%I in (1,4,24) do (
set /a box2number= %%I + 1
set /a box3number= %%I + 2
set /a box4number= %%I + 3
set DisplayLine%%I=#boxtop%%I##boxtop!box2number!##boxtop!box3number!##boxtop!box4number!#
)

for /l %%I in (2,4,24) do (
set /a boxnumber= %%I - 1
set /a box2number= !boxnumber! + 1
set /a box3number= !boxnumber! + 2
set /a box4number= !boxnumber! + 3
set DisplayLine%%I=#boxlid!boxnumber!##boxlid!box2number!##boxlid!box3number!##boxlid!box4number!#
)

for /l %%I in (3,4,24) do (
set /a boxnumber= %%I - 2
set /a box2number= !boxnumber! + 1
set /a box3number= !boxnumber! + 2
set /a box4number= !boxnumber! + 3
set DisplayLine%%I=#boxmid!boxnumber!##boxmid!box2number!##boxmid!box3number!##boxmid!box4number!#
)

for /l %%I in (4,4,24) do (
set /a boxnumber= %%I - 3
set /a box2number= !boxnumber! + 1
set /a box3number= !boxnumber! + 2
set /a box4number= !boxnumber! + 3
set DisplayLine%%I=#boxbot!boxnumber!##boxbot!box2number!##boxbot!box3number!##boxbot!box4number!#
)

set amountnumber1=0
set amountnumber2=11
for /l %%I in (1,2,22) do set /a AmountNumber1= !amountnumber1! + 1 && set /a Amountnumber2= !amountnumber2! + 1 && for /l %%J in (!Amountnumber1!,1,!Amountnumber1!) do for /l %%K in (!Amountnumber2!,1,!Amountnumber2!) do (
set Displayline%%I=#gapline%%J#            !Displayline%%I!            #gapline%%K#
)

set amountnumber1=0
set amountnumber2=11

for /l %%I in (2,2,22) do set /a AmountNumber1= !amountnumber1! + 1 && set /a Amountnumber2= !amountnumber2! + 1 && for /l %%J in (!Amountnumber1!,1,!Amountnumber1!) do for /l %%K in (!Amountnumber2!,1,!Amountnumber2!) do (
set Displayline%%I=#Damount%%J#            !Displayline%%I!            #Damount%%K#
)

for /l %%I in (23,1,24) do set displayline%%I=                         !Displayline%%I!                         

set amountsleft=
for /l %%I in (1,1,22) do set AmountsLeft=!Amountsleft!%%I,


set Amountnumber=1

:RandomNumber

set minval=1

set maxval=22

:NumberGenerator
set /a RandomNumber= %random% / 1489
set /a RandomNumber= %RandomNumber% + %MinVal%
if /i %RandomNumber% GTR %Maxval% goto NumberGenerator

if not defined box%randomnumber% (
set box%randomnumber%=%amountnumber%
set /a Amountnumber= !Amountnumber! + 1
if /i !amountnumber!==23 goto intro
)
goto Randomnumber


:intro
cls
echo Let's Play...
echo.
echo.
echo          ############################################
echo          #                                          #
echo          #   @@   @@@@   @   @            @   @@@   #
echo          #   @ @  @     @ @  @           @ @  @  @  #
echo          #   @  @ @    @   @ @          @   @ @     #
echo          #   @  @ @@@  @@@@@ @          @   @ @     #
echo          #   @ @  @    @   @ @           @ @  @     #
echo          #   @@   @@@@ @   @ @@@@         @   @     #
echo          #                                          #
echo          #   @  @   @         @@   @@@@   @   @     #
echo          #   @@ @  @ @        @ @  @     @ @  @     #
echo          #   @@ @ @   @       @  @ @    @   @ @     #
echo          #   @ @@ @   @       @  @ @@@@ @@@@@ @     #
echo          #   @ @@  @ @        @ @  @    @   @ @     #
echo          #   @  @   @         @@   @@@@ @   @ @@@@  #
echo          #                                          #
echo          ############################################
echo.
echo I do not own the "Deal Or No Deal" format or concept. All copyrights
echo and trademarks are property of their respective owners.
echo.
set /p helpyn="Press enter to continue, or type HELP for instructions.
if /i "%HelpYN%"=="HELP" (
cls
echo The aim of the game is to get as much money as possible for your box.
echo The game concept is simple. There are 22 sums of money inside 22 boxes.
echo The player must choose a box to keep, then remove the others from play,
echo one by one not knowing what sum is inside each box.
echo.
echo After a certain number of choices, The Banker will phone. He will make
echo you an offer to buy your box off you. You may choose to accept this offer,
echo or keep removing money. Removing high sums makes lower offers and vice-
echo versa.
echo.
echo If you play until there are only two boxes left, you have the choice to
echo open the box you started with, or switch to the other box. You win the
echo money in the box.
echo.
echo The knack to the game is knowing whether to take the deal or stop removing
echo money from the game.
pause
)
cls


:ChooseBox
call :display
set /p OwnBox="Choose your own box to keep:    "
if not defined Ownbox goto Choosebox
if /i not %ownbox%0 leq 220 goto ChooseBox
if /i not %ownbox%0 geq 10 goto ChooseBox

set boxtop%ownbox%=       
set boxlid%ownbox%=       
set boxmid%ownbox%=       
set boxbot%ownbox%=       


set BoxesLeft=22

Set turns=5

set boxmessage=Choose the box you want to open       
call :gameloop

if %dealdone%==1 exit /b

Set turns=3
set boxmessage=Choose the box you want to open       
call :gameloop

if %dealdone%==1 exit /b

Set turns=3
set boxmessage=Choose the box you want to open       
call :gameloop

if %dealdone%==1 exit /b

Set turns=3
set boxmessage=Choose the box you want to open       
call :gameloop

if %dealdone%==1 exit /b

Set turns=3
set boxmessage=Choose the box you want to open       
call :gameloop

if %dealdone%==1 exit /b

Set turns=3
set boxmessage=Choose the box you want to open       
call :gameloop

if %dealdone%==1 exit /b

goto SwapOrNot


:gameLoop
cls
call :display
set boxtoremove=

:OpenBox
set /p BoxToRemove="%BoxMessage%"
if not defined BoxToRemove goto OpenBox
if /i not %BoxToRemove%0 leq 220 goto OpenBox
if /i not %BoxToRemove%0 geq 10 goto openBox
if /i %BoxToRemove%==%OwnBox% goto OpenBox
if /i "!Box%boxtoremove%!"=="DONE" goto OpenBox

call :removebox %boxtoremove%
set /a BoxesLeft=%BoxesLeft% - 1
set /a Turns= %Turns% - 1

if /i %turns%==0 (
cls
call :display
set /p asdfghj="You lost amount %Amountinbox%. The Phone is ringing, press enter to answer it."
set asdfghj=
call :MakeOffer
exit /b
)

set boxmessage=You lost amount %Amountinbox%. Choose the box you want to open.       

Goto GameLoop






:RemoveBox
set boxtop%1=       
set boxlid%1%=       
set boxmid%1=       
set boxbot%1=       

set AmountInBox=!Box%1!

call :Remove_Amounts %AmountInBox%
set Box%1=DONE
exit /b

:Remove_Amounts
set damount%1=             
set gapline%1=             

for /f "tokens=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22 delims=," %%A in ("%AmountsLeft%") do (
set amountsleft=
if /i not %%A==%1 set AmountsLeft=%%A,
if /i not %%B==%1 set AmountsLeft=!AmountsLeft!%%B,
if /i not %%C==%1 set AmountsLeft=!AmountsLeft!%%C,
if /i not %%D==%1 set AmountsLeft=!AmountsLeft!%%D,
if /i not %%E==%1 set AmountsLeft=!AmountsLeft!%%E,
if /i not %%F==%1 set AmountsLeft=!AmountsLeft!%%F,
if /i not %%G==%1 set AmountsLeft=!AmountsLeft!%%G,
if /i not %%H==%1 set AmountsLeft=!AmountsLeft!%%H,
if /i not %%I==%1 set AmountsLeft=!AmountsLeft!%%I,
if /i not %%J==%1 set AmountsLeft=!AmountsLeft!%%J,
if /i not %%K==%1 set AmountsLeft=!AmountsLeft!%%K,
if /i not %%L==%1 set AmountsLeft=!AmountsLeft!%%L,
if /i not %%M==%1 set AmountsLeft=!AmountsLeft!%%M,
if /i not %%N==%1 set AmountsLeft=!AmountsLeft!%%N,
if /i not %%O==%1 set AmountsLeft=!AmountsLeft!%%O,
if /i not %%P==%1 set AmountsLeft=!AmountsLeft!%%P,
if /i not %%Q==%1 set AmountsLeft=!AmountsLeft!%%Q,
if /i not %%R==%1 set AmountsLeft=!AmountsLeft!%%R,
if /i not %%S==%1 set AmountsLeft=!AmountsLeft!%%S,
if /i not %%T==%1 set AmountsLeft=!AmountsLeft!%%T,
if /i not %%U==%1 set AmountsLeft=!AmountsLeft!%%U,
if /i not %%V==%1 set AmountsLeft=!AmountsLeft!%%V,
)

set amountinbox=!FAmount%1!
exit /b









:MakeOffer
set amount=0
for /f "tokens=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22 delims=," %%A in ("%AmountsLeft%") do (
set /a Offer= !Amount%%A! + !Amount%%B! + !Amount%%C! + !Amount%%D! + !Amount%%E! + !Amount%%F! + !Amount%%G! + !Amount%%H! + !Amount%%I! + !Amount%%J! + !Amount%%K! + !Amount%%L! + !Amount%%M! + !Amount%%N! + !Amount%%O! + !Amount%%P! + !Amount%%Q! + !Amount%%R! + !Amount%%S! + !Amount%%T! + !Amount%%U! + !Amount%%V! + 0
)
set /a Offer= (%Offer%/((%BoxesLeft%*999)/500))/100


cls
echo.
echo               ####################################       
echo              ##                                  ##      
echo             ##    ############################    ##    
echo              ######     ##            ##     ######       
echo                      ######################        
echo                      #######        #######      
echo                      #####            #####       
echo                      ####              ####     
echo                      ####              ####   
echo                      #####            #####   
echo                     #######          #######
echo                    ##########################
echo                   ############################         
echo                  ##############################           
echo                 ################################          
echo.
echo.
echo                   The Banker Offers: $%Offer%
echo.
echo.
echo                        DEAL OR NO DEAL?
:DealOrNoDeal
set deal=
set /p Deal="       "
if not defined Deal goto DealOrNoDeal
if /i %Deal:~0,1%==d echo.&& Goto Deal_Taken
if /i %Deal:~0,1%==N (exit /b) else (goto :DealOrNoDeal)









:Display


echo/ %displayline1:#=!%
echo/ %displayline2:#=!%
echo/ %displayline3:#=!%
echo/ %displayline4:#=!%
echo/ %displayline5:#=!%
echo/ %displayline6:#=!%
echo/ %displayline7:#=!%
echo/ %displayline8:#=!%
echo/ %displayline9:#=!%
echo/ %displayline10:#=!%
echo/ %displayline11:#=!%
echo/ %displayline12:#=!%
echo/ %displayline13:#=!%
echo/ %displayline14:#=!%
echo/ %displayline15:#=!%
echo/ %displayline16:#=!%
echo/ %displayline17:#=!%
echo/ %displayline18:#=!%
echo/ %displayline19:#=!%
echo/ %displayline20:#=!%
echo/ %displayline21:#=!%
echo/ %displayline22:#=!%
echo/ %displayline23:#=!%
echo/ %displayline24:#=!%

exit /b



:SwapOrNot
cls
echo.
echo               ####################################    
echo              ##                                  ##   
echo             ##    ############################    ##   
echo              ######     ##            ##     ###### 
echo                      ######################        
echo                      #######        #######         
echo                      #####            #####     
echo                      ####              ####  
echo                      ####              ####   
echo                      #####            #####      
echo                     #######          #######
echo                    ##########################
echo                   ############################           
echo                  ##############################       
echo                 ################################       
echo.
echo.
echo                The Banker Has Offered You The Swap
echo.
echo.
echo                        SWAP OR NO SWAP?

:SwapOrNoSwap
set swap=
set /p Swap="       "
if not defined Swap goto SwapOrNoSwap
if /i %Swap:~0,1%==S echo.&& goto Swap_Taken
if /i %Swap:~0,1%==N (echo.&& goto Swap_Not_Taken) else (goto SwapOrNoSwap)




:Swap_Not_Taken
for /f "tokens=1,2 delims=," %%I in ("%AmountsLeft%") do if /i "%%I"=="!Box%OwnBox%!" (set Offer=!Amount%%I!& set OtherBox=%%J& Set OwnBox=%%I) else (set offer=!Amount%%J!& set OtherBox=%%I&& Set OwnBox=%%J)
if /i %offer% lss 100 set offer=0.%offer%&& goto SwapResult
set /a offer= %offer% / 100
if /i %Offer% geq 35000 call :bigWin
goto SwapResult






:Swap_Taken
for /f "tokens=1,2 delims=," %%I in ("%AmountsLeft%") do if /i "%%I"=="!Box%OwnBox%!" (set Offer=!Amount%%J!& set OtherBox=%%I& Set OwnBox=%%J) else (set offer=!Amount%%I!& set OtherBox=%%J& Set OwnBox=%%I)
if /i %offer% lss 100 set offer=0.%offer%&& goto SwapResult
set /a offer= %offer% / 100
if /i %Offer% geq 35000 call :bigWin






:SwapResult
if /i %OwnBox% gtr %Otherbox% (
Echo You took the chance and won :D Well done
) else (
echo Hard luck, you got the smaller prize.
)
echo You won $%Offer% :)
pause>nul
goto endofgame






:Deal_Taken

set dealdone=1

if /i %Offer% geq 35000 call :bigWin

if /i %offer% lss 100 (
set Newoffer=0.%offer%
) else (
set Newoffer=%offer%
)


set temp=!Box%ownbox%!

if /i !Amount%temp%! lss 100 (
set Newtemp=0.!Amount%temp%!
) Else (
set /a Newtemp= !Amount%temp%! / 100
)

if /i %newtemp:.=% gtr %offer% (
echo Hard luck, in your box there was $%newtemp%, but you dealed at $%Newoffer%
)

if /i %newtemp:.=% lss %offer% (
echo Well done, you beat the banker :D
echo Your box was worth $%newtemp% but you sold it for $%NewOffer%
)

if /i %newtemp:.=% equ %offer% (
echo You managed to sell your box for exactly what it was worth, well done :D
echo You won $%NewOffer% :)
)
pause >nul
goto EndOfGame











:BigWin
cls
echo #######################################################
echo #                                                     #
echo #                                                     #
echo #   @       @   @   @   @   @   @   @@@@   @@@@   @   #
echo #   @       @   @   @@  @   @@  @   @      @   @  @   #
echo #   @       @   @   @ @ @   @ @ @   @      @  @   @   #
echo #   @   @   @   @   @ @ @   @ @ @   @@@    @@@    @   #
echo #   @  @ @  @   @   @ @ @   @ @ @   @      @  @   @   #
echo #   @ @   @ @   @   @ @ @   @ @ @   @      @   @      #
echo #    @     @    @   @  @@   @  @@   @@@@   @   @  @   #
echo #                                                     #
echo #                                                     #
echo #######################################################
echo.
echo.
exit /b
:endOfGameexit /b
:commandprompt
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
if %cmd%==power/shutdown goto shut else goto error
if %cmd%==power/hibernate goto hibernate else goto error
if %cmd%==power/restart goto restart else goto error
if %cmd%==net/spdplan goto spdplan else goto error
if %cmd%==file/tmpcln goto tmpcln else goto error
if %cmd%==net/impexp goto wifiimpexp else goto error
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
cls
chcp 65001
title Temporary files cleanup script
echo off
cls
del /f /s /q "%temp%\*"
del /f /s /q "C:\windows\TEMP\*"
echo.
title FINISHED... Temporary files cleanup script
echo Files left:
echo ───────────────────────────────────────────────────────────────────────────────
dir /s /d "C:\windows\TEMP\"
echo ───────────────────────────────────────────────────────────────────────────────
dir /s /d "%temp%"
echo ───────────────────────────────────────────────────────────────────────────────
echo FINISHED...
echo 
pause
:eof
:wifiimpexp
cls
chcp 65001
title Win/DOS WiFi Import
color e0
echo off
cls
:Menu
echo.
echo  ///////////////////////////////////////////////////////////////////
echo  \\┌─────────────────────────────────────────────────────────────┐\\
echo  //│Importer/Exporter of WiFi networks profiles for your computer│//
echo  \\└─────────────────────────────────────────────────────────────┘\\
echo  ///////////////////////////////////////////////////////////////////
echo.
echo             ╔════════════════════════════════════════╗
echo             ║                Main Menu               ║
echo             ╠════════════════════════════════════════╣
echo             ║ 1. Import WiFi Profiles to computer    ║
echo             ║ 2. Export WiFi Profiles to .xml files  ║
echo             ╚════════════════════════════════════════╝
echo.
choice /c 12 /m "Enter your choice. "
if errorlevel 2 (
	goto Exporting
)
:Importing
echo.
echo Importing... Please wait
echo.
for %%N in (Profiles\*.xml) do netsh wlan add profile filename="%%N" user=current
echo.
echo.
pause
goto eof
:Exporting
echo.
echo Exporting... Please wait
if not exist Profiles (
	mkdir Profiles
)
netsh wlan export profile %SSIDName% folder=Profiles
echo.
pause
:eof
:error
msg * It's not recognized as an internal or external command, program or file
pause
goto commandprompt
:helpme
cls
start HELPDOC.log
echo.
echo ------------------------------------------------------
echo Press any key to go back to the Main Screen
echo ------------------------------------------------------
pause > NUL
goto mainscr
