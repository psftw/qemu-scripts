#!/bin/bash

set -e

qemu-img create -f qcow2 -b coreos_production_qemu_image.img etcd.img
qemu-img create -f qcow2 -b coreos_production_qemu_image.img worker1.img
qemu-img create -f qcow2 -b coreos_production_qemu_image.img worker2.img
qemu-img create -f qcow2 -b coreos_production_qemu_image.img worker3.img
