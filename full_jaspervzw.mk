# Copyright (C) 2011 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for maguro hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, full and maguro, hence its name.
#
 
PRODUCT_PACKAGES := \
    Stk \
    Torch

PRODUCT_COPY_FILES := \
    device/samsung/jaspervzw/apns-conf.xml:system/etc/apns-conf.xml

# KEXEC-specific options
ifeq ($(USE_KEXEC),1)
PRODUCT_PACKAGES += \
    kexec \
    kexec-boot.zip \
    hijack.sh
endif

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
# Inherit from jaspervzw device
$(call inherit-product, device/samsung/jaspervzw/device.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := full_jaspervzw
PRODUCT_DEVICE := jaspervzw
PRODUCT_BRAND := Verizon
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := SCH-I200

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

## The gps config appropriate for this device
PRODUCT_COPY_FILES += device/common/gps/gps.conf_US_SUPL:system/etc/gps.conf

## (2) Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/jaspervzw/jaspervzw-common-vendor.mk)

## overlays
DEVICE_PACKAGE_OVERLAYS += device/samsung/jaspervzw/overlay

# Device uses high-density artwork where available
#PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
#PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# Audio configuration
PRODUCT_COPY_FILES += \
	device/samsung/jaspervzw/audio/snd_soc_msm_2x:system/etc/snd_soc_msm/snd_soc_msm_2x \
	device/samsung/jaspervzw/audio/audio_policy.conf:system/etc/audio_policy.conf

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    initlogo.rle \
    init.bt.rc \
    init.qcom.rc \
    init.qcom.usb.rc \
    init.target.rc \
    ueventd.rc

# Torch
PRODUCT_PACKAGES += Torch

# Vold configuration
PRODUCT_COPY_FILES += \
    device/samsung/jaspervzw/vold.fstab:system/etc/vold.fstab

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Lights
PRODUCT_PACKAGES += lights.msm8960

# Increase the HWUI font cache since we have tons of RAM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.text_cache_width=2048

# QC Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=/system/lib/libqc-opt.so

# QRNGD
PRODUCT_PACKAGES += qrngd

# common msm8960
$(call inherit-product, device/samsung/msm8960-common/msm8960.mk)

#$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
