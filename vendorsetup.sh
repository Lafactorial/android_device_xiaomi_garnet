echo 'Starting to clone stuffs needed to build for garnet'

# Kernel Stuff
echo 'Cloning Kernel Stuff'
rm -rf kernel/xiaomi/sm7435 && git clone https://github.com/Lafactorial/android_kernel_xiaomi_sm7435.git -b lineage-23.2-ksun kernel/xiaomi/sm7435
rm -rf kernel/xiaomi/sm7435-modules && git clone https://github.com/Lafactorial/android_kernel_xiaomi_sm7435-modules.git -b lineage-23.2 kernel/xiaomi/sm7435-modules
rm -rf kernel/xiaomi/sm7435-devicetrees && git clone https://github.com/Lafactorial/android_kernel_xiaomi_sm7435-devicetrees.git -b lineage-23.2 kernel/xiaomi/sm7435-devicetrees
cd kernel/xiaomi/sm7435
git submodule update --init --recursive
cd ../../../

# Camera Stuff
echo 'Cloning Camera Stuff'
rm -rf device/xiaomi/miuicamera-garnet && git clone https://gitea.com/lafactorial/android_device_xiaomi_garnet-miuicamera.git -b bp3a device/xiaomi/miuicamera-garnet
rm -rf vendor/xiaomi/miuicamera-garnet && git clone https://gitea.com/lafactorial/proprietary_vendor_xiaomi_garnet-miuicamera -b bp3a vendor/xiaomi/miuicamera-garnet

echo 'Cloning process is completed, now its time for lunch'
