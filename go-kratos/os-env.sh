#!/bin/bash

# apt
sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources
apt-get update
apt-get dist-upgrade -y

# software
apt-get install -y jq locales unzip sudo

apt-get autoclean

# locale
locale-gen zh_CN.UTF-8
dpkg-reconfigure locales

