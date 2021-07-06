# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# inherit from common msm8974
# TODO: Don't Need This
#include device/samsung/m2a3g/BoardConfig.mk

LOCAL_PATH := device/samsung/smdk5260-common

BUILD_BROKEN_DUP_RULES := true

# Include path
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Firmware
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Platform
TARGET_BOARD_PLATFORM := exynos5
#TARGET_SLSI_VARIANT := bsp
TARGET_SOC := exynos5260
TARGET_BOARD_PLATFORM_GPU := mali-T624
TARGET_BOOTLOADER_BOARD_NAME := universal5260
BOARD_VENDOR := samsung

# Architecture target 1st arch CPU IMH
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

# Audio
#USE_XML_AUDIO_POLICY_CONF := 1

# Audio smdk5260
BOARD_USE_ALP_AUDIO := true
BOARD_USE_SEIREN_AUDIO := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true

# Kernel
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
#TARGET_KERNEL_SOURCE := kernel/samsung/m2a3g
#BOARD_CUSTOM_BOOTIMG_MK := device/samsung/m2a3g/mkbootimg.mk
#KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/arm/arm-eabi-4.8/bin
#KERNEL_TOOLCHAIN_PREFIX := arm-eabi-
BOARD_KERNEL_IMAGE_NAME := zImage
TARGET_PREBUILT_KERNEL := device/samsung/smdk5260-common/kernel

# Partitions / Filesystems by IMH
 BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
 BOARD_RECOVERYIMAGE_PARTITION_SIZE := 12582912
 BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2055208960
 BOARD_USERDATAIMAGE_PARTITION_SIZE := 5398069248
 BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
 BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

 # blockdev --getbsz /dev/block/mmcblk0p9
 BOARD_FLASH_BLOCK_SIZE := 131072    # ( BOARD_KERNEL_PAGESIZE * 64 BY AKLU ) IHM flash block size : 2048 12582912 
# Use these flags if the board has a ext4 partition larger than 2gb
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# Vendor separation
TARGET_COPY_OUT_VENDOR := system/vendor

# Bootanimation
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1280
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_CUSTOM_BT_CONFIG := device/samsung/smdk5260-common/bluetooth/libbt_vndcfg.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/smdk5260-common/bluetooth

# frameworks/native/services/surfaceflinger
# Android keeps 2 surface buffers at all time in case the hwcomposer
# misses the time to swap buffers (in cases where it takes 16ms or
# less). Use 3 to avoid timing issues.
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
# Graphics
BOARD_USES_EXYNOS5_COMMON_GRALLOC := true

# Wifi loader
BOARD_HAVE_SAMSUNG_WIFI := true

# Wifi
BOARD_WLAN_DEVICE                := bcmdhd
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
#WPA_SUPPLICANT_USE_HIDL          := true
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_AP           := "$(LOCAL_PATH)/configs/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_STA          := "$(LOCAL_PATH)/configs/wifi/bcmdhd_sta.bin"
#WIFI_BAND                        := 802_11_ABG

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_UMS_LUNFILE := "/sys/class/android_usb/android0/f_mass_storage/lun/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/exynos-dwc3.0/exynos-ss-udc.0/gadget/lun0/file"
BOARD_USES_MMCUTILS := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
BOARD_RECOVERY_SWIPE := true
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/etc/fstab.universal5260

# Properties
TARGET_SYSTEM_PROP += device/samsung/smdk5260-common/system.prop

# Wifi Macloader
BOARD_HAVE_SAMSUNG_WIFI := true

# Webkit
ENABLE_WEBGL := true

# WFD
BOARD_USES_WFD := true

# Radio
BOARD_MOBILEDATA_INTERFACE_NAME := "rmnet0"
BOARD_RIL_CLASS := ../../../device/samsung/smdk5260-common/ril

# Sensors
TARGET_NO_SENSOR_PERMISSION_CHECK := true

# HWCServices
BOARD_USES_HWC_SERVICES := true

# HDMI
BOARD_USES_OLD_HDMI := true

# Mixer
BOARD_USE_BGRA_8888_FB := true

# PowerHAL
TARGET_POWERHAL_VARIANT := samsung

# Exynos display
BOARD_USES_VIRTUAL_DISPLAY := true

# FIMG2D
BOARD_USES_SKIA_FIMGAPI := true

# SELinux
BOARD_SEPOLICY_DIRS := \
	device/samsung/smdk5260-common/sepolicy

# Samsung LSI OpenMAX
BOARD_USE_SAMSUNG_COLORFORMAT_NV21 := true

# Samsung OpenMAX Video
BOARD_USE_STOREMETADATA := true
BOARD_USE_METADATABUFFERTYPE := true
BOARD_USE_DMA_BUF := true
BOARD_USE_ANB_OUTBUF_SHARE := true
BOARD_USE_IMPROVED_BUFFER := true
BOARD_USE_NON_CACHED_GRAPHICBUFFER := true
BOARD_USE_GSC_RGB_ENCODER := true
BOARD_USE_CSC_HW := true
BOARD_USE_QOS_CTRL := false
BOARD_USE_S3D_SUPPORT := true
BOARD_USE_VP8ENC_SUPPORT := true
TARGET_OMX_LEGACY_RESCALING := true

# (G)SCALER
BOARD_USES_SCALER := true
BOARD_USES_DT := true
BOARD_USES_DT_SHORTNAME := true

# GPU
USE_OPENGL_RENDERER := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
#OVERRIDE_RS_DRIVER := libRSDriverArm.so

# CMHW
BOARD_HARDWARE_CLASS := device/samsung/smdk5260-common/lineagehw
BOARD_HARDWARE_CLASS := hardware/samsung/lineagehw

# Camera
BOARD_NEEDS_MEMORYHEAPION := true
BOARD_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK
BOARD_GLOBAL_CFLAGS += -DSAMSUNG_CAMERA_HARDWARE
BOARD_GLOBAL_CFLAGS += -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL
BOARD_GLOBAL_CFLAGS += -DSAMSUNG_DVFS
TARGET_HAS_LEGACY_CAMERA_HAL1 := true

# Camera: portrait orientation
#BOARD_CAMERA_FRONT_ROTATION := 270
#BOARD_CAMERA_BACK_ROTATION := 90

# Charger
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging
BOARD_CHARGER_SHOW_PERCENTAGE := true
RED_LED_PATH := "/sys/class/leds/led_r/brightness"
GREEN_LED_PATH := "/sys/class/leds/led_g/brightness"
BLUE_LED_PATH := "/sys/class/leds/led_b/brightness"
BACKLIGHT_PATH := "/sys/class/backlight/panel/brightness"
CHARGING_ENABLED_PATH := "/sys/class/power_supply/battery/batt_lp_charging"

# Force the screenshot path to CPU consumer (fix glitches & camera)
# Dont remove this !!!
TARGET_FORCE_SCREENSHOT_CPU_PATH := true


# M2a3g
# Assert
#TARGET_OTA_ASSERT_DEVICE := m2a3g,m2a3gxx

# RIL
#BOARD_MODEM_TYPE := xmm6262








