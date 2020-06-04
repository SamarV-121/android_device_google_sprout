LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
    bionic.cpp \
    ui.cpp \
    camera.cpp \
    buffer.cpp \
    gles.cpp

LOCAL_SHARED_LIBRARIES := libbinder libui libgui libcutils libutils libc liblog libstagefright_foundation
LOCAL_C_INCLUDES += frameworks/av/media/ndk/include
LOCAL_MODULE := libsprout
LOCAL_MODULE_TAGS := optional
LOCAL_PROPRIETARY_MODULE = true
include $(BUILD_SHARED_LIBRARY)