#!/bin/bash

## Setup the Toolchain
UTIL_DIR=/usr/share/segger_embedded_studio_for_arm_4.42/bin
UTIL_EMB=$UTIL_DIR/emBuild
##
## Setup Project Location 
PROJ=$PWD
##
## Get Current Project Location, nad do clean up
cd $PWD
rm -rf Output
$UTIL_EMB -echo -clean -config "Debug" nrf52832_Example.emProject
##
## Run Native Build Project
$
$UTIL_EMB -echo -rebuild -config "Debug" nrf52832_Example.emProject


