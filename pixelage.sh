#!/bin/bash

rm -rf device/xiaomi/chime
rm -rf kernel/xiaomi/chime
rm -rf vendor/xiaomi/chime
rm -rf hardware/xiaomi
rm -rf vendor/lineage-priv/keys

# Initialize ROM manifest
repo init -u https://github.com/ProjectPixelage/android_manifest.git -b 15 --git-lfs
# repo sync
/opt/crave/resync.sh
# cloning DT
# device tree
git clone https://github.com/nothing-sus-2/device_xiaomi_chime.git --depth 1 -b lineage-22 device/xiaomi/chime
# kernel tree
git clone https://github.com/Joe7500/kernel_xiaomi_chime.git --depth 1 -b ksu kernel/xiaomi/chime
# vendor tree
git clone https://github.com/Joe7500/vendor_xiaomi_chime.git --depth 1 -b lineage-22 vendor/xiaomi/chime
# hardware tree
git clone https://github.com/asterixiverz/hardware_xiaomi.git --depth 1 -b thirteen-aosp hardware/xiaomi

#signing
git clone https://github.com/Rv-Trees/vendor_lineage-priv_keys.git -b orion vendor/lineage-priv/keys

#lunch
export PIXELAGE_BUILD="chime"
build/envsetup.sh
lunch pixelage_chime-ap4a-userdebug
mka bacon