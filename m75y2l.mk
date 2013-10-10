# This is a FSL Android Reference Design platform based on i.MX51 BBG board
# It will inherit from FSL core product which in turn inherit from Google generic
PRODUCT_PROPERTY_OVERRIDES := \
    ro.config.notification_sound=Adara.ogg \
    ro.config.alarm_alert=Cesium.ogg	\
	ro.carrier=wifi-only

$(call inherit-product, device/infotm/imapx800/device_base.mk)
$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)

#system property sets
PRODUCT_PROPERTY_OVERRIDES += \
    ro.phone.enabled=false \
    wifi.interface=wlan0 \
    persist.sys.usb.config=mass_storage

#time info
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.timezone=Europe/Berlin \
    persist.sys.language=de \
    persist.sys.country=DE \
    persist.sys.strictmode.visual=0 \
    persist.sys.strictmode.disable=1 

DEVICE_PACKAGE_OVERLAYS := \
    device/infotm/m75y2l/overlay

PRODUCT_DEFAULT_DEV_CERTIFICATE := device/infotm/imapx800/security/release

# Overrides
PRODUCT_NAME := m75y2l
PRODUCT_MODEL := TP7-1000DC
PRODUCT_BRAND := TP7-1000DC
DEVICE_BOARD := m75y2l
PRODUCT_DEVICE := m75y2l
PRODUCT_MANUFACTURER := TP7-1000DC

#add hardware-specific features here. copy hardware related feature xml below to "system/etc/permissions/"  
#other feature xml files locate in frameworks/native/data/etc/
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml	\
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml	\
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml	\
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml	\
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    device/infotm/imapx800/etc/com.google.android.maps.xml:system/etc/permissions/com.google.android.maps.xml

PRODUCT_COPY_FILES += \
    device/infotm/m75y2l/ft5306.idc:system/usr/idc/ft5306.idc \
	device/infotm/m75y2l/media/bootanimation.zip:system/media/bootanimation.zip


PRODUCT_COPY_FILES += $(call add-to-product-copy-files-if-exists,\
packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml)



