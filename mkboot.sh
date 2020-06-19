cp arch/arm64/boot/Image boot/
cp arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dtb boot/
genext2fs -b 32768 -B $((32*1024*1024/32768)) -d boot/ -i 8192 -U boot_rk3399.img
upgrade_tool db MiniLoaderAll.bin
upgrade_tool wl 0x8000 boot_rk3399.img
upgrade_tool rd
