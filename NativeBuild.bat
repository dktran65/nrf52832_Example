@echo off
setlocal
:: Setup the Toolchain
@Set UTIL_DIR=C:\SEGGER_Embedded_Studio_for_ARM_4.40\bin
@Set UTIL_EMB=%UTIL_DIR%\emBuild
::
:: Setup Project Location 
@set PROJ=%CD%
@Set OUTDIR="Output"
::
:: Run Native Clean to get the File Location
@cd %PROJ%
if exist %OUTDIR% (@rmdir /Q/S %OUTDIR%)
%UTIL_EMB% -echo -clean -config "Debug" nrf52832_Example.emProject
::
:: Naative Build project
%UTIL_EMB% -echo -rebuild -config "Debug" nrf52832_Example.emProject
endlocal
@echo on

