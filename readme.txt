 编译
./mk.sh 3399
================================================================================
export ARCH=arm64
export CROSS_COMPILE=/home/hjc/prebuilts/gcc/linux-x86/aarch64/gcc-linaro-6.3.1-2017.05-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-
cp ~/work/develop/upstream/buildroot/output/images/rootfs.cpio.lz4 ./
make rockchip_linux_defconfig -j8
make Image -j8
make dtbs -j8
================================================================================

生成boot.img并烧写./mkboot.sh
================================================================================
cp arch/arm64/boot/Image boot/
cp arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dtb boot/
genext2fs -b 32768 -B $((32*1024*1024/32768)) -d boot/ -i 8192 -U boot_rk3399.img

upgrade_tool db MiniLoaderAll.bin
upgrade_tool wl 0x8000 boot_rk3399.img
upgrade_tool rd
===============================================================================


old:

默认配置： make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- multi_v7_defconfig
编译内核： make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- zImage
编译dtb：  make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- dtbs

aarch64:
make ARCH=arm64 CROSS_COMPILE=/home/hjc/work/develop/px30/linux_px30/prebuilts/gcc/linux-x86/aarch64/gcc-linaro-6.3.1-2017.05-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu- defconfig
make ARCH=arm64 CROSS_COMPILE=/home/hjc/work/develop/px30/linux_px30/prebuilts/gcc/linux-x86/aarch64/gcc-linaro-6.3.1-2017.05-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu- zImage -j32
make ARCH=arm64 CROSS_COMPILE=/home/hjc/work/develop/px30/linux_px30/prebuilts/gcc/linux-x86/aarch64/gcc-linaro-6.3.1-2017.05-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu- dtbs 
