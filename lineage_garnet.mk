#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
TARGET_SUPPORTS_OMX_SERVICE := false
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from garnet device
$(call inherit-product, device/xiaomi/garnet/device.mk)

PRODUCT_NAME := lineage_garnet
PRODUCT_DEVICE := garnet
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := 2312DRA50G

PRODUCT_SYSTEM_NAME := garnet_global
PRODUCT_SYSTEM_DEVICE := garnet

# risingOS-Flags
WITH_GMS := true
PRODUCT_NO_CAMERA := true
TARGET_BOOT_ANIMATION_RES := 1080

# Maintainer stuff
RISING_MAINTAINER := HaKaN
PRODUCT_BUILD_PROP_OVERRIDES += \
    RisingMaintainer="HaKaN" \
    RisingChipset="Snapdragon 7s Gen 2"

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="garnet_global-user 15 AQ3A.240912.001 OS2.0.11.0.VNRMIXM release-keys" \
    BuildFingerprint=Redmi/garnet_global/garnet:15/AQ3A.240912.001/OS2.0.11.0.VNRMIXM:user/release-keys \
    DeviceName=$(PRODUCT_SYSTEM_DEVICE) \
    DeviceProduct=$(PRODUCT_SYSTEM_NAME)

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

TARGET_ENABLE_BLUR := true
