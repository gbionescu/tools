FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y \
        wget \
        python \
        python-libvirt \
        libgtk-3-dev \
        libvirt-glib-1.0 \
        gir1.2-gtk-vnc-2.0 \
        gir1.2-spice-client-gtk-3.0 \
        libosinfo-1.0 python-ipaddr \
        gir1.2-vte-2.91 \
        python-libxml2 \
        python-requests \
        python-gi \
        openssh-client \
        ssh-askpass

RUN mkdir /vmanager
RUN wget -qO- https://github.com/virt-manager/virt-manager/archive/v1.5-maint.tar.gz | tar xz --strip 1 -C /vmanager
