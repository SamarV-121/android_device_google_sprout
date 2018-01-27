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

# GPS
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/configs/agps_profiles_conf2.xml:system/etc/agps_profiles_conf2.xml \

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.manual_sensor.xml:system/etc/permissions/android.hardware.camera.manual_sensor.xml \
    frameworks/native/data/etc/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Thermal
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/configs/thermal.conf:system/etc/.tp/thermal.conf
     $(LOCAL_PATH)/configs/.ht120.mtc:system/etc/.tp/.ht120.mtc
     $(LOCAL_PATH)/configs/thermal.off.conf:system/etc/.tp/thermal.off.conf

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl \

PRODUCT_TAGS += dalvik.gc.type-precise

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.sprout_common.rc:root/init.sprout_common.rc \
    $(LOCAL_PATH)/rootdir/sbin/multi_init:root/sbin/multi_init \
    $(LOCAL_PATH)/rootdir/init.protect.rc:root/init.protect.rc \
    $(LOCAL_PATH)/rootdir/init.modem.rc:root/init.modem.rc \
    $(LOCAL_PATH)/rootdir/factory_init.rc:root/factory_init.rc \
    $(LOCAL_PATH)/rootdir/ueventd.sprout.rc:root/ueventd.sprout.rc \
    $(LOCAL_PATH)/rootdir/init.sprout.usb.rc:root/init.sprout.usb.rc \

# Symbols for Sprout
PRODUCT_PACKAGES += \
    libsprout

# Doze
PRODUCT_PACKAGES += \
    Doze

# Correct bootanimation size for the screen
TARGET_SCREEN_HEIGHT := 854
TARGET_SCREEN_WIDTH := 480

# TWRP
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/twrp.fstab:recovery/root/etc/twrp.fstab

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudio-resampler \
    tinymix

# FM Radio
PRODUCT_PACKAGES += \
    FMRadioGoogle \
    FmRadioTrampoline2

# Wifi
 PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \

# USB
PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images \
    libnl_2 \
    libtinyxml

PRODUCT_PACKAGES += \
    setup_fs \
    e2fsck \

PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# call the proprietary setup
$(call inherit-product, vendor/google/sprout/sprout-vendor.mk)

ifeq ($(WITH_MICROG),true)
$(call inherit-product, $(LOCAL_PATH)/microG.mk)
endif

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# Dynamically set props
PRODUCT_SYSTEM_PROPERTY_BLACKLIST := \
    ro.product.name \
    ro.product.manufacturer \
    ro.product.model

PRODUCT_DEFAULT_PROPERTY_OVERRIDES := \
	ro.crypto.state=unencrypted \
	ro.mount.fs=EXT4 \
	ro.secure=0 \
        ro.adb.secure=0 \
	ro.allow.mock.location=0 \
	ro.debuggable=1 \
	ro.zygote=zygote32 \
	dalvik.vm.dex2oat-Xms=64m \
	dalvik.vm.dex2oat-Xmx=512m \
	dalvik.vm.image-dex2oat-Xms=64m \
	dalvik.vm.image-dex2oat-Xmx=64m \
	ro.dalvik.vm.native.bridge=0 \
	ro.hardware=sprout \
	ro.telephony.ril_class=SproutRIL \
        camera.disable_zsl_mode=1

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    pm.dexopt.first-boot=verify-at-runtime \
    pm.dexopt.boot=verify-at-runtime \
    pm.dexopt.install=interpret-only \
    pm.dexopt.bg-dexopt=speed-profile \
    pm.dexopt.ab-ota=speed-profile \
    pm.dexopt.nsys-library=speed \
    pm.dexopt.shared-apk=speed \
    pm.dexopt.forced-dexopt=speed \
    pm.dexopt.core-app=speed

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-filter=speed \
    dalvik.vm.dex2oat-swap=false
