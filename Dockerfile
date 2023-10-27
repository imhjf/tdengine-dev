FROM ubuntu:focal AS taoslib
ENV DEBIAN_FRONTEND noninteractive
ENV TDengine_VERSION ver-3.0.4.1
RUN set -ex && \
    apt-get update && \
    apt-get install -y curl tzdata gcc cmake build-essential git libssl-dev libgflags2.2 libgflags-dev build-essential libjansson-dev libsnappy-dev liblzma-dev libz-dev zlib1g pkg-config && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    git clone -b ${TDengine_VERSION} https://github.com/taosdata/TDengine.git && \
    cd TDengine && \
    sh build.sh && \
    cd debug && make install
