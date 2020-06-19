#!/bin/sh

#export CROSS_COMPILE=../prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-
#make rockchip_defconfig -j8 

if [ $1 = 3399 ];then
   echo "compile rk3399"
   export ARCH=arm64
   export CROSS_COMPILE=/home/hjc/prebuilts/gcc/linux-x86/aarch64/gcc-linaro-6.3.1-2017.05-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-
   
elif [ $1 = 3288 ];then
    echo "compile rk3288"
fi

if [ $2 = menuconfig ];then
    make menuconfig
elif [ $2 = savedefconfig ];then
    make savedefconfig
else
    cp ~/work/develop/upstream/buildroot/output/images/rootfs.cpio.lz4 ./
    make rockchip_linux_defconfig -j8
    make Image -j8
    make dtbs -j8
fi
#make ARCH=arm64 CROSS_COMPILE=/home/hjc/prebuilts/gcc/linux-x86/aarch64/gcc-linaro-6.3.1-2017.05-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-

#./resource_tool  arch/arm64/boot/dts/rockchip/$1.dtb
#./mkkrnlimg arch/arm64/boot/Image kernel.img
#./scripts/mkbootimg --kernel arch/arm64/boot/Image --second resource.img --ramdisk rootfs.cpio.gz -o boot.img
