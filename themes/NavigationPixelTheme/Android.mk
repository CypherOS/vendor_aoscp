LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_PACKAGE_NAME := NavigationPixelTheme
LOCAL_RRO_THEME := NavigationPixelTheme
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(call all-subdir-java-files)
LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/res

LOCAL_PRIVATE_PLATFORM_APIS := true

include $(BUILD_RRO_PACKAGE)