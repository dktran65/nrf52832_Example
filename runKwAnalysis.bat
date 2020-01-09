@echo off
:: Setup KW Project and Server Location
@set KW_PROJECT=SES_nrf52832
@set KW_SVRNAME=hss-01
@set KW_SVRPORT=8080
@set KW_VERSION=Kw19v2

@set KW_TOOL_LOC=C:\Klocwork\kwbuildtools\bin\
:: Run Cleanup and Klocwork Analysis
::
%KW_TOOL_LOC%\kwinject cmd /c build.bat
::
:: Run KwBuildProject
kwbuildproject --url http://%KW_SVRNAME%:%KW_SVRPORT%/%KW_PROJECT% -f -o kwtables kwinject.out
::
::
kwadmin --url http://%KW_SVRNAME%:%KW_SVRPORT% load %KW_PROJECT% kwtables --name %DATE:~10,4%%DATE:~4,2%%DATE:~7,2%_%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%_%KW_VERSION%
::
