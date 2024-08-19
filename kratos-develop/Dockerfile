FROM golang:1.23.0

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

ADD os-env.sh build-go-env.sh build-grpc-env.sh build-kratos-env.sh /root/

RUN bash /root/os-env.sh
RUN bash /root/build-go-env.sh
RUN bash /root/build-grpc-env.sh
RUN bash /root/build-kratos-env.sh
