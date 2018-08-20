ifeq ($(TARGET_LUNA_PLATFORM_THEMES),true)
# Theme vendor extension
-include vendor/aoscp/themes/Android.mk

# Dark Theme
PRODUCT_PACKAGES += \
    SystemDarkTheme \
    SettingsDarkTheme

# Black Theme
PRODUCT_PACKAGES += \
    SystemBlackTheme \
    SettingsBlackTheme

# Blue Themes
PRODUCT_PACKAGES += \
    BlueTheme \
    IndigoTheme \
    OceanicTheme \
    BrightSkyTheme

# Pink Themes
PRODUCT_PACKAGES += \
    PinkTheme \
    PlayBoyTheme

# Purple Themes
PRODUCT_PACKAGES += \
    PurpleTheme \
    DeepValleyTheme

# Red Themes
PRODUCT_PACKAGES += \
    RedTheme \
    BloodyMaryTheme

# Green Themes
PRODUCT_PACKAGES += \
    GreenTheme \
    LimaBeanTheme \
    LimeTheme\
    TealTheme

# Yellow Themes
PRODUCT_PACKAGES += \
    YellowTheme \
    SunFlowerTheme

# Other Themes
PRODUCT_PACKAGES += \
    BlackTheme \
    GreyTheme\
    WhiteTheme

# Navbar Themes
PRODUCT_PACKAGES += \
    NavigationPixelTheme \
    NavigationPixelHolaTheme \
    NavigationSamsungTheme \
    NavigationXperiaTheme \
    NavigationOnePlusTheme

# Set Pixel blue light theme on Gboard
PRODUCT_SYSTEM_DEFAULT_PROPERTIESS += ro.com.google.ime.theme_id=5
endif