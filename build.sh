#!/bin/bash

# Sync source

git config --global credential.helper cache
repo init -u https://github.com/Ancient-Roms/manifest -b eleven
repo sync -j32
