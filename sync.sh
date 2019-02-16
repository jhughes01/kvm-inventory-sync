#!/bin/bash

KVM_INVENTORY=$(virsh list --all | sed -e '1,2d' -e '/^$/d' | awk '{print $2}' | sort)

rm -rf test; git clone https://github.com/jhughes01/ansible-homelab.git test --branch inventory/test 

cd test

#GIT_INVENTORY=$(for i in *.yml; do echo $i | cut -d '.' -f 1; done | sort | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

GIT_INVENTORY=$(for i in *.yml; do echo $i | cut -d '.' -f 1; done | sort)

cd ..

diff <(echo "$KVM_INVENTORY") <(echo "$GIT_INVENTORY")

#if [ "$KVM_INVENTORY" == "$GIT_INVENTORY" ]; then
#	echo 'The inventories match!'
#else
#	echo 'The inventories DO NOT match'
#fi
