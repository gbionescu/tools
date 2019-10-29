#!/usr/bin/env bash
/usr/sbin/dhcpd --no-pid eth0
tail -f /var/lib/dhcp/dhcpd.leases
