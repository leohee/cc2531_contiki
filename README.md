# How to build

## Create a new cc2531 project

Make a new project directory in Apps.

```shell
mkdir -p Apps/${prj}
cd Apps/${prj}
```

Add Makefiles for project.

In file **Makefile.target** add bellow.

```makefile
TARGET = cc2530dk
```

In file **Makefile** add like below.

```Makefile
CONTIKI_PROJECT = helloprj

#DEFINES += #some macro

# if source files are in a special directory
HELLOPRJ_SOURCES_DIR = ./prj
HELLOPRJ_SOURCES_FILES = $(notdir $(shell find $(HELLOPRJ_SOURCES_DIR) -name '*.c'))

PROJECTDIRS += $(HELLOPRJ_SOURCES_DIR)
PROJECT_SOURCEFILES += $(HELLOPRJ_SOURCES_FILES)

CONTIKI_WITH_RIME = 1

all : $(CONTIKI_PROJECT)

CONTIKI = ../../contiki
include $(CONTIKI)/Makefile.include

```

add your source files in directory **prj**.

## Add make arguments in top directory

```makefile
HELLOPRJ :
	@echo "making hellopej"
	make -C $(CUR_PATH)/Apps/${prj}
	@echo "make done."
	
HELLOPRJ_clean :
	@echo "cleaning hellopej"
	make -C $(CUR_PATH)/Apps/${prj} clean
	@echo "clean done."
	

```

## Compile the project

```shell
make HELLOPRJ
# make HELLOPRJ_clean
```

You can add **-j** to speed up making.

## Hex file

The hex file "helloprj.hex" would be found in directory **Apps/${prj}**



Enjoy :)