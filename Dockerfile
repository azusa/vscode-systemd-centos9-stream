FROM ubuntu:22.04

RUN apt-get update \
&& apt-get install -y init systemd

RUN adduser vagrant
RUN apt-get update -y
RUN apt-get install -y  git sudo
RUN echo 'vagrant ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers


