#!/bin/bash

genisoimage -output snappy1.iso -volid cidata -joliet -rock conf/snappy1/{user-data,meta-data}
genisoimage -output snappy2.iso -volid cidata -joliet -rock conf/snappy2/{user-data,meta-data}
genisoimage -output snappy3.iso -volid cidata -joliet -rock conf/snappy3/{user-data,meta-data}

