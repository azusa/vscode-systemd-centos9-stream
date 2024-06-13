FROM quay.io/centos/centos:stream9

ENV container docker

RUN dnf -y install systemd git sudo glibc libgcc libstdc++ python ca-certificates tar
RUN adduser vscode || exit 1
RUN echo 'vscode ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers

#VOLUME [ "/sys/fs/cgroup" ]


