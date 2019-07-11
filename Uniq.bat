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
echo 4. Go to Github Repo
echo 5. Clone Github Repo
echo 6. Exit
set /p choice= Enter number to select option:
if '%choice%'=='1' goto convert
if '%choice%'=='2' goto install
if '%choice%'=='3' goto check
if '%choice%'=='4' goto repo
if '%choice%'=='5' goto clone
if '%choice%'=='6' goto exit
echo "%choice" is not valid.
ping -n 2 127.0.0.1>nul
echo Try again
echo.
goto menu

:convert
echo.
cd C:\Users\%USERNAME%\Desktop
echo When entering a url, add the domain at the end (e.g .com)
set /p url= Enter a url:
set /p flash= Does this site require flash?(y/n):
if '%require%'=='y' goto f-convert
if '%require%'=='n' goto c-continue

:f-convert
echo.
call nativefier --flash %url%
goto wtd

:c-continue
echo.
call nativefier %url%
goto wtd

:wtd
echo.
echo On your Desktop, there is now a new folder.
ping -n 2 127.0.0.1>nul
echo In that folder, there is a .exe file with the name of the website you chose to convert.
ping -n 2 127.0.0.1>nul
echo You can now put that folder anywhere on your computer and create a shortcut for the exe file so that it can be accessed from the Desktop.
ping -n 2 127.0.0.1>nul
goto finished

:finished
echo.
set /p choice= Would you like to convert another url or exit? (c for convert / e for exit):
if '%choice%'=='c' goto convert
if '%choice%'=='e' goto exit
echo "%choice%" is not valid.
ping -n 2 127.0.0.1>nul
echo Try again
echo.
goto finished

:install
echo.
call npm install nativefier -g
echo All reqiuerments are installed
ping -n 2 127.0.0.1>nul
goto menu

:check
echo.
echo If the reqiuerments are installed, the version number should display (7.6.12)
ping -n 2 127.0.0.1>nul
echo If no number is displayed, use option 2 in the menu
call nativefier -v
echo.
echo All done
ping -n 2 127.0.0.1>nul
goto menu

:repo
echo.
echo Away to github
ping -n 2 127.0.0.1>nul
start https://github.com/ItzAfroBoy/Uniq
goto menu

:clone
echo.
set /p dir= Is there a Github folder in Documents?(y/n):
if '%dir%'=='y' goto g-continue
if '%dir%'=='n' goto create-dir

:create-dir
echo.
cd C:\Users\%USERNAME%\Documents
mkdir Github
ping -n 2 127.0.0.1?nul
echo Folder created
goto g-continue

:g-continue
echo.
cd C:\Users\%USERNAME%\Documents\Github
call git clone https://github.com/ItzAfroBoy/Uniq.git
echo All done
ping -n 2 127.0.0.1>nul
goto menu

:exit
echo.
echo Goodbye.
ping -n 2 127.0.0.1>nul
exit