
ARCHS =  arm64
TARGET = iphone:clang:11.2:9.0

#export SDKVERSION = 9.3

export SYSROOT = $(THEOS)/sdks/sdks-master/iPhoneOS11.2.sdk

TWEAK_NAME = xhyy
xhyy_FILES = Tweak.xm

xhyy_FRAMEWORKS = Foundation AdSupport

xhyy_LDFLAGS += -lz.1 -lstdc++ -lxml2 -lz -licucore -lsqlite3 -lc++
xhyy_LDFLAGS += AVOSCloud.framework/AVOSCloud

include $(THEOS)/makefiles/common.mk

TARGET=iphone:latest:8.0
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
