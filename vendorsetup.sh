echo 'Starting to clone stuffs needed to build for garnet'

# Kernel Stuff
echo 'Cloning Kernel Stuff'
rm -rf kernel/xiaomi/sm7435 && git clone https://github.com/Lafactorial/android_kernel_xiaomi_sm7435.git -b lineage-23 kernel/xiaomi/sm7435
rm -rf kernel/xiaomi/sm7435-modules && git clone https://github.com/Lafactorial/android_kernel_xiaomi_sm7435-modules.git -b lineage-23.0 kernel/xiaomi/sm7435-modules
rm -rf kernel/xiaomi/sm7435-devicetrees && git clone https://github.com/Lafactorial/android_kernel_xiaomi_sm7435-devicetrees.git -b lineage-23.0 kernel/xiaomi/sm7435-devicetrees

# Camera Stuff
echo 'Cloning Camera Stuff'
rm -rf device/xiaomi/miuicamera-garnet && git clone https://codeberg.org/lafactorial/device_xiaomi_miuicamera-garnet.git -b lineage-22.2 device/xiaomi/miuicamera-garnet
rm -rf vendor/xiaomi/miuicamera-garnet && git clone https://codeberg.org/lafactorial/vendor_xiaomi_miuicamera-garnet.git -b lineage-22.2 vendor/xiaomi/miuicamera-garnet

echo 'Cloning process is completed, now its time for lunch'
