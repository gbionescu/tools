# Pull base image.
FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

# Install build tools for qemu
RUN apt-get update && \
    apt-get install -y build-essential git python pkg-config zlib1g-dev libglib2.0-dev libpixman-1-dev

RUN mkdir -p /build
RUN git clone https://github.com/qemu/qemu.git /build/qemu
RUN cd /build/qemu && \
    git checkout stable-2.11 && \
    git submodule update --init dtc && \
    ./configure --target-list=x86_64-softmmu,aarch64-softmmu --enable-debug --extra-cflags='-g' && \
    make -j10 install && make -j10 install

ADD start-qemu.sh /

ENTRYPOINT ["/start-qemu.sh"]
