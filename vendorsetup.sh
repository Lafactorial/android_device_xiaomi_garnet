echo 'Starting to clone stuffs needed to build for garnet'

# Kernel Stuff
echo 'Cloning Kernel Stuff'
rm -rf kernel/xiaomi/sm7435 && git clone https://github.com/Lafactorial/android_kernel_xiaomi_sm7435.git -b seventeen kernel/xiaomi/sm7435
rm -rf kernel/xiaomi/sm7435-modules && git clone https://github.com/Lafactorial/android_kernel_xiaomi_sm7435-modules.git -b seventeen kernel/xiaomi/sm7435-modules
rm -rf kernel/xiaomi/sm7435-devicetrees && git clone https://github.com/Lafactorial/android_kernel_xiaomi_sm7435-devicetrees.git -b seventeen kernel/xiaomi/sm7435-devicetrees
cd kernel/xiaomi/sm7435
git submodule update --init --recursive
cd ../../../

# Camera Stuff
echo 'Cloning Camera Stuff'
rm -rf device/xiaomi/garnet-miuicamera && git clone https://gitea.com/Lafactorial/android_device_xiaomi_garnet-miuicamera.git -b 17 device/xiaomi/garnet-miuicamera
rm -rf vendor/xiaomi/garnet-miuicamera && git clone https://gitea.com/Lafactorial/proprietary_vendor_xiaomi_garnet-miuicamera.git -b 17 vendor/xiaomi/garnet-miuicamera

# Signig Stuff
git clone https://github.com/Evolution-X/vendor_evolution-priv_keys-template vendor/evolution-priv/keys
cd vendor/evolution-priv/keys
./keys.sh
cd ../../../
echo 'Cloning process is completed, now its time for lunch'
