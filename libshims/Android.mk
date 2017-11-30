LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := ril.cpp ui.cpp icu55.c wpa_supplicant.cpp # wvm.cpp
LOCAL_SHARED_LIBRARIES := libbinder libui libgui libicuuc # libmedia libstagefright_foundation
LOCAL_MODULE := libsprout
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)
