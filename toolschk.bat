@echo off
rem #########################################################################
rem ### BIOSON/FLEX installation check ######################################
rem #########################################################################
BISON --version > NUL 2>&1
set INSTFAIL=0
if errorlevel 1 (
    echo.
    echo Install BISON from http://gnuwin32.sourceforge.net/packages/bison.htm
    set INSTFAIL=1
) 

FLEX --version > NUL 2>&1
if errorlevel 1 (
    echo.
    echo Install FLEX from http://gnuwin32.sourceforge.net/packages/flex.htm
    set INSTFAIL=1
) 

if 1 == %INSTFAIL% (
    echo. 
    echo Please read https://acpica.org/downloads/windows-source
    echo. 
    PAUSE
)
set INSTFAIL=