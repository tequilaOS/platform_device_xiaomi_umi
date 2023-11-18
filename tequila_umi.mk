#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from umi device
$(call inherit-product, device/xiaomi/umi/device.mk)

# Inherit some common tequila stuff.
$(call inherit-product, vendor/tequila/config/common_full_phone.mk)

PRODUCT_NAME := tequila_umi
PRODUCT_DEVICE := umi
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Mi 10

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="umi-user 12 RKQ1.211001.001 V13.0.8.0.SJBCNXM release-keys"

BUILD_FINGERPRINT := Xiaomi/umi/umi:12/RKQ1.211001.001/V13.0.8.0.SJBCNXM:user/release-keys
