#!/bin/bash

# apt
sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources
apt-get update
apt-get dist-upgrade -y

# software
apt-get install -y --no-install-recommends jq locales tree bash-completion \
build-essential bc bison flex \
qemu-efi qemu-system qemu-user \
libncurses5-dev libssl-dev libelf-dev 

apt-get autoclean

# locale
locale-gen zh_CN.UTF-8
dpkg-reconfigure locales
