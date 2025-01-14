# Copyright (C) 2016 Linaro, Ltd., Rob Herring <robh@kernel.org>
#
# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software and associated documentation files (the "Software"),
# to deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
# DEALINGS IN THE SOFTWARE.

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	gralloc_gbm.cpp \
	gralloc.cpp

LOCAL_SHARED_LIBRARIES := \
	libdrm \
	liblog \
	libcutils \
	libhardware \

ifeq ($(shell expr $(PLATFORM_SDK_VERSION) \>= 30), 1)
LOCAL_SHARED_LIBRARIES += \
        libgbm_mesa
else
LOCAL_SHARED_LIBRARIES += \
        libgbm
endif

LOCAL_STATIC_LIBRARIES := libdrm_framebuffer

LOCAL_EXPORT_C_INCLUDE_DIRS := \
	$(LOCAL_PATH)

LOCAL_MODULE := gralloc.gbm
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_PROPRIETARY_MODULE := true

include $(BUILD_SHARED_LIBRARY)
include $(LOCAL_PATH)/tests/Android.mk
