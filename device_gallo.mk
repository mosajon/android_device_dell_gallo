# Copyright (C) 2011 The Android Open Source Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_cn_supl.mk)

$(call inherit-product-if-exists, vendor/dell/gallo/gallo-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/dell/gallo/overlay

# Prebuilt kernel location
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/dell/gallo/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := cm_gallo
PRODUCT_DEVICE := gallo
PRODUCT_CHARACTERISTICS := tablet
   
# Files needed for boot image
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    $(LOCAL_PATH)/ramdisk/init.gallo.rc:root/init.gallo.rc \
    $(LOCAL_PATH)/ramdisk/init.gallo.usb.rc:root/init.gallo.usb.rc \
    $(LOCAL_PATH)/ramdisk/ueventd.gallo.rc:root/ueventd.gallo.rc \
    $(LOCAL_PATH)/ramdisk/fstab.gallo:root/fstab.gallo \


# Prebuilt configeration files
PRODUCT_COPY_FILES += \
    device/dell/gallo/bcm4329.hcd:/system/etc/firmware/bcm4329.hcd \
    device/dell/gallo/bcm4329.ko:system/lib/modules/bcm4329.ko \
    device/dell/gallo/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
    device/dell/gallo/vold.fstab:system/etc/vold.fstab \
    device/dell/gallo/nvram.txt:system/etc/nvram.txt \
    device/dell/gallo/nvram_a.txt:system/etc/wifi/nvram_a.txt \
    device/dell/gallo/atmel-maxtouch.idc:system/usr/idc/atmel-maxtouch.idc \
    device/dell/gallo/keychars/Generic.kcm:system/usr/keychars/Generic.kcm \
    device/dell/gallo/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
    device/dell/gallo/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm \
    device/dell/gallo/keychars/Virtual.kcm:system/usr/keychars/Virtual.kcm \
    device/dell/gallo/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/dell/gallo/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \
    device/dell/gallo/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    device/dell/gallo/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/dell/gallo/keylayout/Vendor_22b8_Product_093d.kl:system/usr/keylayout/Vendor_22b8_Product_093d.kl \
    device/dell/gallo/keylayout/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_028e.kl \
    device/dell/gallo/keylayout/Vendor_046d_Product_c216.kl:system/usr/keylayout/Vendor_046d_Product_c216.kl \
    device/dell/gallo/keylayout/Vendor_046d_Product_c294.kl:system/usr/keylayout/Vendor_046d_Product_c294.kl \
    device/dell/gallo/keylayout/Vendor_046d_Product_c299.kl:system/usr/keylayout/Vendor_046d_Product_c299.kl \
    device/dell/gallo/keylayout/Vendor_046d_Product_c532.kl:system/usr/keylayout/Vendor_046d_Product_c532.kl \
    device/dell/gallo/keylayout/Vendor_054c_Product_0268.kl:system/usr/keylayout/Vendor_054c_Product_0268.kl \
    device/dell/gallo/system/etc/panjit_touch.idc:system/usr/idc/panjit_touch.idc \
    device/dell/gallo/system/etc/init.d/91fixoverlays:system/etc/init.d/91fixoverlays \
    device/dell/gallo/system/bin/wifimacwriter:system/bin/wifimacwriter \
    device/dell/gallo/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf \

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml \

# Extra packages to build for this device
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory \
    audio.a2dp.default \
    audio.primary.gallo \
    libaudioutils \
    libtinyalsa \
    tinyplay \
    tinycap \
    tinymix \
    librs_jni \
    setup_fs \
    make_ext4fs \
    libinvensense_mpl \
    liba2dp \
    libasound \
    tinyrec \

#Wifi
PRODUCT_PACKAGES += \
    fw_bcm4329.bin \
    fw_bcm4329_apsta.bin \

# Propertys spacific for this device
PRODUCT_PROPERTY_OVERRIDES += \
    ro.wifi.country=CN \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=180 \
    ro.opengles.version=131072 \
    persist.sys.usb.config=mtp,adb \
    dalvik.vm.dexopt-flags=m=y\
    dalvik.vm.dexopt-data-only=1 \
