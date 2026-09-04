echo 'Starting to clone stuffs needed to build for garnet'

# Kernel Stuff
echo 'Cloning Kernel Stuff'
rm -rf kernel/xiaomi/sm7435 && git clone https://github.com/Lafactorial/android_kernel_xiaomi_sm7435.git -b lineage-23.2-ksun kernel/xiaomi/sm7435
rm -rf kernel/xiaomi/sm7435-modules && git clone https://github.com/Lafactorial/android_kernel_xiaomi_sm7435-modules.git -b lineage-23.2 kernel/xiaomi/sm7435-modules
rm -rf kernel/xiaomi/sm7435-devicetrees && git clone https://github.com/Lafactorial/android_kernel_xiaomi_sm7435-devicetrees.git -b lineage-23.2 kernel/xiaomi/sm7435-devicetrees
cd kernel/xiaomi/sm7435
git submodule update --init --recursive
cd ../../../

# Signing Stuff
if [ ! -f "vendor/infinity-priv/keys/keys.mk" ]; then
    echo "Keys not found or incomplete. Setting up..."
    rm -rf vendor/infinity-priv/keys
    git clone --depth=1 https://github.com/ProjectInfinity-X/vendor_infinity-priv_keys-template vendor/infinity-priv/keys
    (
        cd vendor/infinity-priv/keys
        ./keys.sh
    )
else
    echo "Existing keys found — keeping them"
fi

# Camera Stuff
echo 'Cloning Camera Stuff'
rm -rf device/xiaomi/garnet-miuicamera && git clone https://gitea.com/lafactorial/android_device_xiaomi_garnet-miuicamera.git -b sixteen-qpr2 device/xiaomi/garnet-miuicamera
rm -rf vendor/xiaomi/garnet-miuicamera && git clone https://gitea.com/lafactorial/proprietary_vendor_xiaomi_garnet-miuicamera -b sixteen-qpr2 vendor/xiaomi/garnet-miuicamera
echo 'Cloning process is completed, now its time for lunch'
