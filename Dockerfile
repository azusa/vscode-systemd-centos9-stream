FROM centos:7
ENV container docker

RUN yum update -y

RUN yum -y install  wget

# https://github.com/docker/for-mac/issues/6073#issuecomment-1061207986
RUN wget --no-check-certificate https://copr.fedorainfracloud.org/coprs/jsynacek/systemd-backports-for-centos-7/repo/epel-7/jsynacek-systemd-backports-for-centos-7-epel-7.repo -O /etc/yum.repos.d/jsynacek-systemd-centos-7.repo

RUN yum -y update systemd;

RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

RUN adduser vscode
RUN yum -y install sudo git
RUN echo 'vscode ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers

VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
