from debian:buster

ENV BCDEB "https://www.scootersoftware.com/bcompare-4.3.7.25118_amd64.deb"

RUN apt-get update && \
    apt-get install -y \
        wget \
        gdebi-core \
        procps \
        shared-mime-info
RUN    wget "$BCDEB" -O bcompare.deb && \
    gdebi -n bcompare.deb && \
    rm bcompare.deb

CMD ["/usr/bin/bcompare"]
