# Inherit common AOSCP stuff
$(call inherit-product, vendor/aoscp/configs/common.mk)
$(call inherit-product, vendor/aoscp/configs/telephony.mk)

PRODUCT_SIZE := full

PRODUCT_PACKAGES += \
    VideoEditor \
    libvideoeditor_jni \
    libvideoeditor_core \
    libvideoeditor_osal \
    libvideoeditor_videofilters \
    libvideoeditorplayer