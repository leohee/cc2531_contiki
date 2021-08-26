
CUR_PATH := $(shell pwd)


all :
	@echo "Should execute 'source ./Environment/setupEnvironment.sh' first, when open in a new terminal."
	@echo "\nselect one target below : \nHello\nHello_clean\nBridge\nBridge_clean\nRouter\nRouter_clean\nUSB_DEMO\nUSB_DEMO_clean\nIPV6\nIPV6_clean"

Hello :
	@echo 'making HelloWorld'
	make -j -C $(CUR_PATH)/Apps/HelloWorld
	@echo 'make done.'

Hello_clean :
	@echo 'cleaning HelloWorld'
	make -C $(CUR_PATH)/Apps/HelloWorld clean
	@echo 'clean done.'

Bridge :
	@echo 'making RadioBridge'
	make -C $(CUR_PATH)/Apps/RadioBridge
	@echo 'make done.'

Bridge_clean :
	@echo "cleaning RadioBridge"
	make -C $(CUR_PATH)/Apps/RadioBridge clean
	@echo "clean done."

Router :
	@echo 'making border-router'
	make -C $(CUR_PATH)/Apps/border-router
	@echo 'make done.'

Router_clean :
	@echo "cleaning border-router"
	make -C $(CUR_PATH)/Apps/border-router clean
	@echo "clean done."

USB_DEMO :
	@echo 'making cc2531-usb-demo'
	make -C $(CUR_PATH)/Apps/cc2531-usb-demo
	@echo 'make done.'

USB_DEMO_clean :
	@echo "cleaning cc2531-usb-demo"
	make -C $(CUR_PATH)/Apps/cc2531-usb-demo clean
	@echo "clean done."

IPV6 :
	@echo 'making udp-ipv6'
	make -C $(CUR_PATH)/Apps/udp-ipv6
	@echo 'make done.'

IPV6_clean :
	@echo "cleaning udp-ipv6"
	make -C $(CUR_PATH)/Apps/udp-ipv6 clean
	@echo "clean done."

clean : Hello_clean Bridge_clean Router_clean USB_DEMO_clean IPV6_clean

.PYONY: all Hello Hello_clean Bridge Bridge_clean Router Router_clean USB_DEMO USB_DEMO_clean IPV6 IPV6_clean

