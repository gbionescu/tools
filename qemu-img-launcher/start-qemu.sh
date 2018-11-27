#!/bin/bash
common_args="-enable-kvm -m 2048 -M q35 -nographic -bios /usr/share/qemu/OVMF.fd -boot order=c,menu=on -netdev \
    tap,id=mynet0,ifname=tapif,script=no,downscript=no -device e1000,netdev=mynet0,mac=3C:AB:5A:7D:90:98"

echo "Creating bridge"
eth0_cfg=$(ifconfig eth0 | grep "inet " | awk -F'inet ' '{print $2}')
ifconfig eth0 down
brctl addbr br
brctl addif br eth0
ifconfig eth0 0.0.0.0 promisc
ifconfig br $eth0_cfg
route add default gw 172.17.0.1
tunctl -t tapif
brctl addif br tapif
ifconfig tapif up

# If $1 is not empty, then create an image using the specified size
if [[ ! -z "$1" ]];
then
    qemu-img create /hdb.img $1
    qemu-system-x86_64 $common_args -hda /the-image -hdb /hdb.img
else
    qemu-system-x86_64 $common_args -hda /the-image
fi
