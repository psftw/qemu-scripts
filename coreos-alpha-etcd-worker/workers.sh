#!/bin/sh

sudo qemu-system-x86_64 \
	-name coreos-worker1 \
	-cpu host -machine accel=kvm \
	-smp 2 -m 1024 \
	-nographic -serial none \
	-net nic,model=virtio,macaddr=52:54:00:00:00:01 \
	-net bridge \
	-drive if=virtio,file=worker1.img \
	-fsdev local,id=conf,security_model=none,readonly,path="conf/worker" \
	-device virtio-9p-pci,fsdev=conf,mount_tag=config-2 &>/dev/null & disown

sudo qemu-system-x86_64 \
	-name coreos-worker2 \
	-cpu host -machine accel=kvm \
	-smp 2 -m 1024 \
	-nographic -serial none \
	-net nic,model=virtio,macaddr=52:54:00:00:00:02 \
	-net bridge \
	-drive if=virtio,file=worker2.img \
	-fsdev local,id=conf,security_model=none,readonly,path="conf/worker" \
	-device virtio-9p-pci,fsdev=conf,mount_tag=config-2 &>/dev/null & disown

sudo qemu-system-x86_64 \
	-name coreos-worker3 \
	-cpu host -machine accel=kvm \
	-smp 2 -m 1024 \
	-nographic -serial none \
	-net nic,model=virtio,macaddr=52:54:00:00:00:03 \
	-net bridge \
	-drive if=virtio,file=worker3.img \
	-fsdev local,id=conf,security_model=none,readonly,path="conf/worker" \
	-device virtio-9p-pci,fsdev=conf,mount_tag=config-2 &>/dev/null & disown
