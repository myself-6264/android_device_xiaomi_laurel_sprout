# Define the local path to the device directory
LOCAL_PATH := device/xiaomi/laurel_sprout

# Copy the recovery fstab file to the output system
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/recovery.fstab:etc/recovery.fstab

# Define hardware platform
PRODUCT_PLATFORM := trinket

# Enable A/B updater support
AB_OTA_UPDATER := true

# Packages to include in the product
PRODUCT_PACKAGES += \
    update_engine \
    update_verifier \
    bootctrl.trinket

# Debug packages
PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# Enable update engine sideloading by including the static version of
# boot_control HAL and its dependencies
PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.trinket \
    libgptutils \
    libz \
    libcutils

# Boot control HAL implementations
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service

# Update engine sideload package
PRODUCT_PACKAGES += \
    update_engine_sideload

# Override properties for Treble and file-based encryption
PRODUCT_PROPERTY_OVERRIDES += \
    ro.treble.enabled=true \
    fbe.data.wrappedkey=true
