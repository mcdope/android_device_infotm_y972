LOCAL_PATH := $(call my-dir)
# board specific init.rc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.rc:root/init.rc \
    $(LOCAL_PATH)/vold.fstab:system/etc/vold.fstab \
    $(LOCAL_PATH)/vold.fstab.nnd:system/etc/vold.fstab.nnd 
