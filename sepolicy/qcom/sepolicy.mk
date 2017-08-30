#
# This policy configuration will be used by all qcom products
# that inherit from aoscp
#

BOARD_SEPOLICY_DIRS += \
    vendor/aoscp/sepolicy/qcom/common \
    vendor/aoscp/sepolicy/qcom/$(TARGET_BOARD_PLATFORM)
