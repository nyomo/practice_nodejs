FROM debian:trixie

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update

RUN apt-get install -y --no-install-recommends \
    sudo \
    locales \
    ca-certificates \
    git \
    nodejs \
    npm

RUN echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen ja_JP.UTF-8 && \
    dpkg-reconfigure locales && \
    /usr/sbin/update-locale LANG=ja_JP.UTF-8
ENV LANG=ja_JP.UTF-8
ENV LANGUAGE=ja_JP:ja
ENV LC_ALL=ja_JP.UTF-8

RUN groupmod -n macusers dialout
RUN groupadd -g 1100 appgroup && \
    useradd -u 1100 -G appgroup -s /bin/bash -N -M appuser
RUN usermod -aG macusers root
RUN usermod -aG macusers appuser
RUN mkdir /home/appuser
RUN chown -R appuser:appgroup /home/appuser
RUN echo "%appgroup ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/appgroup

USER appuser