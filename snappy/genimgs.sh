#!/bin/bash

set -e

qemu-img create -f qcow2 -b ubuntu-core-alpha-01.img snappy1.img
qemu-img create -f qcow2 -b ubuntu-core-alpha-01.img snappy2.img
qemu-img create -f qcow2 -b ubuntu-core-alpha-01.img snappy3.img
