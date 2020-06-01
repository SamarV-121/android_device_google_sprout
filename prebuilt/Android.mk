LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := SimpleKeyboard
LOCAL_SRC_FILES := priv-app/rkr.simplekeyboard.inputmethod_69.apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_MODULE_PATH := $(TARGET_OUT)/priv-app
LOCAL_OVERRIDES_PACKAGES := LatinIME Backgrounds BasicDreams Email Exchange2 LiveWallpaperPicker PhotoTable Updater AudioFX
include $(BUILD_PREBUILT)
