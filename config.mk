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

# Namespace
PRODUCT_SOONG_NAMESPACES += \
    device/xiaomi/surya-miuicamera

DEVICE_CAMERA_PATH := device/xiaomi/surya-miuicamera
TARGET_USES_MIUI_CAMERA := true 

# Camera property
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.lens.oem_camera_package=com.android.camera \
    ro.miui.notch=1

PRODUCT_SYSTEM_PROPERTIES += \
    persist.vendor.camera.privapp.list=com.android.camera \
    vendor.camera.aux.packagelist=com.android.camera

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += $(DEVICE_CAMERA_PATH)/configs/hidl/xiaomi_framework_compatibility_matrix.xml

PRODUCT_PACKAGES += \
    android.hidl.memory.block@1.0 \
    android.hidl.memory.block@1.0.vendor
    
# Init scripts
PRODUCT_COPY_FILES += \
    $(DEVICE_CAMERA_PATH)/init/init.miuicamera.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.miuicamera.rc

# MIUI Camera Overlay to Surya and Karna
PRODUCT_PACKAGES += \
    J20CMiuiCameraOverlay

# Permissions
PRODUCT_COPY_FILES += \
    $(DEVICE_CAMERA_PATH)/configs/permissions/miuicamera-permissions.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/default-permissions/miuicamera-permissions.xml \
    $(DEVICE_CAMERA_PATH)/configs/permissions/miuicamera-hiddenapi-package-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/miuicamera-hiddenapi-package-whitelist.xml \
    $(DEVICE_CAMERA_PATH)/configs/permissions/privapp-permissions-miuicamera.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-miuicamera.xml

# Sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_CAMERA_PATH)/sepolicy/vendor
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_CAMERA_PATH)/sepolicy/private
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += $(DEVICE_CAMERA_PATH)/sepolicy/public

# Vendor Proprietary
$(call inherit-product, vendor/xiaomi/surya-miuicamera/surya-miuicamera-vendor.mk)