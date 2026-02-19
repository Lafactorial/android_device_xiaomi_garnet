#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
TARGET_SUPPORTS_OMX_SERVICE := false
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common infinity stuff.
$(call inherit-product, vendor/infinity/config/common_full_phone.mk)

# Inherit from garnet device
$(call inherit-product, device/xiaomi/garnet/device.mk)

PRODUCT_NAME := infinity_garnet
PRODUCT_DEVICE := garnet
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := 2312DRA50G

PRODUCT_SYSTEM_NAME := garnet_global
PRODUCT_SYSTEM_DEVICE := garnet

TARGET_BOOT_ANIMATION_RES := 1080

# UDFPS Flags
EXTRA_UDFPS_ANIMATIONS := true

# Extra Flags
TARGET_SUPPORTS_QUICK_TAP := true

# InfinityX Flags
INFINITY_BUILD_TYPE := UNOFFICIAL
INFINITY_MAINTAINER := HaKaN
TARGET_SUPPORTS_BLUR := true

# Gapps
WITH_GAPPS := true

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="garnet_global-user 16 BP2A.250605.031.A3 OS3.0.5.0.WNRMIXM release-keys" \
    BuildFingerprint=Redmi/garnet_global/garnet:16/BP2A.250605.031.A3/OS3.0.5.0.WNRMIXM:user/release-keys \
    DeviceName=$(PRODUCT_SYSTEM_DEVICE) \
    DeviceProduct=$(PRODUCT_SYSTEM_NAME)

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

TARGET_ENABLE_BLUR := true
