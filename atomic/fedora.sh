#!/bin/sh

sudo qemu-system-x86_64 \
	-name fedora1 \
	-cpu host -machine accel=kvm \
	-smp 2 -m 1024 \
	-nographic \
	-net nic,model=virtio,macaddr=52:54:00:00:00:04 \
	-net bridge \
	-drive if=virtio,file=fedora1.img,snapshot
	#-drive if=virtio,readonly,file=fedora.iso
# &>/dev/null & disown


#sudo qemu-system-x86_64 \
#	-name fedora2 \
#	-cpu host -machine accel=kvm \
#	-smp 2 -m 1024 \
#	-nographic \
#	-net nic,model=virtio,macaddr=52:54:00:00:00:05 \
#	-net bridge \
#	-drive if=virtio,file=fedora2.img \
#	-drive if=virtio,readonly,file=fedora.iso &>/dev/null & disown

#sudo qemu-system-x86_64 \
#	-name fedora3 \
#	-cpu host -machine accel=kvm \
#	-smp 2 -m 1024 \
#	-nographic \
#	-net nic,model=virtio,macaddr=52:54:00:00:00:06 \
#	-net bridge \
#	-drive if=virtio,file=fedora3.img \
#	-drive if=virtio,readonly,file=fedora.iso &>/dev/null & disown
