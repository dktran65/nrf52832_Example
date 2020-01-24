@echo off
:: Setup the Toolchain
@set SEGGER_ARMTOOL_BASE=C:\SEGGER_EmbeddedStudio_for_ARM_4.30c\gcc\arm-none-eabi\bin
@set SESARM_CC1=%SEGGER_ARMTOOL_BASE%\cc1
@set SESARM_AS=%SEGGER_ARMTOOL_BASE%\as
@set SESARM_LD=%SEGGER_ARMTOOL_BASE%\ld
@Set SEGGER_BIN_DIR=C:\SEGGER_EmbeddedStudio_for_ARM_4.30c\bin
@Set UTIL_RM=::%SEGGER_BIN_DIR%\rm
@Set UTIL_MKLD=%SEGGER_BIN_DIR%\mkld
@Set UTIL_EMB=%SEGGER_BIN_DIR%\emBuild
::
:: Setup Project Location 
set PROJ=%CD%
::
:: Setup Cleanup Files
@Set OUT_DIR="Output"
@set DBG_DIR=%OUT_DIR%\"nrf52832_Example Debug\Obj"
@set EXE_DIR=%OUT_DIR%\"Debug\Exe"
::
:: Run Native Compiler to get the File Location
@cd %PROJ%
if exist %OUT_DIR% (@rmdir /Q/S %OUT_DIR%)
::
:: Performa Native Project Build
@%UTIL_EMB% -config "Debug" nrf52832_Example.emProject

:: Run Cleanup certain files, and leave the 
@del /Q/S/F %PROJ%\%EXE_DIR%\*.*
@del /Q/S/F %PROJ%\%DBG_DIR%\*.d
@del /Q/S/F %PROJ%\%DBG_DIR%\*.o
@del /Q/S/F %PROJ%\%DBG_DIR%\*.ld

:: Perform Project build using ARM-Tool Compiler...
:: Compiler and Assembler - Flags and Invocation
@set CC_CFILE_FLAGS=-fmessage-length=0 -fno-diagnostics-show-caret -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mthumb -mtp=soft -munaligned-access -nostdinc
@set CC_SFILE_FLAGS=-fmessage-length=0 -fno-diagnostics-show-caret -E -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mthumb -nostdinc
@set AS_FLAGS=--traditional-format -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mthumb
::  Include Files
@set CC_INC_SYSTEM=-isystemC:/SEGGER_EmbeddedStudio_for_ARM_4.30c/include
@set CC_INC_CMSIS=-IC:/SandboxProjects/nrf52832_Example/CMSIS_4/CMSIS/Include
@set CC_INC_DEVICE=-IC:/SandboxProjects/nrf52832_Example/nRF/CMSIS/Device/Include
@set CC_CONFIG_OPTIONS=-D__SIZEOF_WCHAR_T=4 -D__ARM_ARCH_7EM__ -D__SES_ARM -D__ARM_ARCH_FPV4_SP_D16__ -D__HEAP_SIZE__=256 -D__SES_VERSION=43003 -D__GNU_LINKER -DDEBUG -DNRF52832_XXAA -D__nRF_FAMILY -DARM_MATH_CM4 -DFLASH_PLACEMENT=1
@set CC_CONFIG2=-quiet -std=gnu99 -g3 -gpubnames -fomit-frame-pointer -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sections -fdata-sections -fshort-enums -fno-common
@set CC_CONFIG3=-mtext=.init -mrodata=.init_rodata
@set CC_CONFIG4=-quiet -lang-asm
@set AS_CONFIG_OPTIONS=-g -gdwarf-4
@set MKLD_CONFIG_OPTIONS=-check-segment-overflow -symbols __STACKSIZE__=256;__STACKSIZE_PROCESS__=0;__HEAPSIZE__=256
@set SESLD_CONFIG_OPTION=-X --omagic -eReset_Handler --defsym=__vfprintf=__vfprintf_int_nwp --defsym=__vfscanf=__vfscanf_int --fatal-warnings -EL --gc-sections
:: File Location
@set ASM_FILE_LOC="Output/nrf52832_Example Debug/Obj"
@set D_FILE_LOC=%ASM_FILE_LOC%
@set O_FILE_LOC=%ASM_FILE_LOC%
@set S_FILE_LOC=%ASM_FILE_LOC%
@set IND_FILE_LOC=%ASM_FILE_LOC%
@set LD_FILE_LOC=%ASM_FILE_LOC%
@set EXE_FILE_LOC="Output/Debug/Exe"

::
::del %PROJ%\%EXE_DIR%\*.*
%SESARM_CC1%  %CC_CFILE_FLAGS%  %CC_INC_SYSTEM%  %CC_INC_CMSIS% %CC_INC_DEVICE%  %CC_CONFIG_OPTIONS% -MD %D_FILE_LOC%/system_nrf52.d -MQ %O_FILE_LOC%/system_nrf52.o %CC_CONFIG2%  %CC_CONFIG3% "nRF\CMSIS\Device\Source"\system_nrf52.c -o %ASM_FILE_LOC%/system_nrf52.asm
%SESARM_AS% %AS_FLAGS%  %ASM_FILE_LOC%/system_nrf52.asm -o %ASM_FILE_LOC%/system_nrf52.o

