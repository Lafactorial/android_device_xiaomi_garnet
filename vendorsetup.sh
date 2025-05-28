echo 'Starting to clone stuffs needed to build for garnet'

# Camera Stuff
echo 'Cloning Camera Stuff'
rm -rf device/xiaomi/miuicamera-garnet && git clone https://codeberg.org/lafactorial/device_xiaomi_miuicamera-garnet.git -b lineage-22.2 device/xiaomi/miuicamera-garnet
rm -rf vendor/xiaomi/miuicamera-garnet && git clone https://codeberg.org/lafactorial/vendor_xiaomi_miuicamera-garnet.git -b lineage-22.2 vendor/xiaomi/miuicamera-garnet

# Graphservices
echo 'Cloning Graphservices'
rm -rf hardware/qcom-caf/sm8450/audio/graphservices && git clone https://github.com/stuff-garnet/android_vendor_qcom_opensource_audioreach-graphservices.git -b lineage-22.2-caf-sm8450 hardware/qcom-caf/sm8450/audio/graphservices

# Pal
echo 'Cloning Pal'
rm -rf hardware/qcom-caf/sm8450/audio/pal && git clone https://github.com/stuff-garnet/android_vendor_qcom_opensource_arpal-lx -b lineage-22.2-caf-sm8450 hardware/qcom-caf/sm8450/audio/pal

# Primary
echo 'Cloning Primary'
rm -rf hardware/qcom-caf/sm8450/audio/primary-hal && git clone https://github.com/stuff-garnet/android_hardware_qcom_audio-ar -b lineage-22.2-caf-sm8450 hardware/qcom-caf/sm8450/audio/primary-hal
echo 'Cloning process is completed, now its time for lunch'
