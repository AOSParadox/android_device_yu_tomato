#
# Copyright (C) 2015 The AOSParadox Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
$(call inherit-product-if-exists, vendor/yu/tomato/tomato-vendor.mk)
$(call inherit-product-if-exists, vendor/camera/camera.mk)
$(call inherit-product-if-exists, vendor/volte/tomato/tomato-vendor.mk)
$(call inherit-product-if-exists, vendor/volte/volte.mk)

# Gapps
$(call inherit-product-if-exists, vendor/google/build/opengapps-packages.mk)
GAPPS_VARIANT := nano
GAPPS_FORCE_MATCHING_DPI := true

# Ramdisk
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/yu/tomato/ramdisk,root)

# Prebuilt
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/yu/tomato/prebuilt/system,system)

# CAF Branch
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.par.branch=LA.BR.1.2.9-01510-8x16.0

# Bootanimation
PRODUCT_COPY_FILES += \
    vendor/aosparadox/bootanimation/720p_PNG_bootanimation.zip:system/media/bootanimation.zip

# Dalvik/HWUI
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# CodeAurora msm8916_64 Tree
include device/qcom/msm8916_64/msm8916_64.mk

# Overlay
DEVICE_PACKAGE_OVERLAYS += device/yu/tomato/overlay
PRODUCT_PACKAGE_OVERLAYS += device/yu/tomato/overlay

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# ANT+
PRODUCT_PACKAGES += \
    AntHalService \
    com.dsi.ant.antradio_library \
    libantradio

# Bluetooth
PRODUCT_PACKAGES += \
    yl_btmac

# Camera
PRODUCT_PACKAGES += \
    libmm-qcamera

# Charger
PRODUCT_PACKAGES += \
    charger_res_images \
    cm_charger_res_images \
    font_log.png \
    libhealthd.cm

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.usb.id.midi=90BA \
    ro.usb.id.midi_adb=90BB \
    ro.usb.id.mtp=F003 \
    ro.usb.id.mtp_adb=9039 \
    ro.usb.id.ptp=904D \
    ro.usb.id.ptp_adb=904E \
    ro.usb.id.ums=F000 \
    ro.usb.id.ums_adb=9015 \
    ro.usb.vid=05c6

# Doze mode
PRODUCT_PACKAGES += \
    YUDoze

# GPS
PRODUCT_PACKAGES += \
    gps.msm8916

# IO Scheduler
PRODUCT_PROPERTY_OVERRIDES += \
    sys.io.scheduler=bfq

# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8916 \
    keystore.qcom

# Model
PRODUCT_PACKAGES += \
    ro.product.model=YUREKA

# Misc
PRODUCT_PACKAGES += \
    libtinyxml

# Power HAL
PRODUCT_PACKAGES += \
    power.msm8916 \
    power.qcom

# Sensors
PRODUCT_PACKAGES += \
    libjni_proximityCalibrate \
    ProximityCalibrate \
    sensors.msm8916

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Wifi
PRODUCT_PACKAGES += \
    libwpa_client \
    libwcnss_qmi \
    wcnss_service
