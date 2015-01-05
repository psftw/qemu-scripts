#!/bin/bash

set -e

qemu-img create -f qcow2 -b coreos_production_qemu_image.img corestable1.img
qemu-img create -f qcow2 -b coreos_production_qemu_image.img corestable2.img
qemu-img create -f qcow2 -b coreos_production_qemu_image.img corestable3.img
