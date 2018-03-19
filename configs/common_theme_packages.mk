# Theme vendor extension
-include vendor/aoscp/themes/Android.mk

# Deep Purple
PRODUCT_PACKAGES += \
    DeepPurpleTheme
	
# Indigo
PRODUCT_PACKAGES += \
    IndigoTheme
	
# Pink
PRODUCT_PACKAGES += \
    PinkTheme
	
# Purple
PRODUCT_PACKAGES += \
    PurpleTheme
	
# Red
PRODUCT_PACKAGES += \
    RedTheme
	
# Sky Blue
PRODUCT_PACKAGES += \
    SkyBlueTheme
	
# Yellow
PRODUCT_PACKAGES += \
    YellowTheme
	
# Teal
PRODUCT_PACKAGES += \
    TealTheme
	
# White
PRODUCT_PACKAGES += \
    WhiteTheme
	
# Set Pixel blue light theme on Gboard
PRODUCT_PROPERTY_OVERRIDES += ro.com.google.ime.theme_id=5
