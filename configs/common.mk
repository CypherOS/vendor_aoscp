PRODUCT_BRAND ?= aoscp

# Include versioning information
export AOSCP_VERSION := 7.0.0
export AOSCP_CODENAME := Parfait
export AOSCP_BUILD_NUMBER := CBNP.8102.$(shell date -u +%d).$(shell date -u +%m)008
export AOSCP_MAINTENANCE_PATCH := 2018-07-25

AOSCP_DISPLAY_VERSION := $(AOSCP_VERSION)

export ROM_VERSION := $(AOSCP_VERSION)-$(AOSCP_BUILD_NUMBER)

ifneq ($(RELEASE_TYPE),)
    AOSCP_BUILDTYPE := $(RELEASE_TYPE)
endif

#We build unofficial by default
ifndef AOSCP_BUILDTYPE
    AOSCP_BUILDTYPE := unofficial
endif

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.modversion=$(AOSCP_VERSION)-$(shell date -u +%Y%m%d) \
    ro.aoscp.version=$(AOSCP_VERSION) \
    ro.aoscp.device=$(AOSCP_DEVICE) \
    ro.aoscp.display.version=$(AOSCP_DISPLAY_VERSION) \
    ro.aoscp.releasetype=$(AOSCP_BUILDTYPE) \
    ro.aoscp.codename=$(AOSCP_CODENAME) \
    ro.aoscp.build=$(AOSCP_BUILD_NUMBER) \
    ro.aoscp.maintenance_patch=$(AOSCP_MAINTENANCE_PATCH)

export AOSCP_TARGET_ZIP := aoscp_$(AOSCP_BUILD)-$(AOSCP_VERSION)-$(shell date -u +%Y%m%d)-$(AOSCP_BUILDTYPE).zip

-include vendor/aoscp/configs/bootanimation.mk

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    keyguard.no_require_sim=true \
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
    ro.config.ringtone=Triton.ogg \
    ro.config.notification_sound=Orders_up.ogg \
    ro.config.alarm_alert=Bright_morning.ogg

# Thank you, please drive thru!
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.sys.dun.override=0

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIESS += \
    media.recorder.show_manufacturer_and_model=true

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/aoscp/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/aoscp/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/aoscp/prebuilt/common/bin/50-aoscp.sh:system/addon.d/50-aoscp.sh \
    vendor/aoscp/prebuilt/common/bin/blacklist:system/addon.d/blacklist \
    vendor/aoscp/prebuilt/common/bin/99-backup.sh:system/addon.d/99-backup.sh

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/aoscp/configs/permissions/backup.xml:system/etc/sysconfig/backup.xml

# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/aoscp/prebuilt/common/bin/otasigcheck.sh:install/bin/otasigcheck.sh

# init.d support
PRODUCT_COPY_FILES += \
    vendor/aoscp/prebuilt/common/etc/init.d/00start:system/etc/init.d/00start \
    vendor/aoscp/prebuilt/common/etc/init.d/01sysctl:system/etc/init.d/01sysctl \
    vendor/aoscp/prebuilt/common/bin/sysinit:system/bin/sysinit

# userinit support
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_COPY_FILES += \
    vendor/aoscp/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit
endif

# AOSCP specific init file
PRODUCT_COPY_FILES += vendor/aoscp/prebuilt/common/etc/init.aoscp.rc:root/init.aoscp.rc

# Installer
PRODUCT_COPY_FILES += \
    vendor/aoscp/prebuilt/common/bin/persist.sh:install/bin/persist.sh

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/aoscp/prebuilt/common/lib/content-types.properties:system/lib/content-types.properties

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

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
DEVICE_PACKAGE_OVERLAYS += vendor/aoscp/overlay/common

# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_VERSION_TAGS=release-keys USER=android-build BUILD_UTC_DATE=$(shell date +"%s")

# Charging sounds
PRODUCT_COPY_FILES += \
    vendor/aoscp/sounds/effects/BatteryPlugged.ogg:system/media/audio/ui/BatteryPlugged.ogg \
    vendor/aoscp/sounds/effects/BatteryPlugged_48k.ogg:system/media/audio/ui/BatteryPlugged_48k.ogg \
    vendor/aoscp/sounds/effects/GoodBattery.ogg:system/media/audio/ui/GoodBattery.ogg

-include $(WORKSPACE)/build_env/image-auto-bits.mk
-include vendor/aoscp/configs/partner_gms.mk
-include vendor/aoscp/configs/common_packages.mk
-include vendor/aoscp/configs/common_theme_packages.mk

$(call prepend-product-if-exists, vendor/extra/product.mk)
