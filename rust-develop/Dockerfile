FROM rust:1.80.1

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

ADD os-env.sh build-rust-env.sh /root/

RUN bash /root/os-env.sh
RUN bash /root/build-rust-env.sh
