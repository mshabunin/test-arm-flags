LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := test
LOCAL_SRC_FILES := test.cpp
LOCAL_ARM_NEON := true

include $(BUILD_SHARED_LIBRARY)
