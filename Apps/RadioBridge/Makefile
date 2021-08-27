DEFINES += PROJECT_CONF_H=\"project-conf.h\"

CONTIKI_PROJECT = radio_bridge

BRIDGE_SOURCES_DIR = ./radiobridge
BRIDGE_SOURCES_FILES = $(notdir $(shell find $(BRIDGE_SOURCES_DIR) -name '*.c'))

PROJECTDIRS += $(BRIDGE_SOURCES_DIR)
PROJECT_SOURCEFILES += $(BRIDGE_SOURCES_FILES)

TARGET = cc2530dk

CONTIKI_WITH_RIME = 1

# For CC2530/CC2531, enable banking
HAVE_BANKING = 1

all: $(CONTIKI_PROJECT)

CONTIKI = ../../contiki
include $(CONTIKI)/Makefile.include

