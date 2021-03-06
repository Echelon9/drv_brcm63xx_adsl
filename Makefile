TARGET=brcm63xx_adsl_drv
CSOURCES=$(wildcard *.c *.h)

ifneq ($(KERNELRELEASE),)
	obj-m := $(TARGET).o
else
	KERNELDIR ?= /lib/modules/$(shell uname -r)/build
	PWD       := $(shell pwd)

## all         : default task; compile C code, build kernel module
all:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

## load        : load kernel module
load:
	sudo insmod $(PWD)/$(TARGET).ko

## unload      : unload kernel module
unload:
	sudo rmmod $(TARGET)

## clean       : clean up all temporary / machine-generated files
clean:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) clean
	rm -rf doc/doxygen
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

## help        : print this help message and exit
help: Makefile
	@sed -n 's/^## //p' $<
