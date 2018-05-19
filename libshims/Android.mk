LOCAL_PATH := $(call my-dir)

# /system/lib/librilmtk.so ( _ZN7android6Parcel13writeString16EPKtj )
include $(CLEAR_VARS)
LOCAL_SRC_FILES := ril.cpp
LOCAL_SHARED_LIBRARIES := libbinder
LOCAL_MODULE := libshim_ril
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

# /system/bin/wpa_supplicant ( SSL_CTX_ctrl )
include $(CLEAR_VARS)
LOCAL_SRC_FILES := wpa_supplicant.cpp
LOCAL_SHARED_LIBRARIES := libbinder
LOCAL_MODULE := libshim_wpa
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

# /system/lib/libcam.utils.so ( _ZN7android13GraphicBufferC1Ejjij )
include $(CLEAR_VARS)
LOCAL_SRC_FILES := GraphicBuffer.cpp
LOCAL_SHARED_LIBRARIES := libui
LOCAL_MODULE := libshim_camera
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

# /system/bin/mtk_agpsd ( UCNV_FROM_U_CALLBACK_STOP_55 )
include $(CLEAR_VARS)
LOCAL_SRC_FILES := icu55.c
LOCAL_SHARED_LIBRARIES := libicuuc
LOCAL_MODULE := libshim_
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

# /system/lib/libmtkjpeg.so ( __pthread_gettid )
include $(CLEAR_VARS)
LOCAL_SRC_FILES := bionic.cpp
LOCAL_SHARED_LIBRARIES := libc
LOCAL_MODULE := libshim_bionic
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

# /system/vendor/lib/libwvm.so ( _ZN7android16MediaBufferGroupC1Ev , _ZNK7android11MediaSource11ReadOptions9getSeekToEPxPNS1_8SeekModeE , _ZNK7android11MediaSource11ReadOptions14getNonBlockingEv , _ZN7android16MediaBufferGroup14acquire_bufferEPPNS_11MediaBufferEb
include $(CLEAR_VARS)
LOCAL_SRC_FILES := wvm.cpp
LOCAL_SHARED_LIBRARIES := libmedia libstagefright_foundation
LOCAL_MODULE := libshim_wvm
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

