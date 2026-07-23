FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV container=docker

RUN apt-get update && \
    apt-get install -y \
    systemd \
    systemd-sysv \
    dbus \
    openssh-server \
    sudo \
    curl \
    wget \
    git \
    vim \
    nano \
    net-tools \
    iproute2 \
    iputils-ping \
    qemu-kvm \
    qemu-system-x86 \
    qemu-utils \
    cloud-image-utils \
    bridge-utils \
    dnsutils \
    python3 \
    python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/sshd

RUN echo "root:root" | chpasswd

RUN sed -i 's/^#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/^#PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config

EXPOSE 22
EXPOSE 6080
EXPOSE 2222

VOLUME ["/sys/fs/cgroup"]

STOPSIGNAL SIGRTMIN+3

CMD ["/sbin/init"]
