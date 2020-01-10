@echo off
:: Setup the Toolchain
@Set UTIL_DIR=C:\SEGGER_EmbeddedStudio_for_ARM_4.30c\bin
@Set UTIL_EMB=%UTIL_DIR%\emBuild
::
:: Setup Project Location 
@set PROJ=%CD%
@Set OUTDIR="Output"
::
:: Run Native Bompiler to get the File Location
@cd %PROJ%
if exist %OUTDIR% (@rmdir /Q/S %OUTDIR%)
@%UTIL_EMB% -config "Debug" nrf52832_Example.emProject