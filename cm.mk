$(call inherit-product, device/samsung/jaspervzw/full_jaspervzw.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/cdma.mk)

# Enhanced NFC
#$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=jaspervzw TARGET_DEVICE=jaspervzw BUILD_FINGERPRINT="jaspervzw-user 4.0.4 IMM76D I200VRALG4 release-keys" PRIVATE_BUILD_DESC="Verizon/jaspervzw/jaspervzw:4.0.4/IMM76D/I200VRALG4:user/release-keys"

TARGET_BOOTANIMATION_NAME := vertical-480x800

PRODUCT_NAME := cm_jaspervzw
PRODUCT_DEVICE := jaspervzw

