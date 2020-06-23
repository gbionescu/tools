FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y isc-dhcp-server

RUN touch /var/lib/dhcp/dhcpd.leases

COPY ./entrypoint.sh /entrypoint.sh
COPY dhcpd.conf /etc/dhcp/dhcpd.conf

ENTRYPOINT ["/entrypoint.sh"]

