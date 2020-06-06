LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    bionic.cpp \
    ui.cpp \
    camera.cpp \
    buffer.cpp \
    icu55.c

LOCAL_SHARED_LIBRARIES := libbinder libui libgui libcutils libutils libc liblog libstagefright_foundation libicuuc libicui18n
LOCAL_C_INCLUDES += frameworks/av/media/ndk/include
LOCAL_MODULE := libsprout
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
