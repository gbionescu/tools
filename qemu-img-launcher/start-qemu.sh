#!/bin/bash

# If $1 is not empty, then create an image using the specified size
if [[ ! -z "$1" ]];
then
    qemu-img create /hdb.img $1
    qemu-system-x86_64 -enable-kvm -M q35 -nographic -hda /the-image -hdb /hdb.img
else
    qemu-system-x86_64 -enable-kvm -M q35 -nographic -hda /the-image
fi
