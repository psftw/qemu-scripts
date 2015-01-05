#!/bin/sh

sudo qemu-system-x86_64 \
	-name nix1 \
	-cpu host -machine accel=kvm \
	-smp 2 -m 1024 \
	-nographic \
	-net nic,model=virtio,macaddr=52:54:00:00:00:16 \
	-net bridge \
	-drive if=virtio,file=nix1.img &>/dev/null & disown

sudo qemu-system-x86_64 \
	-name nix2 \
	-cpu host -machine accel=kvm \
	-smp 2 -m 1024 \
	-nographic \
	-net nic,model=virtio,macaddr=52:54:00:00:00:17 \
	-net bridge \
	-drive if=virtio,file=nix2.img &>/dev/null & disown

sudo qemu-system-x86_64 \
	-name nix3 \
	-cpu host -machine accel=kvm \
	-smp 2 -m 1024 \
	-nographic \
	-net nic,model=virtio,macaddr=52:54:00:00:00:18 \
	-net bridge \
	-drive if=virtio,file=nix3.img &>/dev/null & disown
