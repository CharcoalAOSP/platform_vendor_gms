#
# Copyright (C) 2020 The LineageOS Project
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
#

# $(call add-radio-file-sha1-checked,path,sha1)
define add-radio-file-sha1-checked
  $(eval path := $(LOCAL_PATH)/$(1))
  $(eval sha1 := $(shell sha1sum "$(path)" | cut -d" " -f 1))
  $(if $(filter $(sha1),$(2)),
    $(call add-radio-file,$(1)),
    $(error $(path) SHA1 mismatch ($(sha1) != $(2))))
endef

PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.clientidbase=android-google

# APEX
DISABLE_DEXPREOPT_CHECK := true

PRODUCT_PACKAGES += \
    com.google.android.adbd \
    com.google.android.art \
    com.google.android.configinfrastructure \
    com.google.android.conscryp \
    com.google.android.extservice \
    com.google.android.healthfitness \
    com.google.android.ipsec \
    com.google.android.media \
    com.google.android.media.swcodec \
    com.google.android.neuralnetworks \
    com.google.android.ondevicepersonalization \
    com.google.android.os.statsd \
    com.google.android.permission \
    com.google.android.profiling \
    com.google.android.resolv \
    com.google.android.scheduling \
    com.google.android.sdkext \
    com.google.android.tzdata6 \
    com.google.android.uprobestats \
    com.google.android.webapp \
    com.google.android.gmssystem

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/apex/com.google.android.adbd.apex \
    system/apex/com.google.android.art.apex \
    system/apex/com.google.android.configinfrastructure.apex \
    system/apex/com.google.android.conscrypt.apex \
    system/apex/com.google.android.extservices.apex \
    system/apex/com.google.android.healthfitness.apex \
    system/apex/com.google.android.ipsec.apex \
    system/apex/com.google.android.media.apex \
    system/apex/com.google.android.media.swcodec.apex \
    system/apex/com.google.android.neuralnetworks.apex \
    system/apex/com.google.android.ondevicepersonalization.apex \
    system/apex/com.google.android.os.statsd.apex \
    system/apex/com.google.android.permission.apex \
    system/apex/com.google.android.profiling.apex \
    system/apex/com.google.android.resolv.apex \
    system/apex/com.google.android.scheduling.apex \
    system/apex/com.google.android.sdkext.apex \
    system/apex/com.google.android.tzdata6.apex \
    system/apex/com.google.android.uprobestats.apex \
    system/apex/com.google.android.webapp.apex

# Artifact path requirement allowlist
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/app/CaptivePortalLoginGoogle/CaptivePortalLoginGoogle.apk \
    system/app/GoogleExtShared/GoogleExtShared.apk \
    system/app/GooglePrintRecommendationService/GooglePrintRecommendationService.apk \
    system/etc/default-permissions/default-permissions_googleprintrecommendationservice.xml \
    system/etc/permissions/privapp-permissions-google.xml \
    system/lib/libtensorflowlite_jni.so \
    system/lib64/libtensorflowlite_jni.so \
    system/priv-app/DocumentsUIGoogle/DocumentsUIGoogle.apk \
    system/priv-app/GooglePackageInstaller/GooglePackageInstaller.apk \
    system/priv-app/TagGoogle/TagGoogle.apk

# Default notification/alarm sounds
PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.notification_sound=Eureka.ogg \
    ro.config.alarm_alert=Gentle_breeze.ogg

# Default ringtone
PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.ringtone=Crackle.ogg

# Use gestures by default
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.vendor.overlay.theme=com.android.internal.systemui.navbar.gestural;com.google.android.systemui.gxoverlay

# Enable support of one-handed mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode=true

# Enable background blur for widget picker
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.launcher.depth.widget=true

# Gboard Props
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.ime.theme_id=5 \
    ro.com.google.ime.system_lm_dir=/product/usr/share/ime/google/d3_lms

# GMS Props
PRODUCT_PRODUCT_PROPERTIES += \
    ro.opa.eligible_device=true

# SetupWizard Props
PRODUCT_PRODUCT_PROPERTIES += \
    ro.setupwizard.enterprise_mode=1 \
    ro.setupwizard.esim_cid_ignore=00000001 \
    setupwizard.feature.baseline_setupwizard_enabled=true \
    setupwizard.feature.day_night_mode_enabled=true \
    setupwizard.feature.default_locale_enhancement_enabled=true \
    setupwizard.feature.enable_gil= \
    setupwizard.feature.enable_wifi_tracker=true \
    setupwizard.feature.lifecycle_refactoring=true \
    setupwizard.feature.locale_agnostic_enabled=true \
    setupwizard.feature.notification_refactoring=true \
    setupwizard.feature.portal_notification=true \
    setupwizard.feature.show_pai_screen_in_main_flow.carrier1839=false \
    setupwizard.feature.show_pixel_tos=true \
    setupwizard.feature.show_support_link_in_deferred_setup=false \
    setupwizard.feature.skip_button_use_mobile_data.carrier1839=true \
    setupwizard.theme=glif_expressive

# Accessibility Menu
PRODUCT_PACKAGES += \
    AccessibilityMenu

# SystemUI plugins
PRODUCT_PACKAGES += \
    QuickAccessWallet

# Quick Tap
PRODUCT_PACKAGES += \
    ColumbusService

# TextClassifier
PRODUCT_PACKAGES += \
    libtextclassifier_annotator_en_model \
    libtextclassifier_annotator_universal_model \
    libtextclassifier_actions_suggestions_universal_model \
    libtextclassifier_lang_id_model

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/etc/textclassifier/actions_suggestions.universal.model \
    system/etc/textclassifier/lang_id.model \
    system/etc/textclassifier/textclassifier.en.model \
    system/etc/textclassifier/textclassifier.universal.model

$(call inherit-product, vendor/gms/common/common-vendor.mk)
