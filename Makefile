INSTALL_TARGET_PROCESSES = SpringBoard

ARCHS=arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = MailConfirm

MailConfirm_FILES = Tweak.xm
MailConfirm_CFLAGS = -fobjc-arc
MailConfirm_EXTRA_FRAMEWORKS = Cephei

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += mailconfirm
include $(THEOS_MAKE_PATH)/aggregate.mk
