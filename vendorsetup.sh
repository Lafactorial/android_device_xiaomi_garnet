echo 'Starting to clone stuffs needed to build for garnet'

# Camera Stuff
echo 'Cloning Camera Stuff'
rm -rf device/xiaomi/miuicamera-garnet && git clone https://codeberg.org/lafactorial/device_xiaomi_miuicamera-garnet.git -b lineage-22.2 device/xiaomi/miuicamera-garnet
rm -rf vendor/xiaomi/miuicamera-garnet && git clone https://codeberg.org/lafactorial/vendor_xiaomi_miuicamera-garnet.git -b lineage-22.2 vendor/xiaomi/miuicamera-garnet

echo 'Cloning process is completed, now its time for lunch'
