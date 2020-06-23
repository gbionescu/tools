#!/bin/bash
. utils.source

# Set kernel
set_kernel "kernel.bin"

# Set rootfs
set_rootfs "rootfs.ext4"

# Create netif
create_netif

# Start
instance_start
