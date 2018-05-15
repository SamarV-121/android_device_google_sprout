LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
# /system/lib/librilmtk.so ( _ZN7android6Parcel13writeString16EPKtj )
LOCAL_SRC_FILES := ril.cpp
LOCAL_SHARED_LIBRARIES := libbinder
LOCAL_MODULE := libshim_ril
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
# /system/lib/libcam.utils.so ( _ZN7android13GraphicBufferC1Ejjij )
LOCAL_SRC_FILES := GraphicBuffer.cpp
LOCAL_SHARED_LIBRARIES := libui
LOCAL_MODULE := libshim_camera
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
# /system/lib/libmtkjpeg.so ( __pthread_gettid )
LOCAL_SRC_FILES := bionic.cpp
LOCAL_SHARED_LIBRARIES := libc
LOCAL_MODULE := libshim_bionic
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)
