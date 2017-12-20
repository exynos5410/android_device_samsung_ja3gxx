#
# Copyright (C) 2013 The CyanogenMod Project
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
#

LOCAL_PATH := device/samsung/ja3gxx

# overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.universal5410 \
    init.target.rc \
    ueventd.universal5410.rc

# Audio
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/audio/mixer_paths.xml:system/etc/mixer_paths_0.xml

PRODUCT_PACKAGES += \
    AudioWorkaround \
    audio.primary.universal5410

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps.cer:system/etc/gps.cer \
    $(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/configs/gps.xml:system/etc/gps.xml

PRODUCT_PACKAGES += \
    libdmitry

# Radio (audio-dependency)
PRODUCT_PACKAGES += \
    libsecril-client \
    libsecril-client-sap

# Radio (RIL)
PRODUCT_PACKAGES += \
    libxml2 \
    libprotobuf-cpp-full \
    modemloader

PRODUCT_PROPERTY_OVERRIDES += \
    ro.carrier=unknown

# call the proprietary setup
$(call inherit-product, vendor/samsung/ja3gxx/ja3gxx-vendor.mk)
