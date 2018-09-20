include vendor/aoscp/configs/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/aoscp/configs/BoardConfigQcom.mk
endif
