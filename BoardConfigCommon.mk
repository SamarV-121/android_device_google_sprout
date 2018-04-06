COMMON_PATH := device/google/sprout-common

# Platform
TARGET_BOARD_PLATFORM := mt6582

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a7
TARGET_ARCH_VARIANT_CPU := cortex-a7
TARGET_CPU_SMP := true

# Disable memcpy opt (for audio libraries)
TARGET_CPU_MEMCPY_OPT_DISABLE := true

# Extensions
ARCH_ARM_HAVE_VFP := true
ARCH_ARM_HAVE_NEON := true

# Bootloader
TARGET_NO_BOOTLOADER := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(COMMON_PATH)/bluetooth

# Camera
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
USE_CAMERA_STUB := true

# Custom RIL Class
BOARD_RIL_CLASS := ../../../$(COMMON_PATH)/ril/

# Device Resolution
DEVICE_RESOLUTION := 480x854

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

# Filesystems
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
# TARGET_KERNEL_HAVE_EXFAT := true
# TARGET_KERNEL_HAVE_NTFS  := true
# Use mke2fs instead of make_ext4fs
TARGET_USES_MKE2FS := true

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# Kernel Stuff
TARGET_KERNEL_SOURCE := kernel/mediatek/sprout
TARGET_KERNEL_CONFIG := lineageos_sprout_defconfig
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x04000000 --tags_offset 0x00000100
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/arm/arm-eabi-4.8/bin
KERNEL_TOOLCHAIN_PREFIX := arm-eabi-

# Malloc
MALLOC_SVELTE := true

# MediaTek H/W Support
BOARD_USES_MTK_HARDWARE := true

# OpenGL
USE_OPENGL_RENDERER := true

# Storage Allocations
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00600000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 956964608
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2147483648
BOARD_CACHEIMAGE_PARTITION_SIZE := 134217728
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072

# Recovery
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/rootdir/fstab.sprout

# SELinux Policy
# BOARD_SEPOLICY_DIRS += device/google/sprout-common/sepolicy

# Symbols for Sprout
TARGET_LDPRELOAD += libsprout.so

# Common Properties
TARGET_SYSTEM_PROP := $(COMMON_PATH)/system.prop

# TWRP Stuff
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_INCLUDE_JB_CRYPTO := true
TW_CRYPTO_FS_TYPE := "ext4"
TW_CRYPTO_REAL_BLKDEV := "/dev/block/platform/mtk-msdc.0/by-name/userdata"
TW_CRYPTO_MNT_POINT := "/data"
TW_CRYPTO_FS_OPTIONS := "nosuid,nodev,noatime,discard,noauto_da_alloc,data=ordered"
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TW_NO_USB_STORAGE := true

# WiFi
BOARD_WLAN_DEVICE                := MediaTek
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM := "/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA := STA
WIFI_DRIVER_FW_PATH_AP := AP
WIFI_DRIVER_FW_PATH_P2P := P2P
WIFI_DRIVER_STATE_CTRL_PARAM := /dev/wmtWifi
WIFI_DRIVER_STATE_ON := 1
WIFI_DRIVER_STATE_OFF := 0
