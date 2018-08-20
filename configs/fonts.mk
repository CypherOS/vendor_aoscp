FONT_PATH := $(LOCAL_PATH)prebuilt/common/fonts/

# GoogleSans
PRODUCT_COPY_FILES += \
    $(FONT_PATH)GoogleSans-Regular.ttf:system/fonts/GoogleSans-Regular.ttf \
    $(FONT_PATH)GoogleSans-Medium.ttf:system/fonts/GoogleSans-Medium.ttf \
    $(FONT_PATH)GoogleSans-MediumItalic.ttf:system/fonts/GoogleSans-MediumItalic.ttf \
    $(FONT_PATH)GoogleSans-Italic.ttf:system/fonts/GoogleSans-Italic.ttf \
    $(FONT_PATH)GoogleSans-Bold.ttf:system/fonts/GoogleSans-Bold.ttf \
    $(FONT_PATH)GoogleSans-BoldItalic.ttf:system/fonts/GoogleSans-BoldItalic.ttf
