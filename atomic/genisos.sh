#!/bin/bash

set -e

genisoimage -output fedora.iso -volid cidata -joliet -rock conf/fedora/{user,meta}-data
genisoimage -output centos.iso -volid cidata -joliet -rock conf/centos/{user,meta}-data
