include theos/makefiles/common.mk

BUNDLE_NAME = EditClocksPrefs
EditClocksPrefs_FILES = EditClocksPrefs.mm
EditClocksPrefs_INSTALL_PATH = /Library/PreferenceBundles
EditClocksPrefs_FRAMEWORKS = UIKit
EditClocksPrefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/EditClocksPrefs.plist$(ECHO_END)
