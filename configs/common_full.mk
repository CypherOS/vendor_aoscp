# Inherit common AOSCP stuff
$(call inherit-product, vendor/aoscp/configs/common.mk)

PRODUCT_SIZE := full

# Include AOSCP LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/aoscp/overlay/dictionaries

PRODUCT_PACKAGES += \
    VideoEditor \
    libvideoeditor_jni \
    libvideoeditor_core \
    libvideoeditor_osal \
    libvideoeditor_videofilters \
    libvideoeditorplayer
