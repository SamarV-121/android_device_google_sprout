$(call inherit-product, device/google/sprout/device.mk)

# Common CM stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=6.0/MRA58M/2280749:user/release-keys PRIVATE_BUILD_DESC="sprout-user 6.0 MRA58M 2280749 release-keys"

PRODUCT_NAME := lineage_sprout
PRODUCT_DEVICE := sprout
PRODUCT_BRAND := google
PRODUCT_MANUFACTURER := Google
PRODUCT_MODEL := sprout

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE="sprout"
