include $(THEOS)/makefiles/common.mk

ARCHS=arm64 arm64e armv7

BUNDLE_NAME = MailConfirm

MailConfirm_FILES = MCRootListController.m
MailConfirm_INSTALL_PATH = /Library/PreferenceBundles
MailConfirm_FRAMEWORKS = UIKit
MailConfirm_PRIVATE_FRAMEWORKS = Preferences
MailConfirm_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/MailConfirm.plist$(ECHO_END)
