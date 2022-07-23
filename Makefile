KVER ?= $(shell uname -r)
obj-m += btusb.o
obj-m += ath3k.o
 
all:
	make -C /lib/modules/$(KVER)/build M=$(PWD) modules
 
clean:
	make -C /lib/modules/$(KVER)/build M=$(PWD) clean
