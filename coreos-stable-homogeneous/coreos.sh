#!/bin/sh

sudo qemu-system-x86_64 \
	-name corestable1 \
	-cpu host -machine accel=kvm \
	-smp 2 -m 1024 \
	-nographic \
	-net nic,model=virtio,macaddr=52:54:00:00:00:13 \
	-net bridge \
	-drive if=virtio,file=corestable1.img \
	-fsdev local,id=conf,security_model=none,readonly,path="conf/corestable1" \
	-device virtio-9p-pci,fsdev=conf,mount_tag=config-2 &>/dev/null & disown

sudo qemu-system-x86_64 \
	-name corestable2 \
	-cpu host -machine accel=kvm \
	-smp 2 -m 1024 \
	-nographic \
	-net nic,model=virtio,macaddr=52:54:00:00:00:14 \
	-net bridge \
	-drive if=virtio,file=corestable2.img \
	-fsdev local,id=conf,security_model=none,readonly,path="conf/corestable2" \
	-device virtio-9p-pci,fsdev=conf,mount_tag=config-2 &>/dev/null & disown

sudo qemu-system-x86_64 \
	-name corestable3 \
	-cpu host -machine accel=kvm \
	-smp 2 -m 1024 \
	-nographic \
	-net nic,model=virtio,macaddr=52:54:00:00:00:15 \
	-net bridge \
	-drive if=virtio,file=corestable3.img \
	-fsdev local,id=conf,security_model=none,readonly,path="conf/corestable3" \
	-device virtio-9p-pci,fsdev=conf,mount_tag=config-2 &>/dev/null & disown

