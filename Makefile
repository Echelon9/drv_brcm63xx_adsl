CSOURCES=$(wildcard *.c *.h)

ifneq ($(KERNELRELEASE),)
	obj-m := brcm63xx_adsl_drv.o
else
	KERNELDIR ?= /lib/modules/$(shell uname -r)/build
	PWD       := $(shell pwd)

all:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

clean:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) clean
endif


## astyle      : fix most C code indentation and formatting
astyle: $(CSOURCES)
	astyle --style=linux --max-code-length=80 $(CSOURCES)

## doxygen     : generate documentation of the C code
doxygen: doc/doxygen/html/index.html

doc/doxygen/html/index.html: $(CSOURCES)
	mkdir -p doc/doxygen
	doxygen

## cppcheck    : check for many code issues
cppcheck: $(CSOURCES)
	cppcheck $(CSOURCES) --enable=all --platform=unix64 \
	--std=c99 --inline-suppr --quiet 

## sloccount   : count lines of code
sloccount: 
	sloccount .
