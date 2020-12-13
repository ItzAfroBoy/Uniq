@echo off
:start
title Uniq
set choice=
cls
echo Hi, there
ping -n 3 127.0.0.1>nul
goto menu

:menu
echo.
echo Select an option:
echo 1. Convert Website
echo 2. Install Reqiuerments
echo 3. Check Reqiuerments
echo 4. Exit
set /p choice= Enter number to select option:
if '%choice%'=='1' goto convert
if '%choice%'=='2' goto install
if '%choice%'=='3' goto check
if '%choice%'=='4' goto exit
echo "%choice" is not valid.
ping -n 2 127.0.0.1>nul
echo Try again
echo.
goto menu

:convert
echo.
echo Please Note: All urls must include a protocol (https / http ) and a domain (.com / .co.uk / .io)
echo If a protocol is not suppplied, the application defaults to https
set /p url= Enter a url: 
set /p flash= Does this site require flash?(y/n): 
if '%require%'=='y' goto f-convert
if '%require%'=='n' goto c-continue

:f-convert
echo.
call nativefier --flash %url%
goto finished

:c-continue
echo.
call nativefier %url%
goto finished

:finished
echo.
echo All done.
set /p choice= Would you like to convert another url or exit? (y / n):
if '%choice%'=='y' goto convert
if '%choice%'=='n' goto exit
echo "%choice%" is not valid.
ping -n 2 127.0.0.1>nul
echo Try again
echo.
goto finished

:install
echo.
call npm i -g nativefier
echo All reqiuerments are installed
ping -n 2 127.0.0.1>nul
goto menu

:check
echo.
echo If the reqiuerments are installed, the version number should display (8.0.7)
ping -n 2 127.0.0.1>nul
echo If no number is displayed, use option 2 in the menu
call nativefier -v
echo.
echo All done
ping -n 2 127.0.0.1>nul
goto menu

:exit
echo.
echo Goodbye.
ping -n 2 127.0.0.1>nul
exit