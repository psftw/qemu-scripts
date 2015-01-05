#!/bin/bash

set -e

if [ $1 = fedora ]; then
	qemu-img create -f qcow2 -b fedora-atomic.img fedora1.img
	qemu-img create -f qcow2 -b fedora-atomic.img fedora2.img
	qemu-img create -f qcow2 -b fedora-atomic.img fedora3.img
fi

if [ $1 = centos ]; then
	qemu-img create -f qcow2 -b CentOS-7-x86_64-AtomicHost.qcow2 centos1.img
	qemu-img create -f qcow2 -b CentOS-7-x86_64-AtomicHost.qcow2 centos2.img
	qemu-img create -f qcow2 -b CentOS-7-x86_64-AtomicHost.qcow2 centos3.img
fi
