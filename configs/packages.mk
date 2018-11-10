ifeq ($(TARGET_LUNA_PLATFORM_SDK_APPS),true)
PRODUCT_PACKAGES += \
    Bolt \
    MusicX
endif

# Required packages
PRODUCT_PACKAGES += \
    BluetoothExt \
    CellBroadcastReceiver \
    LatinIME \
    messaging

# Optional packages
PRODUCT_PACKAGES += \
    libemoji \
    Terminal \
    PhotoTable

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    librsjni

# AOSCP Packages
PRODUCT_PACKAGES += \
    GalleryX \
    LunaQuickStep \
    WeatherProvider

# WeatherProvider
PRODUCT_COPY_FILES += \
    vendor/aoscp/prebuilt/common/etc/permissions/com.android.providers.weather.xml:system/etc/permissions/com.android.providers.weather.xml \
    vendor/aoscp/prebuilt/common/etc/default-permissions/com.android.providers.weather.xml:system/etc/default-permissions/com.android.providers.weather.xml

# Aoscp OTA
PRODUCT_PACKAGES += COTA

# Ambient Play
PRODUCT_PACKAGES += \
    AmbientPlayHistoryProvider

# Google Packages
PRODUCT_PACKAGES += \
    MarkupGoogle \
    SoundPickerPrebuilt \
    Wallpapers

# Markup libs
PRODUCT_COPY_FILES += \
    vendor/aoscp/prebuilt/common/lib/libsketchology_native.so:system/lib/libsketchology_native.so \
    vendor/aoscp/prebuilt/common/lib64/libsketchology_native.so:system/lib64/libsketchology_native.so

# Turbo
PRODUCT_PACKAGES += \
    Turbo \
    turbo.xml \
    privapp-permissions-turbo.xml

# Extra tools
PRODUCT_PACKAGES += \
    libsepol \
    mke2fs \
    tune2fs \
    nano \
    htop \
    mkfs.ntfs \
    fsck.ntfs \
    mount.ntfs \
    gdbserver \
    micro_bench \
    oprofiled \
    sqlite3 \
    strace \
    pigz \
    7z \
    lib7z \
    bash \
    bzip2 \
    curl \
    powertop \
    unrar \
    unzip \
    vim \
    wget \
    zip

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# rsync
PRODUCT_PACKAGES += \
    rsync

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libffmpeg_extractor \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml

PRODUCT_PACKAGES += \
    procmem \
    procrank
