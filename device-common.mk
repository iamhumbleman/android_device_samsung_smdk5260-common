#
# Copyright (C) 2014 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
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
#

LOCAL_PATH := device/samsung/smdk5260-common

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/samsung/smdk5260-common/smdk5260-common-vendor.mk)

# Dalvik VM specific for devices with 2048 MB of RAM
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# call Samsung LSI board support package
$(call inherit-product, hardware/samsung_slsi/exynos5/exynos5.mk)
$(call inherit-product, hardware/samsung_slsi/exynos5260/exynos5260.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/configs/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi
PRODUCT_AAPT_PREBUILT_DPI := xhdpi hdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Audio
 PRODUCT_PACKAGES += \
   audio.a2dp.default \
   audio.usb.default \
   audio.r_submix.default \
   audio.primary.default \
   libaudio-resampler \
   libtinyxml \
   audio.primary.universal5260 \
   libtinyalsa

 PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/configs/audio/audio_effects.conf:system/vendor/etc/audio_effects.conf \
   $(LOCAL_PATH)/configs/audio/ysound.xml:system/etc/ysound.xml
   #$(LOCAL_PATH)/configs/audio/audio_effects.xml:system/etc/audio/audio_effects.xml \
   $(LOCAL_PATH)/configs/audio/ysound.xml:system/etc/audio/ysound.xml \
   $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:system/etc/audio/audio_policy_configuration.xml

# Camera
PRODUCT_PACKAGES += \
    camera.universal5260

# Charger
#PRODUCT_PACKAGES += \
    charger \
    charger_res_images \
    cm_charger_res_images

# Filesystem
PRODUCT_PACKAGES += \
    setup_fs \
    make_ext4fs \
    e2fsck 

# GPU
PRODUCT_PACKAGES += \
   gralloc.exynos5 \
   libion \
   hwcomposer.exynos5 \
   memtrack.exynos5 \
   libstlport

# GPS IMH
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/configs/gps/gps.cer:system/bin/gps/gps.cer \
   $(LOCAL_PATH)/configs/gps/gps.conf:system/bin/gps/gps.conf \
   $(LOCAL_PATH)/configs/gps/gps.xml:system/bin/gps/gps.xml

PRODUCT_PACKAGES += \
   libdmitry

# Init scripts
PRODUCT_PACKAGES += \
   init.exynos.cam.sh

PRODUCT_PACKAGES += \
   fstab.universal5260 \
   init.universal5260.rc \
   init.universal5260.usb.rc \
   init.wifi.rc \
   ueventd.universal5260.rc# \
   init.target.rc

# Lights
 PRODUCT_PACKAGES += \
   lights.exynos5

# Mobicore
PRODUCT_PACKAGES += \
   mcDriverDaemon

# OMX
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/configs/media/media_codecs.xml:system/etc/media_codecs.xml \
   $(LOCAL_PATH)/configs/media/media_codecs_ffmpeg.xml:system/etc/media_codecs_ffmpeg.xml \
   frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
   frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
   frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# Audio codecs
PRODUCT_PACKAGES += \
   libOMX.Exynos.AAC.Decoder \
   libOMX.Exynos.MP3.Decoder \
   libOMX.Exynos.WMA.Encoder \
   libOMX.Exynos.VP8.Encoder
# Video codecs
PRODUCT_PACKAGES += \
   libOMX.Exynos.AVC.Decoder \
   libOMX.Exynos.MPEG4.Decoder \
   libOMX.Exynos.MPEG4.Encoder \
   libOMX.Exynos.VP8.Decoder \
   libOMX.Exynos.WMV.Decoder

# Stagefright and device specific modules
PRODUCT_PACKAGES += \
   libstagefrighthw \
   libExynosOMX_Core

# Permissions
 PRODUCT_COPY_FILES += \
   frameworks/native/data/etc/permissions/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
   frameworks/native/data/etc/permissions/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
   frameworks/native/data/etc/permissions/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
   frameworks/native/data/etc/permissions/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
   frameworks/native/data/etc/permissions/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
   frameworks/native/data/etc/permissions/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
   frameworks/native/data/etc/permissions/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
   frameworks/native/data/etc/permissions/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
   frameworks/native/data/etc/permissions/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
   frameworks/native/data/etc/permissions/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
   frameworks/native/data/etc/permissions/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
   frameworks/native/data/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
   frameworks/native/data/etc/permissions/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
   frameworks/native/data/etc/permissions/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
   frameworks/native/data/etc/permissions/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
   frameworks/native/data/etc/permissions/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
   frameworks/native/data/etc/permissions/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml \
   frameworks/native/data/etc/permissions/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
   frameworks/native/data/etc/permissions/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
   frameworks/native/data/etc/permissions/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
   frameworks/native/data/etc/permissions/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

 PRODUCT_PACKAGES += \
   power.exynos5

# RIL
PRODUCT_PACKAGES += \
   libril \
   librilutils \
   rild \
   libsecril-client \
   libxml2 \
   libprotobuf-cpp-full \
   libsecril-client-sap \
   modemloader

# Samsung Packages
PRODUCT_PACKAGES += \
   SamsungServiceMode \
   AdvancedDisplay

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
   persist.sys.usb.config=mtp

# USB Accesory
PRODUCT_PACKAGES += \
   com.android.future.usb.accessory

## WiFi
PRODUCT_PACKAGES += \
   macloader \
   hostapd \
   libwpa_client \
   wpa_supplicant

# external/wpa_supplicant_8/wpa_supplicant/wpa_supplicant_conf.mk
PRODUCT_PACKAGES += \
   wpa_supplicant.conf
#IHM
# Wifi / DHCPCD
#PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/configs/wifi/cred.conf:system/etc/wifi/cred.conf \
   $(LOCAL_PATH)/configs/wifi/nvram_mfg.txt:system/etc/wifi/nvram_mfg.txt \
   $(LOCAL_PATH)/configs/wifi/nvram_net.txt:system/etc/wifi/nvram_net.txt \
   $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
   $(LOCAL_PATH)/configs/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
   $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
   $(LOCAL_PATH)/configs/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
   $(LOCAL_PATH)/configs/dhcpcd/dhcpcd-run-hooks:system/etc/dhcpcd/dhcpcd-run-hooks \
   $(LOCAL_PATH)/configs/dhcpcd/dhcpcd-hooks/20-dns.conf:system/etc/dhcpcd/dhcpcd-hooks/20-dns.conf \
   $(LOCAL_PATH)/configs/dhcpcd/dhcpcd-hooks/95-configured:system/etc/dhcpcd/dhcpcd-hooks/95-configured

#kernel
 PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/kernel:kernel

# M2a3g
# Bluetooth
#PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# Properties OS universal 5260 common
-include $(LOCAL_PATH)/system.prop


# Display
#PRODUCT_PACKAGES += \
   libExynosHWCService \
   libfimg \
   libfimg2d_board
# ===

# DRM
 #PRODUCT_PACKAGES += \
   libdrmwvmplugin \
   libwvdrmengine \
   libwvdrm_L1 \
   libwvm \
   libWVStreamControlAPI_L1

# Keystore / sll_engine
 #PRODUCT_PACKAGES += \
   keystore.exynos5
# ===

# Keylayouts / keyboard
 #PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/configs/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl\
   $(LOCAL_PATH)/configs/keylayout/Generic.kl:system/usr/keylayout/Generic.kl\
   $(LOCAL_PATH)/configs/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl #\
   $(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
   $(LOCAL_PATH)/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl\
# ===

# Touchscreen
 #PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/configs/idc/ft5x06_ts.idc:system/usr/idc/ft5x06_ts.idc \
   $(LOCAL_PATH)/configs/idc/qwerty.idc:system/usr/idc/qwerty.idc \
   $(LOCAL_PATH)/configs/idc/qwerty2.idc:system/usr/idc/qwerty2.idc \
   $(LOCAL_PATH)/configs/idc/sec_keyboard.idc:system/usr/idc/sec_keyboard.idc \
   $(LOCAL_PATH)/configs/idc/Synaptics_HID_TouchPad.idc:system/usr/idc/Synaptics_HID_TouchPad.idc \
   $(LOCAL_PATH)/configs/keychars/Generic.kcm:system/usr/keychars/Generic.kcm \
   $(LOCAL_PATH)/configs/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
   $(LOCAL_PATH)/configs/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm \
   $(LOCAL_PATH)/configs/keychars/Virtual.kcm:system/usr/keychars/Virtual.kcm






# Bluetooth
#PRODUCT_PACKAGES += \
   bcm4334 \
   bcm4335 \
   BT_FW_VER_BCM4334B0_002.001.013.1792.1813_M2_3G_B52 \
   libbt-vendor

# NFC
 #PRODUCT_PACKAGES += \
   libpn547_fw \
   libpn547_fw_pku \
   libpn547_fw_platform

# Set default interface
  #OVERRIDES += \
   persist.sys.storage_preload=1 \
   persist.demo.hdmirotationlock=false \
   persist.sys.dalvik.vm.lib=libdvm.so


# Samsung
 #PRODUCT_PROPERTY_OVERRIDES += \
   ro.opengles.version=196608
# ==




# IHM
# egl
 #PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/configs/egl/egl.cfg:system/lib/egl/egl.cfg

# Video Telepony
 #PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/configs/videotelephony/MaskInfo_VT_ANIMATION_2014.conf:system/etc/videotelephony/MaskInfo_VT_ANIMATION_2014.conf




# Unknown inside vendor firmware
#PRODUCT_PACKAGES += \
   fimc_is_fw2 \
   mfc_fw \
   RS_M7MU \
   setfile_6b2 \
   setfile_imx175

#PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/configs/firmware/fimc_is_fw2.bin:system/vendor/firmware/fimc_is_fw2.bin \
   $(LOCAL_PATH)/configs/firmware/mfc_fw.bin:system/vendor/firmware/mfc_fw.bin \
   $(LOCAL_PATH)/configs/firmware/RS_M7MU.bin:system/vendor/firmware/RS_M7MU.bin \
   $(LOCAL_PATH)/configs/firmware/setfile_6b2.bin:system/vendor/firmware/setfile_6b2.bin \
   $(LOCAL_PATH)/configs/firmware/setfile_imx175.bin:system/vendor/firmware/setfile_imx175.bin

# Unknown inside vendor lib
 #PRODUCT_PACKAGES += \
   liblvverx_3.21.13 \
   liblvvetx_3.21.13 \
   libmalicore \
   liboemcrypto \
   libRSDriverArm

 #PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/configs/lib/libmalicore.bc:system/vendor/lib/libmalicore.bc

# Unknown inside vendor media
 #PRODUCT_PACKAGES += \
   LMspeed_508 \
   PFFprec_600

#PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/configs/media/LMspeed_508.emd:system/vendor/media/LMspeed_508.emd \
   $(LOCAL_PATH)/configs/media/PFFprec_600.emd:system/vendor/media/PFFprec_600.emd


# System.prop
#TARGET_SYSTEM_PROP += device/samsung/m2a3g/system.prop

# Properties OS universal 7580 common
#-include $(LOCAL_PATH)/system.prop



