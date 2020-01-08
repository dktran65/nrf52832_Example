set PROJ="C:\SandboxProjects\nrf52832_Example"
set DBGDIR="Output\nrf52832_Example Debug\Obj"
set EXEDIR="Output\Debug\Exe"
cd %PROJ%
del /Q/S/F %PROJ%\%EXEDIR%\*.*
del /Q/S/F %PROJ%\%DBGDIR%\*.d
del /Q/S/F %PROJ%\%DBGDIR%\*.o
del /Q/S/F %PROJ%\%DBGDIR%\*.ld

::del %PROJ%\%EXEDIR%\*.*
C:\SEGGER_EmbeddedStudio_for_ARM_4.30c\gcc\arm-none-eabi\bin\cc1 -fmessage-length=0 -fno-diagnostics-show-caret -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mthumb -mtp=soft -munaligned-access -nostdinc -isystemC:/SEGGER_EmbeddedStudio_for_ARM_4.30c/include "-isystemC:/Users/VMDEMO10/AppData/Local/SEGGER/SEGGER Embedded Studio/v3/packages/include" -IC:/SandboxProjects/nrf52832_Example/CMSIS_4/CMSIS/Include -IC:/SandboxProjects/nrf52832_Example/nRF/CMSIS/Device/Include -D__SIZEOF_WCHAR_T=4 -D__ARM_ARCH_7EM__ -D__SES_ARM -D__ARM_ARCH_FPV4_SP_D16__ -D__HEAP_SIZE__=256 -D__SES_VERSION=43003 -D__GNU_LINKER -DDEBUG -DNRF52832_XXAA -D__nRF_FAMILY -DARM_MATH_CM4 -DFLASH_PLACEMENT=1 -MD "C:/SandboxProjects/nrf52832_Example/Output/nrf52832_Example Debug/Obj/system_nrf52.d" -MQ "Output/nrf52832_Example Debug/Obj/system_nrf52.o" -quiet -std=gnu99 -g3 -gpubnames -fomit-frame-pointer -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sections -fdata-sections -mtext=.init -mrodata=.init_rodata -fshort-enums -fno-common C:\SandboxProjects\nrf52832_Example\nRF\CMSIS\Device\Source\system_nrf52.c -o "C:/SandboxProjects/nrf52832_Example/Output/nrf52832_Example Debug/Obj/system_nrf52.asm"
C:\SEGGER_EmbeddedStudio_for_ARM_4.30c\gcc\arm-none-eabi\bin\as --traditional-format -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mthumb "C:/SandboxProjects/nrf52832_Example/Output/nrf52832_Example Debug/Obj/system_nrf52.asm" -o "Output/nrf52832_Example Debug/Obj/system_nrf52.o"
C:\SEGGER_EmbeddedStudio_for_ARM_4.30c\bin\rm "C:/SandboxProjects/nrf52832_Example/Output/nrf52832_Example Debug/Obj/system_nrf52.asm"
C:\SEGGER_EmbeddedStudio_for_ARM_4.30c\gcc\arm-none-eabi\bin\cc1 -fmessage-length=0 -fno-diagnostics-show-caret -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mthumb -mtp=soft -munaligned-access -nostdinc -isystemC:/SEGGER_EmbeddedStudio_for_ARM_4.30c/include "-isystemC:/Users/VMDEMO10/AppData/Local/SEGGER/SEGGER Embedded Studio/v3/packages/include" -IC:/SandboxProjects/nrf52832_Example/CMSIS_4/CMSIS/Include -IC:/SandboxProjects/nrf52832_Example/nRF/CMSIS/Device/Include -D__SIZEOF_WCHAR_T=4 -D__ARM_ARCH_7EM__ -D__SES_ARM -D__ARM_ARCH_FPV4_SP_D16__ -D__HEAP_SIZE__=256 -D__SES_VERSION=43003 -D__GNU_LINKER -DDEBUG -DNRF52832_XXAA -D__nRF_FAMILY -DARM_MATH_CM4 -DFLASH_PLACEMENT=1 -MD "C:/SandboxProjects/nrf52832_Example/Output/nrf52832_Example Debug/Obj/SEGGER_RTT.d" -MQ "Output/nrf52832_Example Debug/Obj/SEGGER_RTT.o" -quiet -std=gnu99 -g3 -gpubnames -fomit-frame-pointer -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sections -fdata-sections -fshort-enums -fno-common C:\SandboxProjects\nrf52832_Example\SEGGER_RTT.c -o "C:/SandboxProjects/nrf52832_Example/Output/nrf52832_Example Debug/Obj/SEGGER_RTT.asm"
C:\SEGGER_EmbeddedStudio_for_ARM_4.30c\gcc\arm-none-eabi\bin\as --traditional-format -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mthumb "C:/SandboxProjects/nrf52832_Example/Output/nrf52832_Example Debug/Obj/SEGGER_RTT.asm" -o "Output/nrf52832_Example Debug/Obj/SEGGER_RTT.o"
C:\SEGGER_EmbeddedStudio_for_ARM_4.30c\bin\rm "C:/SandboxProjects/nrf52832_Example/Output/nrf52832_Example Debug/Obj/SEGGER_RTT.asm"
C:\SEGGER_EmbeddedStudio_for_ARM_4.30c\gcc\arm-none-eabi\bin\cc1 -fmessage-length=0 -fno-diagnostics-show-caret -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mthumb -mtp=soft -munaligned-access -nostdinc -isystemC:/SEGGER_EmbeddedStudio_for_ARM_4.30c/include "-isystemC:/Users/VMDEMO10/AppData/Local/SEGGER/SEGGER Embedded Studio/v3/packages/include" -IC:/SandboxProjects/nrf52832_Example/CMSIS_4/CMSIS/Include -IC:/SandboxProjects/nrf52832_Example/nRF/CMSIS/Device/Include -D__SIZEOF_WCHAR_T=4 -D__ARM_ARCH_7EM__ -D__SES_ARM -D__ARM_ARCH_FPV4_SP_D16__ -D__HEAP_SIZE__=256 -D__SES_VERSION=43003 -D__GNU_LINKER -DDEBUG -DNRF52832_XXAA -D__nRF_FAMILY -DARM_MATH_CM4 -DFLASH_PLACEMENT=1 -MD "C:/SandboxProjects/nrf52832_Example/Output/nrf52832_Example Debug/Obj/SEGGER_RTT_SES.d" -MQ "Output/nrf52832_Example Debug/Obj/SEGGER_RTT_SES.o" -quiet -std=gnu99 -g3 -gpubnames -fomit-frame-pointer -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sections -fdata-sections -fshort-enums -fno-common C:\SandboxProjects\nrf52832_Example\SEGGER_RTT_SES.c -o "C:/SandboxProjects/nrf52832_Example/Output/nrf52832_Example Debug/Obj/SEGGER_RTT_SES.asm"
C:\SEGGER_EmbeddedStudio_for_ARM_4.30c\gcc\arm-none-eabi\bin\as --traditional-format -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mthumb "C:/SandboxProjects/nrf52832_Example/Output/nrf52832_Example Debug/Obj/SEGGER_RTT_SES.asm" -o "Output/nrf52832_Example Debug/Obj/SEGGER_RTT_SES.o"
C:\SEGGER_EmbeddedStudio_for_ARM_4.30c\bin\rm "C:/SandboxProjects/nrf52832_Example/Output/nrf52832_Example Debug/Obj/SEGGER_RTT_SES.asm"
C:\SEGGER_EmbeddedStudio_for_ARM_4.30c\gcc\arm-none-eabi\bin\cc1 -fmessage-length=0 -fno-diagnostics-show-caret -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mthumb -mtp=soft -munaligned-access -nostdinc -isystemC:/SEGGER_EmbeddedStudio_for_ARM_4.30c/include "-isystemC:/Users/VMDEMO10/AppData/Local/SEGGER/SEGGER Embedded Studio/v3/packages/include" -IC:/SandboxProjects/nrf52832_Example/CMSIS_4/CMSIS/Include -IC:/SandboxProjects/nrf52832_Example/nRF/CMSIS/Device/Include -D__SIZEOF_WCHAR_T=4 -D__ARM_ARCH_7EM__ -D__SES_ARM -D__ARM_ARCH_FPV4_SP_D16__ -D__HEAP_SIZE__=256 -D__SES_VERSION=43003 -D__GNU_LINKER -DDEBUG -DNRF52832_XXAA -D__nRF_FAMILY -DARM_MATH_CM4 -DFLASH_PLACEMENT=1 -MD "C:/SandboxProjects/nrf52832_Example/Output/nrf52832_Example Debug/Obj/main.d" -MQ "Output/nrf52832_Example Debug/Obj/main.o" -quiet -std=gnu99 -g3 -gpubnames -fomit-frame-pointer -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sections -fdata-sections -fshort-enums -fno-common C:\SandboxProjects\nrf52832_Example\main.c -o "C:/SandboxProjects/nrf52832_Example/Output/nrf52832_Example Debug/Obj/main.asm"
C:\SEGGER_EmbeddedStudio_for_ARM_4.30c\gcc\arm-none-eabi\bin\as --traditional-format -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mthumb "C:/SandboxProjects/nrf52832_Example/Output/nrf52832_Example Debug/Obj/main.asm" -o "Output/nrf52832_Example Debug/Obj/main.o"
C:\SEGGER_EmbeddedStudio_for_ARM_4.30c\bin\rm "C:/SandboxProjects/nrf52832_Example/Output/nrf52832_Example Debug/Obj/main.asm"
C:\SEGGER_EmbeddedStudio_for_ARM_4.30c\gcc\arm-none-eabi\bin\cc1 -fmessage-length=0 -fno-diagnostics-show-caret -E -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mthumb -nostdinc -isystemC:/SEGGER_EmbeddedStudio_for_ARM_4.30c/include "-isystemC:/Users/VMDEMO10/AppData/Local/SEGGER/SEGGER Embedded Studio/v3/packages/include" -IC:/SandboxProjects/nrf52832_Example/CMSIS_4/CMSIS/Include -IC:/SandboxProjects/nrf52832_Example/nRF/CMSIS/Device/Include -D__SIZEOF_WCHAR_T=4 -D__ARM_ARCH_7EM__ -D__SES_ARM -D__ARM_ARCH_FPV4_SP_D16__ -D__HEAP_SIZE__=256 -D__SES_VERSION=43003 -D__GNU_LINKER -DDEBUG -DNRF52832_XXAA -D__nRF_FAMILY -DARM_MATH_CM4 -DFLASH_PLACEMENT=1 -MD "C:/SandboxProjects/nrf52832_Example/Output/nrf52832_Example Debug/Obj/thumb_crt0.d" -MQ "Output/nrf52832_Example Debug/Obj/thumb_crt0.o" -quiet -lang-asm C:\SandboxProjects\nrf52832_Example\thumb_crt0.s -o "C:/SandboxProjects/nrf52832_Example/Output/nrf52832_Example Debug/Obj/thumb_crt0_PP.s"
C:\SEGGER_EmbeddedStudio_for_ARM_4.30c\gcc\arm-none-eabi\bin\as --traditional-format -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mthumb "C:/SandboxProjects/nrf52832_Example/Output/nrf52832_Example Debug/Obj/thumb_crt0_PP.s" -o "Output/nrf52832_Example Debug/Obj/thumb_crt0.o" -g -gdwarf-4
C:\SEGGER_EmbeddedStudio_for_ARM_4.30c\bin\rm "C:/SandboxProjects/nrf52832_Example/Output/nrf52832_Example Debug/Obj/thumb_crt0_PP.s"
C:\SEGGER_EmbeddedStudio_for_ARM_4.30c\gcc\arm-none-eabi\bin\cc1 -fmessage-length=0 -fno-diagnostics-show-caret -E -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mthumb -nostdinc -isystemC:/SEGGER_EmbeddedStudio_for_ARM_4.30c/include "-isystemC:/Users/VMDEMO10/AppData/Local/SEGGER/SEGGER Embedded Studio/v3/packages/include" -IC:/SandboxProjects/nrf52832_Example/CMSIS_4/CMSIS/Include -IC:/SandboxProjects/nrf52832_Example/nRF/CMSIS/Device/Include -D__SIZEOF_WCHAR_T=4 -D__ARM_ARCH_7EM__ -D__SES_ARM -D__ARM_ARCH_FPV4_SP_D16__ -D__HEAP_SIZE__=256 -D__SES_VERSION=43003 -D__GNU_LINKER -DDEBUG -DNRF52832_XXAA -D__nRF_FAMILY -DARM_MATH_CM4 -DFLASH_PLACEMENT=1 -MD "C:/SandboxProjects/nrf52832_Example/Output/nrf52832_Example Debug/Obj/ses_nRF_Startup.d" -MQ "Output/nrf52832_Example Debug/Obj/ses_nRF_Startup.o" -quiet -lang-asm C:\SandboxProjects\nrf52832_Example\nRF\Source\ses_nRF_Startup.s -o "C:/SandboxProjects/nrf52832_Example/Output/nrf52832_Example Debug/Obj/ses_nRF_Startup_PP.s"
C:\SEGGER_EmbeddedStudio_for_ARM_4.30c\gcc\arm-none-eabi\bin\as --traditional-format -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mthumb "C:/SandboxProjects/nrf52832_Example/Output/nrf52832_Example Debug/Obj/ses_nRF_Startup_PP.s" -o "Output/nrf52832_Example Debug/Obj/ses_nRF_Startup.o" -g -gdwarf-4
C:\SEGGER_EmbeddedStudio_for_ARM_4.30c\bin\rm "C:/SandboxProjects/nrf52832_Example/Output/nrf52832_Example Debug/Obj/ses_nRF_Startup_PP.s"
C:\SEGGER_EmbeddedStudio_for_ARM_4.30c\gcc\arm-none-eabi\bin\cc1 -fmessage-length=0 -fno-diagnostics-show-caret -E -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mthumb -nostdinc -isystemC:/SEGGER_EmbeddedStudio_for_ARM_4.30c/include "-isystemC:/Users/VMDEMO10/AppData/Local/SEGGER/SEGGER Embedded Studio/v3/packages/include" -IC:/SandboxProjects/nrf52832_Example/CMSIS_4/CMSIS/Include -IC:/SandboxProjects/nrf52832_Example/nRF/CMSIS/Device/Include -D__SIZEOF_WCHAR_T=4 -D__ARM_ARCH_7EM__ -D__SES_ARM -D__ARM_ARCH_FPV4_SP_D16__ -D__HEAP_SIZE__=256 -D__SES_VERSION=43003 -D__GNU_LINKER -DDEBUG -DNRF52832_XXAA -D__nRF_FAMILY -DARM_MATH_CM4 -DFLASH_PLACEMENT=1 -MD "C:/SandboxProjects/nrf52832_Example/Output/nrf52832_Example Debug/Obj/ses_nrf52_Vectors.d" -MQ "Output/nrf52832_Example Debug/Obj/ses_nrf52_Vectors.o" -quiet -lang-asm C:\SandboxProjects\nrf52832_Example\nRF\Source\ses_nrf52_Vectors.s -o "C:/SandboxProjects/nrf52832_Example/Output/nrf52832_Example Debug/Obj/ses_nrf52_Vectors_PP.s"
C:\SEGGER_EmbeddedStudio_for_ARM_4.30c\gcc\arm-none-eabi\bin\as --traditional-format -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mthumb "C:/SandboxProjects/nrf52832_Example/Output/nrf52832_Example Debug/Obj/ses_nrf52_Vectors_PP.s" -o "Output/nrf52832_Example Debug/Obj/ses_nrf52_Vectors.o" -g -gdwarf-4
C:\SEGGER_EmbeddedStudio_for_ARM_4.30c\bin\rm "C:/SandboxProjects/nrf52832_Example/Output/nrf52832_Example Debug/Obj/ses_nrf52_Vectors_PP.s"
C:\SEGGER_EmbeddedStudio_for_ARM_4.30c\bin\mkld -memory-map-file C:/SandboxProjects/nrf52832_Example/nRF52832_xxAA_MemoryMap.xml -section-placement-file C:/SandboxProjects/nrf52832_Example/flash_placement.xml -check-segment-overflow -symbols __STACKSIZE__=256;__STACKSIZE_PROCESS__=0;__HEAPSIZE__=256 "C:/SandboxProjects/nrf52832_Example/Output/nrf52832_Example Debug/Obj/nrf52832_Example.ld"
C:\SEGGER_EmbeddedStudio_for_ARM_4.30c\gcc\arm-none-eabi\bin\ld -X --omagic -eReset_Handler --defsym=__vfprintf=__vfprintf_int_nwp --defsym=__vfscanf=__vfscanf_int --fatal-warnings -EL --gc-sections "-TC:/SandboxProjects/nrf52832_Example/Output/nrf52832_Example Debug/Obj/nrf52832_Example.ld" -Map Output/Debug/Exe/nrf52832_Example.map -u_vectors -o Output/Debug/Exe/nrf52832_Example.elf --emit-relocs --start-group "@C:/SandboxProjects/nrf52832_Example/Output/nrf52832_Example Debug/Obj/nrf52832_Example.ind" --end-group