ARCHS = arm64
TARGET = iphone:clang:latest:12.0
INSTALL_TARGET_PROCESSES = Video Star

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = PonLoveThao
PonLoveThao_FILES = HVSonTweak.m HVSonMenu.m HVSonEngine.m
PonLoveThao_CFLAGS = -fobjc-arc -Wno-deprecated-declarations
PonLoveThao_FRAMEWORKS = UIKit Foundation AVFoundation CoreImage

include $(THEOS_MAKE_PATH)/tweak.mk

# Install menu artwork next to the dylib in the staged package.
after-stage::
	@mkdir -p "$(THEOS_STAGING_DIR)/Library/MobileSubstrate/DynamicLibraries"
	@cp VideoStarTool_menu_background.jpg VideoStarTool_menu_logo.png "$(THEOS_STAGING_DIR)/Library/MobileSubstrate/DynamicLibraries/"
	@cp PonLoveThao.plist "$(THEOS_STAGING_DIR)/Library/MobileSubstrate/DynamicLibraries/"
