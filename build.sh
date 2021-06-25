#!/bin/bash

# Sync source
mkdir nez
cd nez
repo init --depth=1 --no-repo-verify -u git://github.com//NezukoOS/manifest -b eleven -g default,-device,-mips,-darwin,-notdefault
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8
git clone https://github.com/Maitreya29/android_device_oneplus_cheeseburger.git device/oneplus/cheeseburger
git clone https://github.com/Maitreya29/android_device_oneplus_msm8998-common device/oneplus/msm8998-common
git clone https://github.com/Maitreya29/kernel_oneplus_msm8998.git kernel/oneplus/msm8998
git clone https://github.com/Maitreya29/vendor_oneplus.git vendor/oneplus
# Build
. build/envsetup.sh
lunch nezuko_cheeseburger-userdebug
mka bacon -j$(nproc --all)
