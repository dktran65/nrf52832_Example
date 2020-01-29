#!/bin/bash

## Setup KW Project and Server Location
KW_PROJECT=SES_nrf52832
KW_SVRNAME=hss-01
KW_SVRPORT=8080
KW_VERSION=Kw19v2
KW_TOOL_LOC=~/klocwork/server19.3/bin
## Setup Segger ARM Toolchain
UTIL_DIR=/usr/share/segger_embedded_studio_for_arm_4.42/bin
UTIL_EMB=$UTIL_DIR/emBuild
##
## Setup Project Location 
PROJDIR=$PWD
##
## Get Current Project Location, nad do clean up
cd $PWD
rm -rf Output
$UTIL_EMB -echo -clean -config "Debug" nrf52832_Example.emProject
##
## Run Native Build Project
$
$UTIL_EMB -echo -rebuild -config "Debug" nrf52832_Example.emProject
##
## Run kwinject - to trace the SES Native Build, and capturing the build specification
$KW_TOOL_LOC/kwinject --overwrite $UTIL_EMB -echo -rebuild -config "Debug" nrf52832_Example.emProject
##
## Run KwBuildProject
kwbuildproject --url http://$KW_SVRNAME:$KW_SVRPORT/$KW_PROJECT -f -o kwtables kwinject.out
##
## Pulbish Results to Klocwork Portal
kwadmin --url http://$KW_SVRNAME:$KW_SVRPORT load $KW_PROJECT kwtables