@echo off
color 2

REG QUERY HKU\S-1-5-19\Environment >NUL 2>&1 
IF %errorlevel%==1 (goto :error)
:start
cls
title Select an option!

echo            ------------------ 
echo                 Welcome! 
echo            ------------------ 
echo.
:chooose
echo.
echo   What do you want to do? (Type option number below)
echo.
echo 1. Add - Make BAT files Run with Elevated Permissions
echo 2. Remove - Make BAT files Run with Elevated Permissions
echo.

SET /P var=

 if %var%==1 (goto :add)
 if %var%==2 (goto remove) ELSE (cls &goto :chooose)

:add
title Adding script...
echo.&echo.&echo Press 'YES' to the following prompts, or the code won't work!
rem CODE
if exist "C:\Windows\Temp\apply.reg" (goto :heheboi)
echo Windows Registry Editor Version 5.00 >> "C:\Windows\Temp\Apply.log"
echo. >> "C:\Windows\Temp\Apply.log"
echo ; Made by TabbySL >> "C:\Windows\Temp\Apply.log"
echo. >> "C:\Windows\Temp\Apply.log"
echo [HKEY_CLASSES_ROOT\batfile\shell] >> "C:\Windows\Temp\Apply.log"
echo @="runas"  >> "C:\Windows\Temp\Apply.log"
ren "C:\Windows\Temp\Apply.log" apply.reg
:heheboi
cd C:\Windows\Temp
apply.reg
cd C:\Users\%username%
rem End of CODE

echo.
cls
echo.
echo  Alright! You have sucessfully added The script to your computer!
echo  All further (.bat) files will always open with Elevated Rights.
echo.
echo.
timeout /t 4 /nobreak >nul
:chose
cls
echo  What do you want to do? (Type option number below)
echo.
echo 1. Go to Home (Select this if you want to revert changes) 
echo 2. Exit the Script
echo.
set /p var1= 
echo.

if %var1%==1 goto :start
if %var1%==2 (exit) ELSE (goto :chose)

:remove
reg delete HKEY_CLASSES_ROOT\batfile\shell /ve /f
if %errorlevel%==1 (goto :failure) 


cls
echo.
echo  Alright! You have sucessfully Removed the script from your computer! 
echo. 
echo.
timeout /t 3 /nobreak >nul 

:choose
cls
echo  What do you want to do? (Type option number below)
echo.
echo 1. Go to Home (Select this if you want to revert changes) 
echo 2. Exit the Script
echo.
set /p var1 = 
echo.

if %var1%==1 (goto :start)
if %var1%==2 (exit) ELSE (goto :choose)

:failure
color 4
timeout /t 1 /nobreak >nul
echo  Err... Either the Registry value was already removed,
echo        or you did not click 'yes' on the UAC Prompt.
echo.
echo  Please try Running the script again or try restarting the PC :)


timeout /t 7 /nobreak >nul &exit

:error
color 4
echo  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo  + This script needs elevation, Thus you have to run it as Administrator! +
echo  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo   This script is totally safe, and the code is open source 
echo     so you can check the code if you think its sus ;)
echo. 
echo.
echo   Other Things to Consider ; 
echo  ````````````````````````````
echo  This Script could be blocked by a third party antivirus software,
echo  if the script doesn't work as intended, try disabling virus guard.

timeout /t 25 /nobreak >nul 
exit
