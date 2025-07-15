#
# Copyright (C) 2017 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#

LOCAL_PATH := $(call my-dir)

# Copy the recovery.fstab from recovery/root/etc to the recovery's /etc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/etc/recovery.fstab:etc/recovery.fstab

# Hardware platform
PRODUCT_PLATFORM := trinket

# Enable A/B OTA support (if your device is A/B partitioned)
AB_OTA_UPDATER := true

# Packages to include in the build (add or remove as needed)
PRODUCT_PACKAGES += \
    update_engine \
    update_verifier \
    bootctrl.trinket

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# Enable static boot control HAL and dependencies for sideloading
PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.trinket \
    libgptutils \
    libz \
    libcutils

# Boot control HAL services
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service

# Additional packages
PRODUCT_PACKAGES += \
    update_engine_sideload

# Product properties overrides
PRODUCT_PROPERTY_OVERRIDES += \
    ro.treble.enabled=true \
    fbe.data.wrappedkey=true

# Include all makefiles under this directory
include $(call all-makefiles-under, $(LOCAL_PATH))
