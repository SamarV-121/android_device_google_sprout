$(call inherit-product, device/google/sprout/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_sprout
PRODUCT_DEVICE := sprout
PRODUCT_BRAND := google
PRODUCT_MANUFACTURER := Google
PRODUCT_MODEL := sprout

# Override Fingerprint
BUILD_FINGERPRINT := 6.0/MRA58M/2280749:user/release-keys
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="sprout-user 6.0 MRA58M 2280749 release-keys" \
    PRODUCT_NAME=sprout \
    TARGET_DEVICE=sprout
