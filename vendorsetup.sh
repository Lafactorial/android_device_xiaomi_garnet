echo 'Starting to clone stuffs needed to build for garnet'

# Kernel Stuff
rm -rf kernel/xiaomi/sm7435 && git clone https://github.com/Lafactorial/android_kernel_xiaomi_sm7435.git -b lineage-23 kernel/xiaomi/sm7435
rm -rf kernel/xiaomi/sm7435-modules && git clone https://github.com/garnet-random/android_kernel_xiaomi_sm7435-modules.git -b lineage-22.2 kernel/xiaomi/sm7435-modules
rm -rf kernel/xiaomi/sm7435-devicetrees && git clone https://github.com/garnet-random/android_kernel_xiaomi_sm7435-devicetrees.git -b lineage-22.2 kernel/xiaomi/sm7435-devicetrees

# Camera Stuff
echo 'Cloning Camera Stuff'
rm -rf device/xiaomi/miuicamera-garnet && git clone https://codeberg.org/lafactorial/device_xiaomi_miuicamera-garnet.git -b lineage-22.2 device/xiaomi/miuicamera-garnet
rm -rf vendor/xiaomi/miuicamera-garnet && git clone https://codeberg.org/lafactorial/vendor_xiaomi_miuicamera-garnet.git -b lineage-22.2 vendor/xiaomi/miuicamera-garnet

# Agm
echo 'Cloning Agm'
rm -rf hardware/qcom-caf/sm8450/audio/agm && git clone https://github.com/LineageOS/android_vendor_qcom_opensource_agm -b lineage-22.2-caf-sm8450 hardware/qcom-caf/sm8450/audio/agm

# Graphservices
echo 'Cloning Graphservices'
rm -rf hardware/qcom-caf/sm8450/audio/graphservices && git clone https://github.com/LineageOS/android_vendor_qcom_opensource_audioreach-graphservices -b lineage-22.2-caf-sm8450 hardware/qcom-caf/sm8450/audio/graphservices

# Pal
echo 'Cloning Pal'
rm -rf hardware/qcom-caf/sm8450/audio/pal && git clone https://github.com/LineageOS/android_vendor_qcom_opensource_arpal-lx -b lineage-22.2-caf-sm8450 hardware/qcom-caf/sm8450/audio/pal

# Primary
echo 'Cloning Primary'
rm -rf hardware/qcom-caf/sm8450/audio/primary-hal && git clone https://github.com/LineageOS/android_hardware_qcom_audio-ar -b lineage-22.2-caf-sm8450 hardware/qcom-caf/sm8450/audio/primary-hal

# St-hal
echo 'Cloning St'
rm -rf vendor/qcom/opensource/audio-hal/st-hal-ar-legacy && git clone https://github.com/LineageOS/android_vendor_qcom_opensource_audio-hal_st-hal-ar -b lineage-22.2-legacy vendor/qcom/opensource/audio-hal/st-hal-ar-legacy
echo 'Cloning process is completed, now its time for lunch'