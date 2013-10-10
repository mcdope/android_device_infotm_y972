# config.mk
#
# Product-specific compile-time definitions.
#

# The generic product target doesn't have any hardware-specific pieces.
TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := false
TARGET_KERNEL_SOURCE := "bootable/linux-3.0.8"

#BOARD_HAVE_BLUETOOTH := true
#BOARD_HAVE_BLUETOOTH_BCM := true

# kernel config without _defconfig
TARGET_KERNEL_CONFIG := imapx820

TARGET_BOARD_PLATFORM := imapx800

# Note: we build the platform images for ARMv7-A _without_ NEON.
#
# Technically, the emulator supports ARMv7-A _and_ NEON instructions, but
# emulated NEON code paths typically ends up 2x slower than the normal C code
# it is supposed to replace (unlike on real devices where it is 2x to 3x
# faster).
#
# What this means is that the platform image will not use NEON code paths
# that are slower to emulate. On the other hand, it is possible to emulate
# application code generated with the NDK that uses NEON in the emulator.
#
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP  := true

#BOARD_USES_GENERIC_AUDIO := true

# set NAND page paras XXX this will be removed in the future XXX
BOARD_NAND_PAGE_SIZE := 2048
BOARD_NAND_SPARE_SIZE := 16

#set cache line 32 feature
TARGET_CORTEX_CACHE_LINE_32 := true

# set EXT feature
#TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true
#use our self initrc
TARGET_PROVIDES_INIT_RC := true
# set board flash feature
BOARD_FLASH_BLOCK_SIZE := 2048
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 268435456
BOARD_USERDATA_PARTITION_SIZE :=  16777216

#use ts_calibrate
BOARD_USES_TSLIB := true

#for framework/base/data/sounds/Android.mk
MINIMAL_NEWWAVELABS : = true

# no hardware camera
USE_CAMERA_STUB := false

# Set /system/bin/sh to ash, not mksh, to make sure we can switch back.
TARGET_SHELL := ash
#BOARD_WIFI_VENDOR := realtek
ifeq ($(BOARD_WIFI_VENDOR), realtek)
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
CONFIG_DRIVER_WEXT :=y
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_rtl
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_rtl

BOARD_WLAN_DEVICE := rtl8192cu

WIFI_DRIVER_MODULE_NAME   := "wlan"
WIFI_DRIVER_MODULE_PATH   := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_ARG    := "ifname=wlan0 if2name=p2p0"

WIFI_FIRMWARE_LOADER      := ""
WIFI_DRIVER_FW_PATH_STA   := ""
WIFI_DRIVER_FW_PATH_AP    := ""
WIFI_DRIVER_FW_PATH_P2P   := ""
WIFI_DRIVER_FW_PATH_PARAM := ""
endif

WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := private_lib_driver_cmd
#BOARD_WLAN_DEVICE           := bcmdhd
#WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
#WIFI_DRIVER_MODULE_NAME := "wlan"
#WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/8192cu.ko"
#WIFI_DRIVER_MODULE_NAME := "8192cu"

BOARD_USES_GSENSOR :=BOSCH

BOARD_USES_ALSA_AUDIO := true
BUILD_WITH_ALSA_UTILS := true


# Enable dex-preoptimization to speed up the first boot sequence
# of an SDK AVD. Note that this operation only works on Linux for now
ifeq ($(HOST_OS),linux)
#WITH_DEXPREOPT := true
endif

# Build OpenGLES emulation guest and host libraries
BUILD_EMULATOR_OPENGL := false
USE_OPENGL_RENDERER := true


BUILD_ENV_SEQUENCE_NUMBER := 10

#set true to copy google related apk to system/app, apks location: ../imapx800/app/googleservice
BUILD_APP_GOOGLE_SERVICE := true

#set true to copy face unlock related resource to system, location: ../imapx800/app/facelock
BUILD_APP_FACELOCK := true

#set true to build with flash player
BUILD_APP_FLASH_PLAYER := true

#show build number(eng.$(user).builddata
DISPLAY_BUILD_NUMBER := true
