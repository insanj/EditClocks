THEOS_PACKAGE_DIR_NAME = debs
TARGET = :clang
ARCHS = armv7 arm64

include theos/makefiles/common.mk

TWEAK_NAME = EditClocks
EditClocks_FILES = EditClocks.xm
EditAlarms_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

internal-after-install::
	install.exec "killall -9 backboardd"
SUBPROJECTS += editclocksprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
