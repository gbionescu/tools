# Pull base image.
FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

# Install VNC, xfce and browser
RUN apt-get update && \
    apt-get install -y xfce4 xfce4-terminal xterm firefox icedtea-8-plugin wget net-tools git python

# Install build tools for qemu
RUN apt-get update && \
    apt-get install -y build-essential git python pkg-config zlib1g-dev libglib2.0-dev libpixman-1-dev

# Install tools for virt-manager
RUN apt-get update && \
    apt-get install -y libvirt-bin bridge-utils openssh-server

# Install utils
RUN apt-get update && \
    apt-get install -y iputils-ping

# Variables:
#   - WDIR
#   - LOCAL_VNC_PORT
#   - NOVNC_PORT
#   - VNC_PASSWD
#   - VNC_DEPTH
#   - VNC_RESOLUTION
#   - VNC_DISPLAY
#   - SSH_PASSWD

ARG WDIR="/opt"
ARG LOCAL_VNC_PORT=5901
ARG NOVNC_PORT=25999
ARG VNC_PASSWD="123456"
ARG VNC_DEPTH="24"
ARG VNC_RESOLUTION="1280x800"
ARG VNC_DISPLAY=":1"
ARG SSH_PASSWD="root"

ENV ENV_WDIR=$WDIR
ENV ENV_LOCAL_VNC_PORT=$LOCAL_VNC_PORT
ENV ENV_NOVNC_PORT=$NOVNC_PORT
ENV ENV_VNC_PASSWD=$VNC_PASSWD
ENV ENV_VNC_DEPTH=$VNC_DEPTH
ENV ENV_VNC_RESOLUTION=$VNC_RESOLUTION
ENV ENV_VNC_DISPLAY=$VNC_DISPLAY
ENV ENV_SSH_PASSWD=$SSH_PASSWD

RUN wget -qO- https://bintray.com/tigervnc/stable/download_file?file_path=tigervnc-1.8.0.x86_64.tar.gz | tar xz --strip 1 -C /
RUN mkdir -p $ENV_WDIR/novnc
RUN wget -qO- https://github.com/novnc/noVNC/archive/v1.0.0.tar.gz | tar zx --strip 1 -C $ENV_WDIR/novnc
RUN mkdir -p $ENV_WDIR/novnc/utils/websockify
RUN wget -qO- https://github.com/novnc/websockify/archive/v0.8.0.tar.gz | tar zx --strip 1 -C $ENV_WDIR/novnc/utils/websockify

RUN mkdir -p /build
RUN git clone https://github.com/qemu/qemu.git /build/qemu
RUN cd /build/qemu && \
    git checkout stable-2.11 && \
    git submodule update --init dtc && \
    ./configure --target-list=x86_64-softmmu,aarch64-softmmu --enable-debug --extra-cflags='-g' && \
    make -j8 install

COPY start.sh $ENV_WDIR/
RUN chmod 777 $ENV_WDIR/start.sh

ENTRYPOINT ["sh", "-c", "$ENV_WDIR/start.sh"]
CMD ["/bin/bash"]
