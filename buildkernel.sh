#!/bin/sh

restore='\033[0m'
KERNEL_DIR=$PWD
KERN_IMG=$KERNEL_DIR/arch/arm64/boot/Image.gz-dtb
blue='\033[0;34m'

export ARCH=arm64
export SUBARCH=arm64

echo "${blue}"
echo "***********************************************"
echo "          Cleaning Up Before Compile          "
echo "***********************************************"
rm -f $KERN_IMG
rm -f $KERNEL_DIR/arch/arm64/boot/Image.gz
rm -f $KERNEL_DIR/arch/arm64/boot/Image
rm -f $KERNEL_DIR/output/Image.gz-dtb
rm -f $KERNEL_DIR/output/Image.gz
$clean make clean && make mrproper
echo "***********************************************"
echo "            Compiling HermesKernel             "
echo "***********************************************$nocol"
make hermes_defconfig
make -j8
cp arch/arm64/boot/Image.gz-dtb output/Image.gz-dtb
cp arch/arm64/boot/Image.gz output/Image.gz
echo "Compiled kernel is in the output folder"
