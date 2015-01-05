#!/bin/sh

sudo qemu-system-x86_64 \
	-name centos1 \
	-cpu host -machine accel=kvm \
	-smp 2 -m 1024 \
	-nographic \
	-net nic,model=virtio,macaddr=52:54:00:00:00:07 \
	-net bridge \
	-drive if=virtio,file=centos1.img \
	-drive if=virtio,readonly,file=centos.iso &> /dev/null & disown

sudo qemu-system-x86_64 \
	-name centos2 \
	-cpu host -machine accel=kvm \
	-smp 2 -m 1024 \
	-nographic \
	-net nic,model=virtio,macaddr=52:54:00:00:00:08 \
	-net bridge \
	-drive if=virtio,file=centos2.img \
	-drive if=virtio,readonly,file=centos.iso &>/dev/null & disown

sudo qemu-system-x86_64 \
	-name centos3 \
	-cpu host -machine accel=kvm \
	-smp 2 -m 1024 \
	-nographic \
	-net nic,model=virtio,macaddr=52:54:00:00:00:09 \
	-net bridge \
	-drive if=virtio,file=centos3.img \
	-drive if=virtio,readonly,file=centos.iso &>/dev/null & disown
