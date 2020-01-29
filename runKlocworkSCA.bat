@echo on
setlocal
:: Setup KW Project and Server Location
@set KW_PROJECT=SES_nrf52832
@set KW_SVRNAME=hss-01
@set KW_SVRPORT=8080
@set KW_VERSION=Kw19v2
@set KW_TOOL_LOC=C:\Klocwork\kwbuildtools\bin
::
:: Setup Seggar the Toolchain
@Set UTIL_DIR=C:\SEGGER_Embedded_Studio_for_ARM_4.40\bin
@Set UTIL_EMB=%UTIL_DIR%\emBuild
:: Setup Project Location 
@set PROJDIR=%CD%
::
:: 
:: Run Native Clean
@cd %PROJDIR%
%UTIL_EMB% -echo -clean -config "Debug" nrf52832_Example.emProject
::
:: Run kwinject - to trace the SES Native Build, and capturing the build specification
%KW_TOOL_LOC%\kwinject --overwrite %UTIL_EMB% -echo -rebuild -config "Debug" nrf52832_Example.emProject
::
:: Run KwBuildProject
kwbuildproject --url http://%KW_SVRNAME%:%KW_SVRPORT%/%KW_PROJECT% -f -o kwtables kwinject.out
::
:: Pulbish Results to Klocwork Portal
kwadmin --url http://%KW_SVRNAME%:%KW_SVRPORT% load %KW_PROJECT% kwtables --name %DATE:~10,4%%DATE:~4,2%%DATE:~7,2%_%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%_%KW_VERSION%
::
endlocal
@echo on