%SESARM_CC1%   %CC_CFILE_FLAGS%   %CC_INC_SYSTEM% %CC_INC_CMSIS%  %CC_INC_DEVICE%  %CC_CONFIG_OPTIONS% -MD %D_FILE_LOC%/SEGGER_RTT.d -MQ %O_FILE_LOC%/SEGGER_RTT.o %CC_CONFIG2% SEGGER_RTT.c -o %ASM_FILE_LOC%/SEGGER_RTT.asm
%SESARM_AS%  %AS_FLAGS% %ASM_FILE_LOC%/SEGGER_RTT.asm -o %ASM_FILE_LOC%/SEGGER_RTT.o

%SESARM_CC1%  %CC_CFILE_FLAGS%  %CC_INC_SYSTEM%  %CC_INC_CMSIS% %CC_INC_DEVICE%  %CC_CONFIG_OPTIONS% -MD %D_FILE_LOC%/SEGGER_RTT_SES.d -MQ %O_FILE_LOC%/SEGGER_RTT_SES.o %CC_CONFIG2% SEGGER_RTT_SES.c -o %ASM_FILE_LOC%/SEGGER_RTT_SES.asm
%SESARM_AS%  %AS_FLAGS%  %ASM_FILE_LOC%/SEGGER_RTT_SES.asm -o %ASM_FILE_LOC%/SEGGER_RTT_SES.o

%SESARM_CC1% %CC_CFILE_FLAGS%  %CC_INC_SYSTEM%  %CC_INC_CMSIS%  %CC_INC_DEVICE%  %CC_CONFIG_OPTIONS% -MD %D_FILE_LOC%/main.d -MQ %O_FILE_LOC%/main.o %CC_CONFIG2% main.c -o %ASM_FILE_LOC%/main.asm
%SESARM_AS%   %AS_FLAGS% %ASM_FILE_LOC%/main.asm -o %ASM_FILE_LOC%/main.o

%SESARM_CC1%  %CC_SFILE_FLAGS%  %CC_INC_SYSTEM%  %CC_INC_CMSIS%  %CC_INC_DEVICE%  %CC_CONFIG_OPTIONS% -MD %D_FILE_LOC%/thumb_crt0.d -MQ %O_FILE_LOC%/thumb_crt0.o %CC_CONFIG4% thumb_crt0.s -o %S_FILE_LOC%/thumb_crt0_PP.s
%SESARM_AS% %AS_FLAGS%  %ASM_FILE_LOC%/thumb_crt0_PP.s -o %ASM_FILE_LOC%/thumb_crt0.o %AS_CONFIG_OPTIONS%

%SESARM_CC1%  %CC_SFILE_FLAGS%  %CC_INC_SYSTEM%  %CC_INC_CMSIS% %CC_INC_DEVICE%  %CC_CONFIG_OPTIONS% -MD %D_FILE_LOC%/ses_nRF_Startup.d -MQ %O_FILE_LOC%/ses_nRF_Startup.o %CC_CONFIG4% "nRF\Source"\ses_nRF_Startup.s -o %S_FILE_LOC%/ses_nRF_Startup_PP.s
%SESARM_AS%  %AS_FLAGS%  %ASM_FILE_LOC%/ses_nRF_Startup_PP.s -o %ASM_FILE_LOC%/ses_nRF_Startup.o %AS_CONFIG_OPTIONS%

%SESARM_CC1%   %CC_SFILE_FLAGS%   %CC_INC_SYSTEM%    %CC_INC_CMSIS% %CC_INC_DEVICE% %CC_CONFIG_OPTIONS% -MD %D_FILE_LOC%/ses_nrf52_Vectors.d -MQ %O_FILE_LOC%/ses_nrf52_Vectors.o %CC_CONFIG4% "nRF\Source"\ses_nrf52_Vectors.s -o %ASM_FILE_LOC%/ses_nrf52_Vectors_PP.s
%SESARM_AS%  %AS_FLAGS%  %ASM_FILE_LOC%/ses_nrf52_Vectors_PP.s -o %ASM_FILE_LOC%/ses_nrf52_Vectors.o %AS_CONFIG_OPTIONS%

%UTIL_MKLD% -memory-map-file nRF52832_xxAA_MemoryMap.xml -section-placement-file flash_placement.xml %MKLD_CONFIG_OPTIONS% %LD_FILE_LOC%/nrf52832_Example.ld
%SESARM_LD%  %SESLD_CONFIG_OPTION% -T%LD_FILE_LOC%/nrf52832_Example.ld -Map %EXE_FILE_LOC%/nrf52832_Example.map -u_vectors -o %EXE_FILE_LOC%/nrf52832_Example.elf --emit-relocs --start-group @%IND_FILE_LOC%/nrf52832_Example.ind --end-group