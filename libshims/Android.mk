#
# Copyright (C) 2017 LineageOS Project
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

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := libshim_ril.cpp libshim_wpa_supplicant.cpp libshim_gui.cpp libshim_wvm.cpp libshim_wvm2.cpp libshim_gps.cpp libshim_ui.cpp libshim_audio.cpp libshim_bionic.cpp xlog.c
LOCAL_C_INCLUDES += frameworks/av/media/mtp/ system/core/include/ frameworks/rs/server/ frameworks/av/include/ hardware/libhardware/include/ frameworks/av/
LOCAL_SHARED_LIBRARIES := libbinder libgui libutils liblog libandroid libui libstagefright_foundation libicuuc libmedia libcutils libc
LOCAL_MODULE := libshims
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)