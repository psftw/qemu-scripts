#!/bin/sh

sudo qemu-system-x86_64 \
	-name snappy1 \
	-cpu host -machine accel=kvm \
	-smp 2 -m 1024 \
	-nographic -serial none \
	-net nic,model=virtio,macaddr=52:54:00:00:00:10 \
	-net bridge \
	-drive if=virtio,file=snappy1.img &>/dev/null & disown

sudo qemu-system-x86_64 \
	-name snappy2 \
	-cpu host -machine accel=kvm \
	-smp 2 -m 1024 \
	-nographic -serial none \
	-net nic,model=virtio,macaddr=52:54:00:00:00:11 \
	-net bridge \
	-drive if=virtio,file=snappy2.img &>/dev/null & disown

sudo qemu-system-x86_64 \
	-name snappy3 \
	-cpu host -machine accel=kvm \
	-smp 2 -m 1024 \
	-nographic -serial none \
	-net nic,model=virtio,macaddr=52:54:00:00:00:12 \
	-net bridge \
	-drive if=virtio,file=snappy3.img &>/dev/null & disown
