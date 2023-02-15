# Copyright (C) 2023 Paranoid Android
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)

ifneq ($(filter $(LOCAL_PATH),$(PRODUCT_SOONG_NAMESPACES)),)

include $(CLEAR_VARS)

CAMERA_LIBRARIES := libcamera_algoup_jni.xiaomi.so libcamera_mianode_jni.xiaomi.so

CAMERA_SYMLINKS := $(addprefix $(TARGET_OUT_APPS_PRIVILEGED)/MiuiCamera/lib/arm64/,$(notdir $(CAMERA_LIBRARIES)))
$(CAMERA_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "MiuiCamera lib link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system/lib64/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(CAMERA_SYMLINKS)

endif
