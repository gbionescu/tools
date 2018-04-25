FROM ubuntu

ARG UNAME=
ARG UID=
ARG GID=

RUN groupadd -g $GID $UNAME
RUN useradd -m -u $UID -g $GID -s /bin/bash $UNAME

RUN apt-get update && \
    apt-get install -y sudo

USER $UNAME
