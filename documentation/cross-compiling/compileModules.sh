#!/bin/bash

echo "remember to call me as source compileModules.sh"

export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=arm-eabi-
export PATH={PATH_TO_BINDERFILTER_PROJECT}/resources/libexec/gcc/arm-linux-androideabi/4.9.x-google:{PATH_TO_BINDERFILTER_PROJECT}/resources/arm-eabi-4.6/bin:$PATH
cd {PATH_TO_KERNEL_SOURCE_TREE}/msm/
#make flo_defconfig
#make prepare
#echo "CONFIG_MODULES=y" | cat >> .config
#echo "CONFIG_MODULE_FORCE_LOAD=y" | cat >> .config
#echo "CONFIG_MODULE_UNLOAD=y" | cat >> .config
#echo "CONFIG_MODULE_FORCE_UNLOAD=y" | cat >> .config
#echo "CONFIG_MODVERSIONS=y" | cat >> .config
#echo "CONFIG_ANDROID_BINDER_FILTER=y" | cat >> .config
#make modules_prepare
#make ARCH=arm CONFIG_HELLOWORLD=m M=drivers/helloworld
#make ARCH=arm CONFIG_ANDROID_BINDER_FILTER=m M=drivers/staging/android