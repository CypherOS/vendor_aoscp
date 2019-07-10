PRODUCT_BRAND ?= aoscp
LOCAL_PATH := vendor/aoscp/

include $(LOCAL_PATH)configs/features_defaults.mk

# Do not include art debug targets
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP.
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

# We build unofficial by default
ifndef AOSCP_BUILDTYPE
    AOSCP_BUILDTYPE := unofficial
endif

export AOSCP_TARGET_ZIP := aoscp_$(AOSCP_BUILD)-$(AOSCP_VERSION)-$(shell date -u +%Y%m%d)-$(AOSCP_BUILDTYPE).zip

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.setupwizard.network_required=false \
    ro.setupwizard.gservices_delay=-1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent \
    ro.setupwizard.rotation_locked=true

#SELinux
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.selinux=1

# Default notification/alarm sounds
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.config.ringtone=Leaps_and_bounds.ogg \
    ro.config.notification_sound=End_note.ogg \
    ro.config.alarm_alert=Bright_morning.ogg

# Thank you, please drive thru!
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.sys.dun.override=0

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIESS += \
    media.recorder.show_manufacturer_and_model=true

# Backup Tool
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    $(LOCAL_PATH)prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    $(LOCAL_PATH)prebuilt/common/bin/50-aoscp.sh:system/addon.d/50-aoscp.sh \
    $(LOCAL_PATH)prebuilt/common/bin/blacklist:system/addon.d/blacklist \
    $(LOCAL_PATH)prebuilt/common/bin/99-backup.sh:system/addon.d/99-backup.sh

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)prebuilt/common/bin/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    $(LOCAL_PATH)prebuilt/common/bin/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    $(LOCAL_PATH)prebuilt/common/bin/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh
endif

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)configs/permissions/backup.xml:system/etc/sysconfig/backup.xml

# init.d support
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)prebuilt/common/etc/init.d/00start:system/etc/init.d/00start \
    $(LOCAL_PATH)prebuilt/common/etc/init.d/01sysctl:system/etc/init.d/01sysctl \
    $(LOCAL_PATH)prebuilt/common/bin/sysinit:system/bin/sysinit

# userinit support
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit
endif

# AOSCP specific init file
PRODUCT_COPY_FILES += $(LOCAL_PATH)prebuilt/common/etc/init.aoscp.rc:root/init.aoscp.rc

# Installer
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)prebuilt/common/bin/persist.sh:install/bin/persist.sh

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)prebuilt/common/lib/content-types.properties:system/lib/content-types.properties

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# AcrCloud Engine Plugin
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)prebuilt/common/lib64/libACRCloudEngine.so:system/lib64/libACRCloudEngine.so

# ExFAT support
PRODUCT_PACKAGES += \
    fsck.exfat \
    mkfs.exfat

ifeq ($(TARGET_EXFAT_DRIVER),)
    PRODUCT_PACKAGES += mount.exfat
endif

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.sf.omx-plugin=libffmpeg_omx.so \
    media.sf.extractor-plugin=libffmpeg_extractor.so

# Common overlay
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += $(LOCAL_PATH)overlay/common
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)overlay/common

# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_VERSION_TAGS=release-keys USER=android-build BUILD_UTC_DATE=$(shell date +"%s")

# Charging sounds
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)sounds/effects/BatteryPlugged.ogg:system/media/audio/ui/BatteryPlugged.ogg \
    $(LOCAL_PATH)sounds/effects/BatteryPlugged_48k.ogg:system/media/audio/ui/BatteryPlugged_48k.ogg \
    $(LOCAL_PATH)sounds/effects/GoodBattery.ogg:system/media/audio/ui/GoodBattery.ogg

-include $(WORKSPACE)/build_env/image-auto-bits.mk

include $(LOCAL_PATH)configs/bootanimation.mk
include $(LOCAL_PATH)configs/fonts.mk
include $(LOCAL_PATH)configs/packages.mk
include $(LOCAL_PATH)configs/themes.mk

$(call prepend-product-if-exists, vendor/extra/product.mk)
