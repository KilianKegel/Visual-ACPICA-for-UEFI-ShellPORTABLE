@echo off
goto START

:START
rem ######################################################
rem ### Tools bootstrap process
rem ######################################################

rem #######################################################################
rem ### check/create MYDOWNLOADS ##########################################
rem #######################################################################
if defined MYDOWNLOADS (
    rem echo MYDOWNLOADS exist
) else (
    echo create MYDOWNLOADS locally
    mkdir MYDOWNLOADS
    echo set MYDOWNLOADS=%~dp0MYDOWNLOADS
    set MYDOWNLOADS=%~dp0MYDOWNLOADS
)

rem #######################################################################
rem ### get TOOLS #########################################################
rem #######################################################################
if not exist Tools (
    md Tools
)
if not exist %MYDOWNLOADS%\wget.exe powershell "& {[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri "https://eternallybored.org/misc/wget/1.21.3/64/wget.exe -OutFile %MYDOWNLOADS%\wget.exe"}"
if not exist Tools\wget.exe copy %MYDOWNLOADS%\wget.exe Tools\wget.exe
rem if not exist %MYDOWNLOADS%\EnterpriseWDK_rs2_release_15063_20170317-1834.zip Tools\wget --no-check-certificate --output-document=%MYDOWNLOADS%\EnterpriseWDK_rs2_release_15063_20170317-1834.zip    https://go.microsoft.com/fwlink/p/?LinkID=846038
rem if not exist %MYDOWNLOADS%\nasm-2.16.01-win64.zip               Tools\wget --no-check-certificate --output-document=%MYDOWNLOADS%\nasm-2.16.01-win64.zip                                            https://www.nasm.us/pub/nasm/releasebuilds/2.16.01/win64/nasm-2.16.01-win64.zip
rem if not exist %MYDOWNLOADS%\python-3.10.11-embed-win64.zip       Tools\wget --no-check-certificate --output-document=%MYDOWNLOADS%\python-3.10.11-embed-win64.zip                                    https://www.python.org/ftp/python/3.10.11/python-3.10.11-embed-amd64.zip
rem if not exist %MYDOWNLOADS%\openssl-1.0.2r-x64_86-win64.zip      Tools\wget --no-check-certificate --output-document=%MYDOWNLOADS%\openssl-1.0.2r-x64_86-win64.zip                                   https://indy.fulgan.com/SSL/openssl-1.0.2r-x64_86-win64.zip
rem if not exist %MYDOWNLOADS%\iasl-win-20230628.zip                Tools\wget --no-check-certificate --output-document=%MYDOWNLOADS%\iasl-win-20230628.zip                                             https://downloadmirror.intel.com/783546/iasl-win-20230628.zip
if not exist %MYDOWNLOADS%\flex-2.5.4a-1-bin.zip                Tools\wget --no-check-certificate --output-document=%MYDOWNLOADS%\flex-2.5.4a-1-bin.zip                                             https://downloads.sourceforge.net/project/gnuwin32/flex/2.5.4a-1/flex-2.5.4a-1-bin.zip
if not exist %MYDOWNLOADS%\bison-2.4.1-bin.zip                  Tools\wget --no-check-certificate --output-document=%MYDOWNLOADS%\bison-2.4.1-bin.zip                                               https://downloads.sourceforge.net/project/gnuwin32/bison/2.4.1/bison-2.4.1-bin.zip
if not exist %MYDOWNLOADS%\libintl-0.14.4-bin.zip               Tools\wget --no-check-certificate --output-document=%MYDOWNLOADS%\libintl-0.14.4-bin.zip                                            https://downloads.sourceforge.net/project/gnuwin32/libintl/0.14.4/libintl-0.14.4-bin.zip
if not exist %MYDOWNLOADS%\libiconv-1.9.2-1-bin.zip             Tools\wget --no-check-certificate --output-document=%MYDOWNLOADS%\libiconv-1.9.2-1-bin.zip                                          https://downloads.sourceforge.net/project/gnuwin32/libiconv/1.9.2-1/libiconv-1.9.2-1-bin.zip
if not exist %MYDOWNLOADS%\regex-2.7-bin.zip                    Tools\wget --no-check-certificate --output-document=%MYDOWNLOADS%\regex-2.7-bin.zip                                                 https://downloads.sourceforge.net/project/gnuwin32/regex/2.7/regex-2.7-bin.zip

rem ######################################################################
rem ### InstallCheck Tools ###############################################
rem ######################################################################
rem ######################################################################
rem ### FLEX
rem ######################################################################
if not exist Tools\flex-2.5.4a-1-bin (
    echo EXTRACTING FLEX ...
    md Tools\flex-2.5.4a-1-bin
    tar -xf %MYDOWNLOADS%\flex-2.5.4a-1-bin.zip -C Tools\flex-2.5.4a-1-bin
)
set pathNEW=%~dp0Tools\flex-2.5.4a-1-bin\bin

rem ######################################################################
rem ### BISON
rem ######################################################################
if not exist Tools\bison-2.4.1-bin (
    echo EXTRACTING BISON ...
    md Tools\bison-2.4.1-bin
    tar -xf %MYDOWNLOADS%\bison-2.4.1-bin.zip -C Tools\bison-2.4.1-bin
)
set pathNEW=%pathNEW%;%~dp0Tools\bison-2.4.1-bin\bin

rem ######################################################################
rem ### LIBINTL DLL (required by BISON)
rem ######################################################################
if not exist Tools\libintl-0.14.4-bin (
    echo EXTRACTING LIBINTL DLL (required by BISON)
    md Tools\libintl-0.14.4-bin
    tar -xf %MYDOWNLOADS%\libintl-0.14.4-bin.zip -C Tools\libintl-0.14.4-bin
)
set pathNEW=%pathNEW%;%~dp0Tools\libintl-0.14.4-bin\bin

rem ######################################################################
rem ### LIBICONV2.DLL (required by BISON)
rem ######################################################################
if not exist Tools\libiconv-1.9.2-1-bin (
    echo EXTRACTING LIBICONV2.DLL (required by BISON)
    md Tools\libiconv-1.9.2-1-bin
    tar -xf %MYDOWNLOADS%\libiconv-1.9.2-1-bin.zip -C Tools\libiconv-1.9.2-1-bin
)
set pathNEW=%pathNEW%;%~dp0Tools\libiconv-1.9.2-1-bin\bin

rem ######################################################################
rem ### REGEX2.DLL (required by BISON/M4)
rem ######################################################################
if not exist Tools\regex-2.7-bin (
    echo EXTRACTING REGEX2.DLL (required by BISON)
    md Tools\regex-2.7-bin
    tar -xf %MYDOWNLOADS%\regex-2.7-bin.zip -C Tools\regex-2.7-bin
)
set pathNEW=%pathNEW%;%~dp0Tools\regex-2.7-bin\bin

:THEEND
set path=%~dp0;%PATHNEW%;%path%;
start START_WITH_LAUNCH_AcpiComponents.slnx
rem cmd /title FlexBison
:EOF
