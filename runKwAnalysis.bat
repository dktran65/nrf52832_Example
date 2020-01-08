:: Run Cleanup and Klocwork Analysis
::
C:\Klocwork\kwbuildtools\bin\kwinject cmd /c build.bat
::
:: Run KwBuildProject
kwbuildproject --url http://hss-01:8080/SES_nrf52832 -f -o kwtables kwinject.out
::
::
kwadmin --url http://hss-01:8080 load SES_nrf52832 kwtables
::
