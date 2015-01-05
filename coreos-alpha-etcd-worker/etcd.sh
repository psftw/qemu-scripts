#!/bin/sh

sudo qemu-system-x86_64 \
	-name coreos-etcd \
	-cpu host -machine accel=kvm \
	-smp 2 -m 1024 \
	-nographic -serial none \
	-net nic,model=virtio,macaddr=52:54:00:00:00:00 \
	-net bridge \
	-drive if=virtio,file=etcd.img \
	-fsdev local,id=conf,security_model=none,readonly,path="conf/etcd" \
	-device virtio-9p-pci,fsdev=conf,mount_tag=config-2 &>/dev/null & disown
