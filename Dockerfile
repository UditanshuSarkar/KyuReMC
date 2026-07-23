FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive ENV container=docker
RUN apt-get update && apt-get install -y systemd systemd-sysv dbus openssh-server sudo curl wget git vim nano net-tools iproute2 iputils-ping dnsutils bridge-utils qemu-system-x86 qemu-utils cloud-image-utils python3 python3-pip ca-certificates && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/sshd && echo 'root:root' | chpasswd && sed -i 's/^#PermitRootLogin./PermitRootLogin yes/' /etc/ssh/sshd_config && sed -i 's/^#PasswordAuthentication./PasswordAuthentication yes/' /etc/ssh/sshd_config && sed -i 's/^UsePAM.*/UsePAM no/' /etc/ssh/sshd_config
