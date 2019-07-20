FROM ubuntu:14.04

MAINTAINER xsy<xin_shuyang@hotmail.com>

COPY container_setup.sh /root/
COPY helloworld.sh /root/
COPY l2fwd.sh /root/

RUN apt-get update && \
    apt-get install -y xz-utils && \
    apt-get install -y gcc make && \
    apt-get install -y libnuma-dev && \
    apt-get install -y libpcap-dev && \
    apt-get install -y vim && \
    apt-get install -y git && \
    apt-get install -y wget && \
    sudo apt-get install -y linux-headers-`uname -r` && \
    cd /root && \
    wget http://fast.dpdk.org/rel/dpdk-17.08.1.tar.xz && \
    xz -d dpdk-17.08.1.tar.xz && \
    tar -xvf dpdk-17.08.1.tar && \
    rm -rf /root/dpdk-17.08.1.tar.xz && \
    cd dpdk-stable-17.08.1

WORKDIR /root/



     
