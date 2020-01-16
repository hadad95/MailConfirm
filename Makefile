INSTALL_TARGET_PROCESSES = MobileMail
ARCHS=arm64
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = MailConfirm

MailConfirm_FILES = Tweak.xm
MailConfirm_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
