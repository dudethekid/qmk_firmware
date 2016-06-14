LUFA_DIR = lib/lufa

# Path to the LUFA library
LUFA_PATH ?= $(TOP_DIR)/$(LUFA_DIR)/LUFA


# Create the LUFA source path variables by including the LUFA makefile
ifneq (, $(wildcard $(TOP_DIR)/$(LUFA_DIR)/LUFA/Build/lufa_sources.mk))
    # New build system from 20120730
    LUFA_ROOT_PATH = $(LUFA_DIR)/LUFA
    include $(TOP_DIR)/$(LUFA_DIR)/LUFA/Build/lufa_sources.mk
else
    include $(TOP_DIR)/$(LUFA_DIR)/LUFA/makefile
endif

LUFA_SRC = lufa.c \
	   descriptor.c \
	   $(LUFA_SRC_USB)

ifeq ($(strip $(MIDI_ENABLE)), yes)
	LUFA_SRC += midi/midi.c \
	   midi/midi_device.c \
	   midi/bytequeue/bytequeue.c \
	   midi/bytequeue/interrupt_setting.c \
	   $(LUFA_SRC_USBCLASS)
endif

ifeq ($(strip $(BLUETOOTH_ENABLE)), yes)
	LUFA_SRC += $(LUFA_DIR)/bluetooth.c \
	$(TMK_DIR)/protocol/serial_uart.c
endif

SRC += $(LUFA_SRC)

# Search Path
VPATH += $(TOP_DIR)/$(LUFA_DIR)
VPATH += $(TOP_DIR)/$(LUFA_PATH)
VPATH += $(TMK_PATH)/protocol/lufa

# Option modules
#ifdef $(or MOUSEKEY_ENABLE, PS2_MOUSE_ENABLE)
#endif

#ifdef EXTRAKEY_ENABLE
#endif

# LUFA library compile-time options and predefined tokens
LUFA_OPTS  = -DUSB_DEVICE_ONLY
LUFA_OPTS += -DUSE_FLASH_DESCRIPTORS
LUFA_OPTS += -DUSE_STATIC_OPTIONS="(USB_DEVICE_OPT_FULLSPEED | USB_OPT_REG_ENABLED | USB_OPT_AUTO_PLL)"
#LUFA_OPTS += -DINTERRUPT_CONTROL_ENDPOINT
LUFA_OPTS += -DFIXED_CONTROL_ENDPOINT_SIZE=8 
LUFA_OPTS += -DFIXED_NUM_CONFIGURATIONS=1

OPT_DEFS += -DF_USB=$(F_USB)UL
OPT_DEFS += -DARCH=ARCH_$(ARCH)
OPT_DEFS += $(LUFA_OPTS)

# This indicates using LUFA stack
OPT_DEFS += -DPROTOCOL_LUFA
