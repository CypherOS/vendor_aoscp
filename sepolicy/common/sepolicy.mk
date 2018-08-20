#
# This policy configuration will be used by all products that
# inherit from aoscp
#
ifeq ($(TARGET_LUNA_PLATFORM_SEPOLICY),true)
BOARD_PLAT_PUBLIC_SEPOLICY_DIR += \
    vendor/aoscp/sepolicy/common/public

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    vendor/aoscp/sepolicy/common/private

BOARD_SEPOLICY_DIRS += \
    vendor/aoscp/sepolicy/common/vendor
endif
