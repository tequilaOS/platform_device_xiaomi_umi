#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8250-common
include device/xiaomi/sm8250-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/lmi

BUILD_BROKEN_DUP_RULES := true

# Display
TARGET_SCREEN_DENSITY := 440

# Fingerprint
SOONG_CONFIG_XIAOMI_KONA_FOD_POS_X = 439
SOONG_CONFIG_XIAOMI_KONA_FOD_POS_Y = 1655
SOONG_CONFIG_XIAOMI_KONA_FOD_SIZE = 202

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_lmi
TARGET_RECOVERY_DEVICE_MODULES := libinit_lmi

# Kernel
TARGET_KERNEL_CONFIG := vendor/lmi_defconfig

# Inherit from the proprietary version
include vendor/xiaomi/lmi/BoardConfigVendor.mk
