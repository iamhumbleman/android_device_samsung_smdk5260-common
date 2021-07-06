$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/smdk5260-common/smdk5260-common-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/smdk5260-common/overlay

LOCAL_PATH := device/samsung/smdk5260-common
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/make/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_m2a3g
PRODUCT_DEVICE := m2a3g

PRODUCT_PACKAGES += \
    fstab.universal5260 \
    init.universal5260.rc \
    init.universal5260.usb.rc \
    init.wifi.rc \
    ueventd.universal5260.rc
