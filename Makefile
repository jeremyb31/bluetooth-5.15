KVER ?= $(shell uname -r)
obj-m += btusb.o
obj-m += ath3k.o
 
all:
	make -C /lib/modules/$(KVER)/build M=$(PWD) modules
 
clean:
	make -C /lib/modules/$(KVER)/build M=$(PWD) clean

dkms_remove:
	dkms remove btusb/4.1 --all
	rm -rf /usr/src/btusb-4.1

dkms_install:
	@mkdir -vp /usr/src/btusb-4.1
	cp -r * /usr/src/btusb-4.1
	dkms add -m btusb -v 4.1
	dkms install -m btusb -v 4.1


