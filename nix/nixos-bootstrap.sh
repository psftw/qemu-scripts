#!/bin/sh

sudo qemu-system-x86_64 \
	-name nix1 \
	-cpu host -machine accel=kvm \
	-smp 2 -m 1024 \
	-net nic,model=virtio,macaddr=52:54:00:00:00:16 \
	-net user,hostfwd=tcp:127.0.0.1:2022-:22 \
	-drive if=virtio,file=nixos.img \
	-boot d -cdrom nixos-minimal-14.12.231.139ead2-x86_64-linux.iso

