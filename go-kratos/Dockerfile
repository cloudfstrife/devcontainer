FROM golang:1.22.6


ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

ADD build-grpc-env.sh build-kratos-env.sh /root/

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources
RUN apt update
RUN apt dist-upgrade -y
RUN apt install -y jq locales unzip sudo 
RUN locale-gen zh_CN.UTF-8
RUN dpkg-reconfigure locales
RUN apt-get autoclean
RUN go env -w GOPROXY='https://goproxy.cn,direct'
RUN bash -x /root/build-grpc-env.sh
RUN bash -x /root/build-kratos-env.sh