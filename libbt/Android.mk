ifeq ($(BOARD_HAVE_BLUETOOTH), true)
LOCAL_PATH := $(call my-dir)

###########################################################################
# MTK BT VENDOR DRIVER FOR BLUEDROID
###########################################################################
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	bt_drv.c

LOCAL_SHARED_LIBRARIES := \
	liblog \
	libbluetooth_mtk

LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE := libbt-vendor
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_OWNER := MTK
LOCAL_MULTILIB := 64
#LOCAL_PRELINK_MODULE := false

include $(BUILD_SHARED_LIBRARY)

endif
