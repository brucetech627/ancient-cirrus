#!/bin/bash

# Sync source

mkdir ok
cd ok
git config --global credential.helper cache
repo init -u https://github.com/Ancient-Roms/manifest -b eleven
repo sync -j32
git clone https://github.com/Maitreya29/android_device_oneplus_cheeseburger.git device/oneplus/cheeseburger
git clone https://github.com/Maitreya29/android_device_oneplus_msm8998-common device/oneplus/msm8998-common
git clone https://github.com/Maitreya29/kernel_oneplus_msm8998.git kernel/oneplus/msm8998
git clone https://github.com/Maitreya29/vendor_oneplus.git vendor/oneplus

# Build
source build/envsetup.sh
lunch nezuko_cheeseburger-userdebug
mka bacon -j16
