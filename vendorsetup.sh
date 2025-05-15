echo 'Starting to clone stuffs needed to build for garnet'

# Agm
echo 'Cloning Agm'
rm -rf hardware/qcom-caf/sm8450/audio/agm && git clone https://github.com/xiaomi-sm8450-marble/android_vendor_qcom_opensource_agm -b 15 hardware/qcom-caf/sm8450/audio/agm

# Graphservices
echo 'Cloning Graphservices'
rm -rf hardware/qcom-caf/sm8450/audio/graphservices && git clone https://github.com/DqrKnzx/android_vendor_qcom_opensource_audioreach-graphservices hardware/qcom-caf/sm8450/audio/graphservices

# Pal
echo 'Cloning Pal'
rm -rf hardware/qcom-caf/sm8450/audio/pal && git clone https://github.com/xiaomi-sm8450-marble/android_vendor_qcom_opensource_arpal-lx -b 15 hardware/qcom-caf/sm8450/audio/pal
echo 'Cloning process is completed, now its time for lunch'
